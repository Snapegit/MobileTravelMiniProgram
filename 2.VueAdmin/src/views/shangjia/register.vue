<template>
	<div>
		<div class="register_view">
			<el-form :model="registerForm" class="register_form">
				<div class="title_view">{{projectName}}注册</div>
				<div class="list_item">
					<div class="list_label">商家账号：</div>
					<el-input class="list_inp"
						 v-model="registerForm.shangjiazhanghao" 
						 placeholder="请输入商家账号"
						 type="text"
						/>
				</div>
				<div class="list_item">
					<div class="list_label">商家密码：</div>
					<el-input class="list_inp"
						 v-model="registerForm.shangjiamima" 
						 placeholder="请输入商家密码"
						 type="password"
						 />
				</div>
				<div class="list_item">
					<div class="list_label">确认商家密码：</div>
					<el-input class="list_inp" v-model="registerForm.shangjiamima2" type="password" placeholder="请输入确认商家密码" />
				</div>
				<div class="list_item">
					<div class="list_label">商家名称：</div>
					<el-input class="list_inp"
						 v-model="registerForm.shangjiamingcheng" 
						 placeholder="请输入商家名称"
						 type="text"
						/>
				</div>
				<div class="list_item">
					<div class="list_label">商家地址：</div>
					<el-input class="list_inp"
						 v-model="registerForm.shangjiadizhi" 
						 placeholder="请输入商家地址"
						 type="text"
						/>
				</div>
				<div class="list_item">
					<div class="list_label">联系电话：</div>
					<el-input class="list_inp"
						 v-model="registerForm.lianxidianhua" 
						 placeholder="请输入联系电话"
						 type="text"
						/>
				</div>
				<div class="list_item">
					<div class="list_label">联系人：</div>
					<el-input class="list_inp"
						 v-model="registerForm.lianxiren" 
						 placeholder="请输入联系人"
						 type="text"
						/>
				</div>
				<div class="list_btn">
					<el-button class="register" type="success" @click="handleRegister">注册</el-button>
					<div class="r-login" @click="close">已有账号，直接登录</div>
				</div>
			</el-form>
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context?.$project.projectName
	//获取注册类型
	import { useRoute } from 'vue-router';
	const route = useRoute()
	const tableName = ref('shangjia')
	
	const registerForm = ref({
	})
	const init=()=>{
	}
	// 多级联动参数
	//注册按钮
	const handleRegister = () => {
		let url = tableName.value +"/register";
		if((!registerForm.value.shangjiazhanghao)){
			context?.$toolUtil.message(`商家账号不能为空`,'error')
			return false
		}
		if((!registerForm.value.shangjiamima)){
			context?.$toolUtil.message(`商家密码不能为空`,'error')
			return false
		}
		if((!registerForm.value.shangjiamingcheng)){
			context?.$toolUtil.message(`商家名称不能为空`,'error')
			return false
		}
		if(registerForm.value.lianxidianhua&&(!context?.$toolUtil.isMobile(registerForm.value.lianxidianhua))){
			context?.$toolUtil.message(`联系电话应输入手机格式`,'error')
			return false
		}
		
		context?.$http({
			url:url,
			method:'post',
			data:registerForm.value
		}).then(res=>{
			context?.$toolUtil.message('注册成功','success', obj=>{
				context?.$router.push({
					path: "/login"
				});
			})
		})
	}
	//公共方法
	const getUUID=()=> {
		return new Date().getTime();
	}
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
	init()
</script>
<style lang="scss" scoped>
	
	.register_view {
		background-repeat: no-repeat;
		flex-direction: column;
		background-size: 100%100%;
		display: flex;
		min-height: 100vh;
		justify-content: center;
		position: relative;
		background-position: center center;
		background-image: url(http://clfile.zggen.cn/20230925/88e54ac25f9d4aa883e39f7d74b4c859.png);
		// 表单盒子
		.register_form {
			border-radius: 0px;
			padding: 30px 20px;
			box-shadow: rgb(255, 181, 137) 0px 4px 20px 0px;
			margin: 30px 0px 30px 58vw;
			flex-direction: column;
			background: #fff;
			display: flex;
			width: 34.8vw;
			box-sizing: border-box;
		}
		// 标题样式
		.title_view {
			padding: 0px;
			margin: 0 auto 20px;
			color: #5d5b5c;
			font-weight: 600;
			width: 80%;
			font-size: 26px;
			text-align: center;
		}
		// item盒子
		.list_item {
			margin: 10px auto;
			display: flex;
			width: 80%;
			justify-content: flex-start;
			align-items: center;
			// label
			.list_label {
				color: #666;
				width: 70px;
				font-size: 14px;
				box-sizing: border-box;
				text-align: left;
			}
			// 输入框
			:deep(.list_inp) {
				border: 1px solid #ddd;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 80%;
				line-height: 32px;
				box-sizing: border-box;
				height: 32px;
				//去掉默认样式
				.el-input__wrapper{
					border: none;
					box-shadow: none;
					background: none;
					border-radius: 0;
					height: 100%;
					padding: 0;
				}
				.is-focus {
					box-shadow: none !important;
				}
			}
		}
		//按钮盒子
		.list_btn {
			margin: 10px auto;
			display: flex;
			width: 80%;
			align-items: center;
			flex-wrap: wrap;
			//注册按钮
			.register {
					border: none;
					border-radius: 4px;
					margin: 20px auto 0;
					color: #fff;
					background: #D09D7D;
					font-weight: 700;
					width: 80%;
					font-size: 16px;
					height: 40px;
			}
			//注册按钮悬浮样式
			.register:hover {
				border: none;
				margin: 20px auto 0;
				background: #D09D7D;
				font-weight: 700;
				width: 80%;
				font-size: 16px;
				height: 40px;
			}
			//已有账号
			.r-login {
				cursor: pointer;
				margin: 10px auto;
				color: #999;
				width: 80%;
				font-size: 14px;
				text-align: center;
			}
		}
	}
</style>