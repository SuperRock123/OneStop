<template>
  <div class="main-content">
    <div style="width: 60%; background-color: white; min-height: 1000px; margin: 20px auto; border-radius: 20px">
      <div style="padding: 15px 20px">
        <el-row :gutter="20">
          <el-col :span="12">
            <img :src="goodsData.img" alt="" style="width: 100%; height: 400px; border-radius: 20px">
          </el-col>
          <el-col :span="12">
            <div
              style="font-size: 20px; font-weight: 900; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
              {{ goodsData.name }}</div>
            <div style="color: #666666FF; margin-top: 5px">销量：{{ goodsData.count }}</div>
            <div style="color: red; margin-top: 15px">疯抢价：<span style="font-size: 20px">{{ goodsData.price }} /
                {{ goodsData.unit }}</span></div>
            <div style="margin-top: 20px">
            </div>

            <div style="color: #666666FF; margin-top: 20px">商家：<a href="#"
                @click="navTo('/front/business?id=' + goodsData.businessId)">{{ goodsData.businessName }}</a></div>
            <div style="color: #666666FF; margin-top: 20px">分类：<a href="#"
                @click="navTo('/front/type?id=' + goodsData.typeId)">{{ goodsData.typeName }}</a></div>
            <div style="color: #666666FF; margin-top: 20px">
              <el-button type="warning" @click="addCart">加入购物车</el-button>
              <el-button type="warning" @click="collect">收藏</el-button>
            </div>
          </el-col>
        </el-row>
      </div>
      <div style="position: absolute; right: 0; top: 90px; width: 250px; padding: 0 20px; border-left: #cccccc 1px solid">
        <div style="font-size: 18px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid">猜你喜欢</div>
        <div style="margin: 20px 0; padding: 0 10px">
          <div style="margin-bottom: 20px" v-for="item in recommendData">
            <img @click="navTo('/front/detail?id=' + item.id)" :src="item.img" alt=""
              style="width: 100%; height: 175px; border-radius: 10px; border: #cccccc 1px solid">
            <div
              style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 180px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
              {{ item.name }}</div>
            <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{ item.price }} / {{ item.unit }}</div>
          </div>
        </div>
      </div>
      <div style="padding: 15px 20px">
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane label="宝贝详情" name="first">
            <div style="padding: 10px 175px" v-html="goodsData.description"></div>
          </el-tab-pane>
          <el-tab-pane label="宝贝评价" name="second">
            <div style="margin-top: 10px">
              <div style="margin-top: 20px" v-for="item in commentData">
                <div style="display: flex">
                  <div style="width: 40px">
                    <img :src="item.userAvatar" alt="" style="height: 40px; width: 40px; border-radius: 50%">
                  </div>
                  <div style="width: 200px; margin-left: 10px">
                    <div style="font-weight: 700; font-size: 17px; color: #000000FF">{{ item.userName }}</div>
                    <div style="color: #7A7A7AFF">{{ item.time }}</div>
                  </div>
                </div>
                <div style="margin-top: 15px; font-size: 16px">{{ item.content }}</div>
              </div>
            </div>
          </el-tab-pane>

        </el-tabs>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      goodsId: this.$route.query.id,
      goodsData: {},
      activeName: 'first',
      searchResults: [],
      recommendData: []
    }
  },
  mounted() {
    this.loadGoods()
    this.loadComments()
    this.loadSearchResults()
    this.loadRecommend()
  },
  methods: {
    loadGoods() {
      this.$request.get('/goods/selectById?id=' + this.goodsId).then(res => {
        if (res.code === '200') {
          this.goodsData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleClick(tab, event) {
      this.activeName = tab.name

    },
    collect() {
      let data = {
        userId: this.user.id,
        businessId: this.goodsData.businessId,
        goodsId: this.goodsId
      }
      this.$request.post('/collect/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('收藏成功')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    addCart() {
      let data = {
        num: 1, userId: this.user.id,
        goodsId: this.goodsId,
        businessId: this.goodsData.businessId
      }
      this.$request.post('/cart/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('操作成功')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    navTo(url) {
      location.href = url
    },
    loadComments() {
      this.$request.get('/comment/selectByGoodsId?id=' + this.goodsId).then(res => {
        if (res.code === '200') {
          this.commentData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadSearchResults() {
      this.$request.get('/goods/selectByName?name=' + this.goodsData.name).then(res => {
        if (res.code === '200') {
          this.searchResults = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadRecommend() {
      this.$request.get('/goods/recommend').then(res => {
        if (res.code === '200') {
          this.recommendData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
  }
}
</script>