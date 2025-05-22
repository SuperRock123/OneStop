package com.example.service;

import com.example.common.config.CaffeineConfig;
import com.example.common.Result;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.mapper.*;
import com.example.utils.TokenUtils;
import com.example.utils.UserCF;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hutool.core.util.ObjectUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.management.relation.Role;
import java.lang.reflect.Executable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;
import com.github.benmanes.caffeine.cache.Cache;

/**
 * 公告信息表业务处理
 **/
@Service
public class GoodsService {

    @Resource
    private GoodsMapper goodsMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private CollectMapper collectMapper;
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private CartMapper cartMapper;
    @Resource
    private OrdersMapper ordersMapper;
    // 商品缓存
    @Autowired
    private Cache<Integer, Goods> goodsCache;
    // 热门商品缓存
    @Autowired
    private Cache<String, List<Goods>> GoodsListCache;

    /**
     * 新增
     */
    public void add(Goods goods) {

        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.BUSINESS.name().equals(currentUser.getRole())) {
            goods.setBusinessId(currentUser.getId());
        }

        goodsMapper.insert(goods);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        goodsCache.invalidate(id);
        goodsMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        goodsCache.invalidateAll(ids);
        for (Integer id : ids) {
            goodsMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Goods goods) {
        goodsCache.invalidate(goods.getId());
        goodsMapper.updateById(goods);
    }

    /**
     * 根据ID查询（带本地缓存）
     */
    public Goods selectById(Integer id) {
        Goods goods = goodsCache.getIfPresent(id);
        if (goods == null) {
            // System.out.println("缓存未命中，查询数据库 id=" + id);
            goods = goodsMapper.selectById(id);
            if (goods != null) {
                goodsCache.put(id, goods);
            }
        }
        // else {
        // System.out.println("缓存命中，直接返回 id=" + id);
        // }
        return goods;
    }

    /**
     * 查询所有
     */
    public List<Goods> selectAll(Goods goods) {
        return goodsMapper.selectAll(goods);
    }

    /**
     * 分页查询
     */
    public PageInfo<Goods> selectPage(Goods goods, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.BUSINESS.name().equals(currentUser.getRole())) {
            goods.setBusinessId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.selectAll(goods);
        return PageInfo.of(list);
    }

    public List<Goods> selectTop15() {
        List<Goods> list = GoodsListCache.getIfPresent("top15");
        if (list == null) {
            // System.out.println("热门商品，缓存未命中，查询数据库");
            list = goodsMapper.selectTop15();
            GoodsListCache.put("top15", list);
        }
        // else {
        //     System.out.println("热门商品，缓存命中，直接返回");
        // }
        return list;
    }

    public List<Goods> selectByTypeId(Integer id) {
        String key = "type_" + id;
        List<Goods> list = GoodsListCache.getIfPresent(key);
        if (list == null) {
            // System.out.println("商品类型，缓存未命中，查询数据库");
            list = goodsMapper.selectByTypeId(id);
            GoodsListCache.put(key, list);
        }
        // else {
        //     System.out.println("商品类型，缓存命中，直接返回");
        // }
        return list;
    }

    public List<Goods> selectByBusinessId(Integer id) {
        return goodsMapper.selectByBusinessId(id);
    }

    public List<Goods> selectByName(String name) {
        String key = "search_" + name;
        List<Goods> list = GoodsListCache.getIfPresent(key);
        if (list == null) {
            // System.out.println("商品名称，缓存未命中，查询数据库");
            list = goodsMapper.selectByName(name);
            GoodsListCache.put(key, list);
        }
        // else {
        //     System.out.println("商品名称，缓存命中，直接返回");
        // }
        return goodsMapper.selectByName(name);
    }

