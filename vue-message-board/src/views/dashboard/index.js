import { mapGetters } from 'vuex'
import login from '../login/index'
import store from '@/store'
import { messageList, addMessage } from '@/api/message'

export default {
  name: 'Dashboard',
  components: { login },
  computed: {
    ...mapGetters(['name', 'email', 'head'])
  },
  data() {
    return {
      serverPath: process.env.VUE_APP_BASE_API,
      // 是否已登录状态
      isLogined: false,
      // 登录窗口
      logingDialog: false,
      edit: {
        // 编辑状态
        state: false,
        // 动态评论区名称
        areaClassName: 'view-operation-div-',
        // 编辑按钮
        button: 'operation-button-',
        // 提交按钮
        submit: 'submit-',
        // 取消按钮
        cancel: 'cancel-',
        // 用户输入文本框
        areaInput: 'view-operation-area-'
      },
      data: [],
      defaultProps: {
        children: 'children',
        label: 'messageContent'
      }
    }
  },
  watch: {
    logingDialog() {
      const win = this.$refs.loginwindow
      if (win !== undefined) {
        this.$refs.loginwindow.rest()
      }
    }
  },
  /**
   * 监听全局单击事件
   */
  mounted: function() {
    if (this.email != null && this.email !== '') {
      this.isLogined = true
    }
    // 加载留言板数据
    this.loadMessageList()
  },
  methods: {
    /**
     * 用户编辑事件
     * @param {} node 点击节点内容
     */
    editEvent(node) {
      if (this.isLogined) {
        this.clickEditEvent(node)
      } else {
        this.logingDialog = true
      }
    },
    closeEditEvent(node) {
      // 关闭编辑界面
      this.edit.state = false
      this.$el.getElementsByClassName(this.edit.areaClassName + node.id)[0].hidden = true
      document.getElementById(this.edit.button + node.id).children[0].style.display = ''
      document.getElementById(this.edit.submit + node.id).style.display = 'none'
      document.getElementById(this.edit.cancel + node.id).style.display = 'none'
    },
    /**
     * 点击编辑按钮时触发事件
     * @param {} node
     */
    clickEditEvent(node) {
      // 展示编辑界面
      this.edit.state = true
      this.$el.getElementsByClassName(this.edit.areaClassName + node.id)[0].hidden = false
      document.getElementById(this.edit.areaInput + node.id).focus()
      document.getElementById(this.edit.button + node.id).children[0].style.display = 'none'
      document.getElementById(this.edit.submit + node.id).style.display = ''
      document.getElementById(this.edit.cancel + node.id).style.display = ''
    },
    /**
     * 退出登录
     */
    async logout() {
      await this.$store.dispatch('user/logout')
      this.isLogined = false
    },
    /**
     * 登录成功关闭窗口事件（子组件调用）
     */
    async closeloginformevent() {
      // get user info
      await store.dispatch('user/getInfo')
      this.isLogined = true
      this.logingDialog = false
    },
    loadMessageList() {
      messageList().then(res => {
        this.data = res.data
      })
    },
    submitEvent(node, data) {
      addMessage({ 'messageContent': data.message, 'parentId': data.id }).then(res => {
        this.closeEditEvent(node)
        this.loadMessageList()
      }).catch(err => {
        console.log(err)
      })
    },
    cancelEvent(node) {
      this.closeEditEvent(node)
    }
  }
}
