<template>
  <div class="main-content">
    <div class="main-content-inner">
      <div class="left"></div>
      <div class="center">
        <div class="market-title market-title-animate">
          <span class="char char1">热</span>
          <span class="char char2">门</span>
          <span class="char char3">分</span>
          <span class="char char4">类</span>
        </div>
        <div class="market-section">
          <div class="market-types">
            <div class="type-item" v-for="item in typeData" :key="item.id">
              <img :src="item.img" alt="">
              <div class="type-name">
                <a href="#" @click="navTo('/front/type?id=' + item.id)">{{ item.name }}</a>
              </div>
            </div>
          </div>
          <div class="market-carousel">
            <el-carousel height="22vw" style="border-radius: 1vw">
              <el-carousel-item v-for="item in carousel_top" :key="item">
                <img :src="item" alt="" class="carousel-img">
              </el-carousel-item>
            </el-carousel>
            <div class="market-carousel-row">
              <el-carousel height="13vw" style="border-radius: 0.7vw; width: 48%">
                <el-carousel-item v-for="item in carousel_left" :key="item">
                  <img :src="item" alt="" class="carousel-img-small">
                </el-carousel-item>
              </el-carousel>
              <el-carousel height="13vw" style="border-radius: 0.7vw; width: 48%">
                <el-carousel-item v-for="item in carousel_right" :key="item">
                  <img :src="item" alt="" class="carousel-img-small">
                </el-carousel-item>
              </el-carousel>
            </div>
          </div>
          <div class="market-user-card">
            <div class="user-info">
              <img @click="navTo('/front/person')" :src="user.avatar" alt="">
              <div class="user-name">Hi，{{ user.name }}</div>
            </div>
            <div class="user-banner">
              <img src="@/assets/imgs/618.jpg" alt="">
            </div>
            <div class="user-notice">
              <i class="el-icon-bell"></i>
              <span class="notice-title">公告</span>
              <span class="notice-content">：{{ top }}</span>
            </div>
            <div class="user-links">
              <div class="user-link" @click="navTo('/front/collect')">
                <img src="@/assets/imgs/收藏.png" alt="">
                <div>我的收藏</div>
              </div>
              <div class="user-link" @click="navTo('/front/address')">
                <img src="@/assets/imgs/店铺.png" alt="">
                <div>我的地址</div>
              </div>
              <div class="user-link" @click="navTo('/front/cart')">
                <img src="@/assets/imgs/购物车.png" alt="">
                <div>我的购物车</div>
              </div>
              <div class="user-link" @click="navTo('/front/orders')">
                <img src="@/assets/imgs/订单.png" alt="">
                <div>我的订单</div>
              </div>
            </div>
          </div>
        </div>
        <div class="section-title">热卖商品</div>
        <div class="goods-list">
          <el-row :gutter="30">
            <el-col :span="4" v-for="item in goodsData" :key="'goods-'+item.id">
              <div class="goods-card" @click="navTo('/front/detail?id=' + item.id)">
                <img :src="item.img" alt="">
                <div class="goods-name">{{ item.name }}</div>
                <div class="goods-price">
                  ￥ {{ item.price }}
                  <template v-if="item.unit && item.unit !== ''"> / {{ item.unit }}</template>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
        <div class="section-title">猜你喜欢</div>
        <div class="goods-list">
          <el-row :gutter="30">
            <el-col :span="4" v-for="item in recommendData" :key="'rec-'+item.id">
              <div class="goods-card" @click="navTo('/front/detail?id=' + item.id)">
                <img :src="item.img" alt="">
                <div class="goods-name">{{ item.name }}</div>
                <div class="goods-price">￥ {{ item.price }} / {{ item.unit }}</div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
      <div class="right"></div>
    </div>
  </div>
</template>

