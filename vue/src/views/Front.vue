<template>
  <div class="front-pc-wrapper">
    <div class="front-notice"><i class="el-icon-bell" style="margin-right: 2px"></i>公告：{{ top }}</div>
    <!--头部-->
    <div class="front-header">
      <div class="front-header-left" @click="navTo('/front/home')">
        <img src="@/assets/imgs/logo1.png" alt="">
        <div class="title">OneStop</div>
      </div>
      <div class="front-header-center">
        <el-input class="search-input" placeholder="请输入商品名称" v-model="name"></el-input>
        <el-button type="primary" class="search-btn" @click="search">搜索</el-button>
      </div>
      <div class="front-header-right">
        <div v-if="!user.username">
          <el-button @click="$router.push('/login')">登录</el-button>
          <el-button @click="$router.push('/register')">注册</el-button>
        </div>
        <div v-else>
          <el-dropdown>
            <div class="front-header-dropdown">
              <img @click="navTo('/front/person')" :src="user.avatar" alt="">
              <div style="margin-left: 10px">
                <span>{{ user.name }}</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
              </div>
            </div>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/cart')">我的购物车</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/collect')">我的收藏</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/address')">我的地址</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/orders')">我的订单</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="logout">退出</div>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
    </div>
    <!--主体-->
    <div class="main-body">
      <router-view ref="child" @update:user="updateUser" />
    </div>
  </div>
</template>

<script>

export default {
  name: "FrontLayout",

  data () {
    return {
      top: '',
      notice: [],
      user: JSON.parse(localStorage.getItem("xm-user") || '{}'),
      name: ''
    }
  },

  mounted() {
    this.loadNotice()
  },
  methods: {
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
    updateUser() {
      this.user = JSON.parse(localStorage.getItem('xm-user') || '{}')   // 重新获取下用户的最新信息
    },
    navTo(url) {
      location.href = url
    },
    // 退出登录
    logout() {
      localStorage.removeItem("xm-user");
      this.$router.push("/login");
    },
    search() {
      let name = this.name ? this.name : ''
      console.log(name)
      if(!name) {
        this.$message({
          message: '请输入商品名称',
          type: 'warning'
        })
        return
      }
      location.href = '/front/search?name=' + name
    }
  }

}
</script>

<style scoped>
.front-pc-wrapper {
  width: 100vw;
  min-width: 1200px;
  max-width: 100vw;
  margin: 0;
  background: #fff;
  min-height: 100vh;
  box-shadow: 0 0 16px #e0e0e0;
  padding-bottom: 2vw;
}
.front-notice {
  background: #f5f5f5;
  color: #333;
  font-size: 1.1vw;
  padding: 0.7vw 3vw;
  border-bottom: 1px solid #ececec;
  letter-spacing: 1px;
}
.front-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 6vw;
  min-height: 60px;
  padding: 0 3vw;
  background: #fff;
  border-bottom: 1px solid #ececec;
}
.front-header-left {
  display: flex;
  align-items: center;
  cursor: pointer;
}
.front-header-left img {
  width: 3vw;
  min-width: 40px;
  height: 3vw;
  min-height: 40px;
}
.front-header-left .title {
  font-size: 2vw;
  min-width: 80px;
  font-weight: bold;
  margin-left: 1vw;
  color: #7c3aed;
  letter-spacing: 2px;
}
.front-header-center {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
}
.search-input {
  width: 16vw;
  min-width: 180px;
  max-width: 320px;
}
.search-btn {
  margin-left: 0.7vw;
}
.front-header-right {
  display: flex;
  align-items: center;
  min-width: 180px;
  justify-content: flex-end;
}
.front-header-dropdown {
  display: flex;
  align-items: center;
  cursor: pointer;
}
.front-header-dropdown img {
  width: 2.5vw;
  min-width: 36px;
  height: 2.5vw;
  min-height: 36px;
  border-radius: 50%;
  border: 1px solid #ececec;
}
.main-body {
  padding: 2vw 2vw 0 2vw;
  min-height: 700px;
  background: #fafbfc;
}
@media (max-width: 1400px) {
  .front-pc-wrapper {
    min-width: 900px;
  }
  .main-body, .front-header, .front-notice {
    padding-left: 1vw;
    padding-right: 1vw;
  }
}
</style>