<template>
  <div class="login-container">
    <div v-if="formType" class="title-container">
      <h3 class="title">Sign in to Message board</h3>
      <el-form
        key="login"
        ref="loginForm"
        :model="loginForm"
        class="login-form"
        label-position="left"
      >
        <el-form-item>
          <span class="svg-container">
            <svg-icon icon-class="user" />
          </span>
          <el-input
            ref="username"
            v-model="loginForm.userName"
            placeholder="Username/Email"
            name="username"
            type="text"
          />
        </el-form-item>

        <el-form-item>
          <span class="svg-container">
            <svg-icon icon-class="password" />
          </span>
          <el-input
            :key="passwordType"
            ref="password"
            v-model="loginForm.password"
            :type="passwordType"
            placeholder="Password"
            name="password"
            @keyup.enter.native="handleLogin"
          />
          <span class="show-pwd" @click="showPwd">
            <svg-icon
              :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'"
            />
          </span>
        </el-form-item>
      </el-form>
      <div style="display: flex">
        <el-checkbox
          v-model="loginForm.rememberMe"
          style="width: 40vh; margin: 0 auto"
        >Remember Me.</el-checkbox>
      </div>
      <div style="display: flex; margin-top: 2vh">
        <el-button
          type="success"
          :loading="loading"
          style="width: 40vh; margin: 0 auto"
          @click.native.prevent="handleLogin"
        >sign in</el-button>
      </div>
      <div style="display: flex">
        <el-button
          style="margin: 0 auto"
          type="text"
          @click="formType = false"
        >New to Message board? Create an account.</el-button>
      </div>
    </div>
    <div v-else class="title-container">
      <h3 class="title">Register a Message board account.</h3>
      <el-form
        key="register"
        ref="registerForm"
        :model="registerForm"
        :rules="registerRules"
        class="login-form"
        label-position="left"
      >
        <el-form-item prop="userName">
          <span class="svg-container">
            <svg-icon icon-class="user" />
          </span>
          <el-input
            ref="username"
            v-model="registerForm.userName"
            placeholder="Username"
            name="username"
            type="text"
          />
        </el-form-item>

        <el-form-item prop="email">
          <span class="svg-container">
            <svg-icon icon-class="email" />
          </span>
          <el-input
            ref="email"
            v-model="registerForm.email"
            placeholder="Email"
            name="email"
            type="text"
          />
        </el-form-item>

        <el-form-item prop="password">
          <span class="svg-container">
            <svg-icon icon-class="password" />
          </span>
          <el-input
            ref="password"
            v-model="registerForm.password"
            type="Password"
            placeholder="Password"
            name="password"
          />
        </el-form-item>
        <el-form-item prop="confirmPassword">
          <span class="svg-container">
            <svg-icon icon-class="password" />
          </span>
          <el-input
            ref="password"
            v-model="registerForm.confirmPassword"
            type="Password"
            placeholder="Confirm Password"
            name="password"
          />
        </el-form-item>
      </el-form>
      <div style="display: flex; margin-top: 2vh">
        <el-button
          type="primary"
          :loading="loading"
          style="width: 40vh; margin: 0 auto"
          @click.native.prevent="handleRegister"
        >Continue</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import { validUsername, validPassword, validEmail } from '@/utils/validate'