<script>
export default {

  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      typeData: [],
      top: null,
      notice: [],
      goodsData: [],
      recommendData: [],
      carousel_top: [
        "https://img13.360buyimg.com/cms/jfs/t1/277154/38/14007/113935/67eb7385F3f2e54f2/28e8fb08d623aa3d.jpg",
        "https://img12.360buyimg.com/cms/jfs/t1/321053/30/342/580692/68234e14F49ec8e2e/ee6dcfc52f5f51a2.jpg",
        "https://img12.360buyimg.com/cms/jfs/t1/273101/3/14052/52397/67eb71b9F8080cc21/d2955015b8b96814.jpg",
        "https://m.360buyimg.com/babel/jfs/t1/308984/32/2956/128972/682db43cF1197dc1e/3375d9c84b4d2bff.jpg.webp"
      ],
      carousel_left: [
        "https://img10.360buyimg.com/n5/s720x720_jfs/t1/296688/20/8995/81758/682d7cb0F16122751/fd2ab44693f2c7b3.jpg.avif",
        "https://img13.360buyimg.com/n5/s720x720_jfs/t1/294073/29/7209/45861/6827500cF98d04054/a4108e125bcb3cf6.png.avif",
        "https://img10.360buyimg.com/n5/s720x720_jfs/t1/295853/17/6372/66168/68271438F8e188f6f/657c6f6633caafe6.jpg.avif"
      ],
      carousel_right: [
        "https://img12.360buyimg.com/n5/s720x720_jfs/t1/295380/33/8695/147143/682c540fF5ba3798d/cb4028f67bc3ac1c.jpg.avif",
        "https://img13.360buyimg.com/n5/s720x720_jfs/t1/313388/21/1564/189737/68276598F845f1686/ed4d9174aaf80d3b.jpg.avif",
        "https://img13.360buyimg.com/n5/s720x720_jfs/t1/297140/10/6781/142150/6825c91cF04ea7f06/73dcc1378635770d.jpg.avif"
      ],
    }
  },
  mounted() {
    this.loadType()
    this.loadNotice()
    this.loadGoods()
    this.loadRecommend()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadRecommend() {
      this.$request.get('/goods/recommend').then(res => {
        if (res.code === '200') {
          this.recommendData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadType() {
      this.$request.get('/type/selectAll').then(res => {
        if (res.code === '200') {
          this.typeData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadNotice() {
      this.$request.get('/notice/selectAll').then(res => {
        this.notice = res.data
        let i = 0
        if (this.notice && this.notice.length) {
          this.top = this.notice[0].content
          setInterval(() => {
            this.top = this.notice[i].content
            i++
            if (i === this.notice.length) {
              i = 0
            }
          }, 2500)
        }
      })
    },
    navToPerson() {
      location.href = '/front/person'
    },
    loadGoods() {
      this.$request.get('/goods/selectTop15').then(res => {
        if (res.code === '200') {
          this.goodsData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    navTo(url) {
      location.href = url
    },
  }
}
</script>

<style scoped>
.main-content {
  min-height: 100vh;
  background-size: 100%;
  display: flex;
  justify-content: center;
}

.main-content-inner {
  display: flex;
  width: 96vw;
  max-width: 1600px;
  margin: 0 auto;
  min-height: 100vh;
}
.center {
  width: 100%;
  min-width: 800px;
  background: #fff;
  min-height: 100vh;
  padding: 0vw 2vw 3vw 2vw;
  box-sizing: border-box;
  border-radius: 1vw;
  box-shadow: 0 0 16px #e0e0e0;
}

.market-title {
  color: #FE0137FF;
  margin: 1vw 0 1.5vw 0;
  font-weight: bold;
  font-size: 1.5vw;
  letter-spacing: 2px;
}

.market-section {
  display: flex;
  flex-direction: row;
  gap: 2vw;
  margin-bottom: 2vw;
}

.market-types {
  flex: 2;
  display: flex;
  flex-direction: column;
  gap: 1vw;
  margin-top: 0.5vw;
}

.type-item {
  display: flex;
  align-items: center;
  gap: 0.7vw;
}

.type-item img {
  height: 1.5vw;
  min-height: 20px;
  width: 1.5vw;
  min-width: 20px;
}

.type-name a {
  font-size: 1vw;
  color: #333;
  text-decoration: none;
  transition: color 0.2s;
}

.type-name a:hover {
  color: #7c3aed;
}

.market-carousel {
  flex: 5;
  display: flex;
  flex-direction: column;
  gap: 1vw;
}

.carousel-img {
  width: 100%;
  height: 22vw;
  min-height: 200px;
  border-radius: 1vw;
  object-fit: cover;
}

.market-carousel-row {
  display: flex;
  flex-direction: row;
  gap: 4%;
  margin-top: 0.5vw;
}

.carousel-img-small {
  width: 100%;
  height: 13vw;
  min-height: 100px;
  border-radius: 0.7vw;
  object-fit: cover;
}

.market-user-card {
  flex: 3;
  background: #F3F3F3FF;
  margin-top: 0.5vw;
  border-radius: 1vw;
  padding: 2vw 1vw;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-width: 220px;
  max-width: 320px;
  box-sizing: border-box;
}

.user-info {
  text-align: center;
}

.user-info img {
  width: 6vw;
  min-width: 60px;
  height: 6vw;
  min-height: 60px;
  border-radius: 50%;
  border: 2px solid #ececec;
  cursor: pointer;
}

.user-name {
  margin-top: 0.7vw;
  font-size: 1.1vw;
  font-weight: 500;
}

.user-banner img {
  margin-top: 1vw;
  width: 100%;
  height: 8vw;
  min-height: 80px;
  border-radius: 1vw;
  object-fit: cover;
}

.user-notice {
  margin: 1vw 0 0 0;
  width: 100%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  font-size: 1vw;
}

.notice-title {
  font-weight: bold;
  margin-left: 0.3vw;
}

.notice-content {
  color: #666;
  margin-left: 0.2vw;
}

.user-links {
  display: flex;
  justify-content: space-between;
  margin-top: 2vw;
  width: 100%;
}

.user-link {
  flex: 1;
  text-align: center;
  cursor: pointer;
}

.user-link img {
  height: 2vw;
  min-height: 24px;
  width: 2vw;
  min-width: 24px;
}

.user-link div {
  margin-top: 0.3vw;
  font-size: 0.95vw;
}

.section-title {
  margin: 2.5vw 0 1vw 0;
  height: 2.5vw;
  min-height: 36px;
  background-color: rgb(236, 126, 126);
  font-size: 1.3vw;
  color: white;
  width: 10vw;
  min-width: 120px;
  font-weight: bold;
  line-height: 2.5vw;
  text-align: center;
  border-radius: 1.2vw;
  letter-spacing: 2px;
}

.goods-list {
  margin: 0 0 1vw 0;
}

.goods-card {
  background: #fff;
  border-radius: 1vw;
  box-shadow: 0 2px 8px #ececec;
  padding: 1vw 0.5vw 1.2vw 0.5vw;
  margin-bottom: 1vw;
  cursor: pointer;
  transition: box-shadow 0.2s;
  text-align: center;
}

.goods-card:hover {
  box-shadow: 0 4px 16px #d1c4e9;
}

.goods-card img {
  width: 80%;
  height: 11vw;
  min-height: 120px;
  border-radius: 0.7vw;
  border: #cccccc 1px solid;
  object-fit: cover;
}

.goods-name {
  margin-top: 0.7vw;
  font-weight: 500;
  font-size: 1.1vw;
  color: #000;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}

.goods-price {
  margin-top: 0.3vw;
  font-size: 1.2vw;
  color: rgb(225, 52, 52);
}

@media (max-width: 1400px) {
  .main-content-inner {
    width: 99vw;
  }

  .center {
    width: 100%;
    padding: 1vw 0.5vw 2vw 0.5vw;
  }
}
.market-title-animate {
  display: flex;
  gap: 0.2vw;
  font-size: 2vw;
  font-weight: bold;
  letter-spacing: 0.2vw;
}

.char {
  display: inline-block;
  animation: floatY 1.2s ease-in-out infinite alternate;
  color: #7c3aed;
  transition: color 0.3s;
  cursor: pointer;
}

.char1 { animation-delay: 0s; color: #7c3aed; }
.char2 { animation-delay: 0.2s; color: #a78bfa; }
.char3 { animation-delay: 0.4s; color: #c4b5fd; }
.char4 { animation-delay: 0.6s; color: #8b5cf6; }

</style>