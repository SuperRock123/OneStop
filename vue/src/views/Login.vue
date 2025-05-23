<template>
  <div class="container">
    <div style="width: 400px; padding: 30px; background-color: white; border-radius: 5px;">
      <!-- 新增 .login-title 样式类 -->
      <div class="login-title">登录OneStop</div>
      <el-form :model="form" :rules="rules" ref="formRef">
        <el-form-item prop="username">
          <el-input prefix-icon="el-icon-user" placeholder="请输入账号" v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input prefix-icon="el-icon-lock" placeholder="请输入密码" show-password  v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-select v-model="form.role" placeholder="请选择角色" style="width: 100%">
            <el-option label="管理员" value="ADMIN"></el-option>
            <el-option label="商家" value="BUSINESS"></el-option>
            <el-option label="用户" value="USER"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <!-- 修改按钮样式 -->
          <el-button style="width: 100%; background-color: #7c3aed; border-color: #7c3aed; color: white" @click="login">登 录</el-button>
        </el-form-item>
        <div style="display: flex; align-items: center">
          <div style="flex: 1"></div>
          <div style="flex: 1; text-align: right">
            还没有账号？请 <a href="/register">注册</a>
         </div>
       </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import anime from 'animejs'; // 引入 animejs

export default {
  name: "Login",
  data() {
    return {
      form: {},
      rules: {
        username: [{ required: true, message: '请输入账号', trigger: 'blur' }],
        password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
        role: [{ required: true, message: '请选择角色', trigger: 'blur' }],
      }
    }
  },
  mounted() {
    // 使用 animejs 添加动画效果
    anime({
      targets: '.login-title',
      translateY: [-20, 0], // 平移动画
      opacity: [0, 1],      // 淡入效果
      duration: 1000,       // 动画持续时间
      easing: 'easeOutExpo' // 缓动函数
    });
  },
  methods: {
    login() {
      this.$refs['formRef'].validate((valid) => {
        if (valid) {
          // 验证通过
          this.$request.post('/login', this.form).then(res => {
            if (res.code === '200') {
              let user = res.data;
              localStorage.setItem("xm-user", JSON.stringify(res.data)); // 存储用户数据
              if (user.role === 'USER') {
                location.href = '/front/home';
              } else {
                location.href = '/home';
              }
              this.$message.success('登录成功');
            } else {
              this.$message.error(res.msg);
            }
          });
        }
      });
    }
  }
}
</script>

<style scoped>
.container {
  height: 100vh;
  overflow: hidden;
  background-image: url("@/assets/imgs/xihuaScenery1.jpg");
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
}
a {
  color: #2a60c9;
}
/* 新增 .login-title 样式类 */
.login-title {
  text-align: center;
  font-size: 24px;
  margin-bottom: 20px;
  color: #8661c7;
}

.el-button {
  background-color: #8661c7;
  border-color: #8661c7;
}
</style>