    public List<Goods> recommend() {
        Account currentUser = TokenUtils.getCurrentUser();
        if (ObjectUtil.isEmpty(currentUser)) {
            // 没有用户登录
            return new ArrayList<>();
        }
        // 用户的哪些行为可以认为他跟商品产生了关系？收藏、加入购物车、下单、评论
        // 1. 获取所有的收藏信息
        List<Collect> allCollects = collectMapper.selectAll(null);
        // 2. 获取所有的购物车信息
        List<Cart> allCarts = cartMapper.selectAll(null);
        // 3. 获取所有的订单信息
        List<Orders> allOrders = ordersMapper.selectAllOKOrders();
        // 4. 获取所有的评论信息
        List<Comment> allComments = commentMapper.selectAll(null);
        // 5. 获取所有的用户信息
        List<User> allUsers = userMapper.selectAll(null);
        // 6. 获取所有的商品信息
        List<Goods> allGoods = goodsMapper.selectAll(null);

        // 定义一个存储每个商品和每个用户关系的List
        List<RelateDTO> data = new ArrayList<>();
        // 定义一个存储最后返回给前端的商品List
        List<Goods> recommendResult;
        // 创建一个栅栏，等待所有的异步处理都结束后，再往下走
        CountDownLatch countDownLatch = new CountDownLatch(allCollects.size() * allUsers.size());
        // 创建一个线程池
        ExecutorService threadPool = Executors.newCachedThreadPool();

        // 开始计算每个商品和每个用户之间的关系数据
        for (Goods goods : allGoods) {
            Integer goodsId = goods.getId();
            for (User user : allUsers) {
                threadPool.execute(() -> {

                    Integer userId = user.getId();
                    int index = 1;
                    // 1. 判断该用户有没有收藏该商品，收藏的权重我们给 1
                    Optional<Collect> collectOptional = allCollects.stream()
                            .filter(x -> x.getGoodsId().equals(goodsId) && x.getUserId().equals(userId)).findFirst();
                    if (collectOptional.isPresent()) {
                        index += 1;
                    }
                    // 2. 判断该用户有没有给该商品加入购物车，加入购物车的权重我们给 2
                    Optional<Cart> cartOptional = allCarts.stream()
                            .filter(x -> x.getGoodsId().equals(goodsId) && x.getUserId().equals(userId)).findFirst();
                    if (cartOptional.isPresent()) {
                        index += 2;
                    }
                    // 3. 判断该用户有没有对该商品下过单（已完成的订单），订单的权重我们给 3
                    Optional<Orders> ordersOptional = allOrders.stream()
                            .filter(x -> x.getGoodsId().equals(goodsId) && x.getUserId().equals(userId)).findFirst();
                    if (ordersOptional.isPresent()) {
                        index += 3;
                    }
                    // 4. 判断该用户有没有对该商品评论过，评论的权重我们给 2
                    Optional<Comment> commentOptional = allComments.stream()
                            .filter(x -> x.getGoodsId().equals(goodsId) && x.getUserId().equals(userId)).findFirst();
                    if (commentOptional.isPresent()) {
                        index += 2;
                    }
                    if (index > 1) {
                        RelateDTO relateDTO = new RelateDTO(userId, goodsId, index);
                        data.add(relateDTO);
                    }
                    countDownLatch.countDown();
                });

            }
        }

        try {
            threadPool.shutdown();
            countDownLatch.await();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            // 数据准备结束后，就把这些数据一起喂给这个推荐算法
            List<Integer> goodsIds = UserCF.recommend(currentUser.getId(), data);
            // 把商品id转换成商品
            recommendResult = goodsIds.stream().map(goodsId -> allGoods.stream()
                    .filter(x -> x.getId().equals(goodsId)).findFirst().orElse(null))
                    .limit(10).collect(Collectors.toList());
        }

        // if (CollectionUtil.isEmpty(recommendResult)) {
        // // 随机给它推荐10个
        // return getRandomGoods(10);
        // }
        if (recommendResult.size() < 10) {
            int num = 10 - recommendResult.size();
            List<Goods> list = getRandomGoods(num);
            recommendResult.addAll(list);
        }
        return recommendResult;
    }

    private List<Goods> getRandomGoods(int num) {
        List<Goods> list = new ArrayList<>(num);
        List<Goods> goods = goodsMapper.selectAll(null);
        for (int i = 0; i < num; i++) {
            int index = new Random().nextInt(goods.size());
            list.add(goods.get(index));
        }
        return list;
    }
}