import { register, exist } from '@/api/user'
export default {
  name: 'Login',
  data() {
    const _this = this
    const validateUsername = (rule, value, callback) => {
      if (!validUsername(value)) {
        callback(new Error('只能使用字母和数字,长度在5~20之间'))
      } else {
        exist(value).then(res => {
          if (res.data) {
            callback(new Error('此账号已存在请重新创建'))
          } else {
            callback()
          }
        })
      }
    }
    const validateEmail = (rule, value, callback) => {
      if (!validEmail(value)) {
        callback(new Error('请输入正确的邮箱'))
      } else {
        callback()
      }
    }
    const validatePassword = (rule, value, callback) => {
      if (!validPassword(value)) {
        callback(
          new Error(
            '长度在8~20之间,至少包含一个大写、一个小写、一个数字、一个特殊符号'
          )
        )
      } else {
        callback()
      }
    }
    const validateConfirmPassword = (rule, value, callback) => {
      const paw = _this.$data.registerForm.password
      if (!validPassword(paw)) {
        callback(
          new Error(
            '长度在8~20之间,至少包含一个大写、一个小写、一个数字、一个特殊符号'
          )
        )
      }
      if (value !== paw) {
        callback(new Error('两次输入的密码不一致'))
      } else {
        callback()
      }
    }
    return {
      // 表单类型 true ：登录表单 false : 注册表单
      formType: true,
      loginForm: {
        userName: null,
        password: null,
        rememberMe: false
      },
      registerForm: {
        userName: null,
        email: null,
        password: null,
        confirmPassword: null
      },
      registerRules: {
        userName: [
          { required: true, trigger: 'blur', validator: validateUsername }
        ],
        email: [{ required: true, trigger: 'blur', validator: validateEmail }],
        password: [
          { required: true, trigger: 'blur', validator: validatePassword }
        ],
        confirmPassword: [
          { required: true, trigger: 'blur', validator: validateConfirmPassword
          }
        ]
      },
      loading: false,
      passwordType: 'password',
      redirect: undefined,
      nameExist: false
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  methods: {
    /**
     * 检查用户名称是否已经存在
     * @param {String} name
     */
    async checkNameExist(name) {
      const result = await exist(name)
      this.nameExist = result.data
    },
    /**
     * 重置内容
     */
    rest() {
      Object.assign(this.$data, this.$options.data.call(this))
    },
    /**
     * 展示输入密码
     */
    showPwd() {
      if (this.passwordType === 'password') {
        this.passwordType = ''
      } else {
        this.passwordType = 'password'
      }
      this.$nextTick(() => {
        this.$refs.password.focus()
      })
    },
    /**
     * 登录
     */
    handleLogin() {
      const _this = this
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true
          this.$store
            .dispatch('user/login', this.loginForm)
            .then(() => {
              this.loading = false
              _this.$emit('closeloginformevent')
            })
            .catch(err => {
              console.log(err)
              this.loading = false
            })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    /**
     * 注册
     */
    handleRegister() {
      const _this = this
      this.$refs.registerForm.validate((valid) => {
        if (valid) {
          this.loading = true
          register(this.registerForm)
            .then(() => {
              this.$message({
                showClose: true,
                message: '注册成功',
                type: 'success'
              })
              _this.loading = false
              _this.formType = true
            })
            .catch(() => {
              _this.loading = false
            })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    }
  }
}
</script>

<style lang="scss">
.login-form {
  position: relative;
  width: 520px;
  max-width: 100%;
  padding: 30px 35px 0;
  margin: 0 auto;
  overflow: hidden;
}
.title-container {
  position: relative;
  .title {
    font-size: 26px;
    margin: 0px auto 40px auto;
    text-align: center;
    font-weight: bold;
  }
}
.show-pwd {
  position: absolute;
  right: 10px;
  top: 7px;
  font-size: 16px;
  cursor: pointer;
  user-select: none;
}
.el-input {
  display: inline-block;
  height: 47px;
  width: 85%;

  input {
    background: transparent;
    border: 0px;
    -webkit-appearance: none;
    border-radius: 0px;
    padding: 12px 5px 12px 15px;
    color: #909399;
    height: 47px;
    caret-color: #909399;

    &:-webkit-autofill {
      box-shadow: 0 0 0px 1000px #fff inset !important;
      -webkit-text-fill-color: #909399 !important;
    }
  }
}
.el-form-item {
  border: 1px solid #909399;
  border-radius: 20px;
}
.svg-container {
  padding-left: 12px;
}
</style>
