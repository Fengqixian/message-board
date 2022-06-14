<template>
  <el-container>
    <!-- 页面头部内容 -->
    <el-header>
      <div class="dashboard-text">
        <!-- 用户个人头像 -->
        <el-image
          v-if="head !== ''"
          style="width: 50px; height: 50px;border-radius:0;"
          :src="serverPath +'/api/head/portrait/'+ head"
          fit="contain"
        />
        <!-- 用户描述信息 -->
        <div style="padding-top: 10px;">
          <span class="user-info-title-span"><span style="font-size: 24px;font-weight: 900;">{{ name }}</span>  -  {{ email }} <el-button v-if="!isLogined" type="success" size="mini" style="margin-left: 10px;" @click.native="logingDialog = true">登录发表我的留言</el-button> <el-button v-else type="primary" size="mini" style="margin-left: 10px;" @click.native="logout">退出登录</el-button></span>
        </div>
      </div>
    </el-header>
    <!-- 主页面 -->
    <el-main>
      <el-tree
        :data="data"
        node-key="id"
        :props="defaultProps"
        :highlight-current="false"
        :expand-on-click-node="false"
        default-expand-all
      >
        <div slot-scope="{ node, data }" class="custom-tree-node">
          <!-- 留言用户基本信息 -->
          <div class="user-head-portrait-div">
            <el-image
              style="width: 50px; height: 50px"
              :src="serverPath +'/api/head/portrait/'+ data.headPortrait"
              fit="contain"
            /> <span class="user-head-name-span">{{ data.userName }} <span class="user-head-email-span">{{ data.email }}</span></span> </div>
          <!-- 留言内容 -->
          <div class="view-text-div"><span style="font-size: 22px;font-family: fantasy;">{{ node.label }}</span></div>
          <!-- 其他用户评价区域 -->
          <div :class="edit.areaClassName + node.id" hidden style="margin-top: 3vh">
            <el-input
              :id="edit.areaInput + node.id"
              v-model="data.message"
              :focus="true"
              rows="4"
              type="textarea"
              placeholder="请输入内容"
              maxlength="200"
              show-word-limit
            />
          </div>
          <!-- 操作按钮  @blur="areaBlurEvent(node)"-->
          <div class="view-operation-div">
            <el-button :id="edit.button + node.id" class="operation-button" type="text" icon="el-icon-chat-line-round" @click="editEvent(node)" /><el-button :id="edit.submit + node.id" class="operation-button" type="text" icon="el-icon-position" style="display: none" @click="submitEvent(node, data)" /><el-button :id="edit.cancel + node.id" class="operation-button" type="text" icon="el-icon-close" style="display: none" @click="cancelEvent(node)" />
          </div>
          <!-- 留言分割线 -->
          <el-divider content-position="left">{{ data.releasedTime }}</el-divider>
        </div></el-tree>
    </el-main>
    <!-- 登录/注册窗口 -->
    <el-dialog
      :visible.sync="logingDialog"
      :close-on-click-modal="false"
      width="30%"
    >
      <login ref="loginwindow" @closeloginformevent="closeloginformevent" />
    </el-dialog>
  </el-container>
</template>

<script>
import index from '../dashboard/index.js'
export default index
</script>

<style lang="scss" >
.el-tree-node__expand-icon {
  font-size: 24px;
}
.dashboard-text{
  display: inline-flex;
}
.user-info-title-span{
  margin-left: 20px;
  font-weight: 700;
  color: #67C23A
}
.el-image{
  border-radius:25px;
}
.user-head-email-span{
  padding-left: 10px;
  font-weight: 600;
  font-size: 14px;
}
.user-head-name-span{
  margin: 15px;
  font-weight: 900;
  font-size: 20px;
  position: absolute;
}
.el-divider{
  margin-top: 5vh;
}
.operation-button{
  padding-right: 20px;
  font-size: 18px;
}
.view-operation-div{
  float: right;
}
.view-text-div{
  padding-top: 20px;
  width: 70;
  white-space: initial;
}
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 20px;
    line-height: 46px;
  }
}
.el-header,
.el-footer {
  padding-top: 10px;
  text-align: right;
  line-height: 60px;
}
/* .el-main {
  padding: 10vh 40vh 5vh 40vh;
} */

  body > .el-container {
    margin-bottom: 40px;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }

  .custom-tree-node {
    margin-left: 4vh;
    flex: 1;
    display: block;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
  }
  .el-tree-node__content{
    width: auto;
    height: auto;
    word-break:break-all;
  }
</style>
