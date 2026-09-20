<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="房间名称" prop="fangjianmingcheng">
							<el-input class="list_inp" v-model="form.fangjianmingcheng" placeholder="房间名称"
								 type="text" 								:readonly="!isAdd||disabledForm.fangjianmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="房间类型" prop="fangjianleixing">
							<el-input class="list_inp" v-model="form.fangjianleixing" placeholder="房间类型"
								 type="text" 								:readonly="!isAdd||disabledForm.fangjianleixing?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="酒店类型" prop="jiudianleixing">
							<el-input class="list_inp" v-model="form.jiudianleixing" placeholder="酒店类型"
								 type="text" 								:readonly="!isAdd||disabledForm.jiudianleixing?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="房间地址" prop="fangjiandizhi">
							<el-input class="list_inp" v-model="form.fangjiandizhi" placeholder="房间地址"
								 type="text" 								:readonly="!isAdd||disabledForm.fangjiandizhi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="一晚价格" prop="yiwanjiage">
							<el-input class="list_inp" v-model.number="form.yiwanjiage" placeholder="一晚价格"
								 type="number" 								:readonly="!isAdd||disabledForm.yiwanjiage?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="预定天数" prop="yudingtianshu">
							<el-input class="list_inp" v-model.number="form.yudingtianshu" placeholder="预定天数"
								 type="text" 								:readonly="!isAdd||disabledForm.yudingtianshu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="总价" prop="zongjia">
							<el-input class="list_inp" v-model="zongjia" :readonly="true" placeholder="总价" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="服务电话" prop="fuwudianhua">
							<el-input class="list_inp" v-model="form.fuwudianhua" placeholder="服务电话"
								 type="text" 								:readonly="!isAdd||disabledForm.fuwudianhua?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="预定时间" prop="yudingshijian">
							<el-date-picker
								class="list_date"
								v-model="form.yudingshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.yudingshijian?true:false"
								placeholder="请选择预定时间" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="用户账号" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="用户账号"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="用户姓名" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="商家账号" prop="shangjiazhanghao">
							<el-input class="list_inp" v-model="form.shangjiazhanghao" placeholder="商家账号"
								 type="text" 								:readonly="!isAdd||disabledForm.shangjiazhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="商家名称" prop="shangjiamingcheng">
							<el-input class="list_inp" v-model="form.shangjiamingcheng" placeholder="商家名称"
								 type="text" 								:readonly="!isAdd||disabledForm.shangjiamingcheng?true:false" />
						</el-form-item>
					</el-col>

				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'jiudianyuding'
	const formName = '酒店预定'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		fangjianmingcheng : false,
		fangjianleixing : false,
		jiudianleixing : false,
		fangjiandizhi : false,
		yiwanjiage : false,
		yudingtianshu : false,
		zongjia : false,
		fuwudianhua : false,
		yudingshijian : false,
		yonghuzhanghao : false,
		yonghuxingming : false,
		ispay : false,
		sfsh : false,
		shhf : false,
		shangjiazhanghao : false,
		shangjiamingcheng : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		fangjianmingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		fangjianleixing: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		jiudianleixing: [
		],
		fangjiandizhi: [
		],
		yiwanjiage: [
			{required: true,message: '请输入',trigger: 'blur'}, 
			{ validator: validateNumber, trigger: 'blur' },
		],
		yudingtianshu: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		zongjia: [
		],
		fuwudianhua: [
			{ validator: validateMobile, trigger: 'blur' },
		],
		yudingshijian: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		ispay: [
		],
		sfsh: [
		],
		shhf: [
		],
		shangjiazhanghao: [
		],
		shangjiamingcheng: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const zongjia =computed(()=>{
		let c = form.value
		let a = c.yiwanjiage*c.yudingtianshu
		form.value.zongjia = a?a.toFixed(2) : 0
		return a?a.toFixed(2) : 0
	})
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			fangjianmingcheng: '',
			fangjianleixing: '',
			jiudianleixing: '',
			fangjiandizhi: '',
			yiwanjiage: '',
			yudingtianshu: '',
			zongjia: '',
			fuwudianhua: '',
			yudingshijian: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			ispay: '未支付',
			sfsh: '待审核',
			shhf: '',
			shangjiazhanghao: '',
			shangjiamingcheng: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.yudingshijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='fangjianmingcheng'){
					form.value.fangjianmingcheng = row[x];
					disabledForm.value.fangjianmingcheng = true;
					continue;
				}
				if(x=='fangjianleixing'){
					form.value.fangjianleixing = row[x];
					disabledForm.value.fangjianleixing = true;
					continue;
				}
				if(x=='jiudianleixing'){
					form.value.jiudianleixing = row[x];
					disabledForm.value.jiudianleixing = true;
					continue;
				}
				if(x=='fangjiandizhi'){
					form.value.fangjiandizhi = row[x];
					disabledForm.value.fangjiandizhi = true;
					continue;
				}
				if(x=='yiwanjiage'){
					form.value.yiwanjiage = row[x];
					disabledForm.value.yiwanjiage = true;
					continue;
				}
				if(x=='yudingtianshu'){
					form.value.yudingtianshu = row[x];
					disabledForm.value.yudingtianshu = true;
					continue;
				}
				if(x=='zongjia'){
					form.value.zongjia = row[x];
					disabledForm.value.zongjia = true;
					continue;
				}
				if(x=='fuwudianhua'){
					form.value.fuwudianhua = row[x];
					disabledForm.value.fuwudianhua = true;
					continue;
				}
				if(x=='yudingshijian'){
					form.value.yudingshijian = row[x];
					disabledForm.value.yudingshijian = true;
					continue;
				}
				if(x=='yonghuzhanghao'){
					form.value.yonghuzhanghao = row[x];
					disabledForm.value.yonghuzhanghao = true;
					continue;
				}
				if(x=='yonghuxingming'){
					form.value.yonghuxingming = row[x];
					disabledForm.value.yonghuxingming = true;
					continue;
				}
				if(x=='shangjiazhanghao'){
					form.value.shangjiazhanghao = row[x];
					disabledForm.value.shangjiazhanghao = true;
					continue;
				}
				if(x=='shangjiamingcheng'){
					form.value.shangjiamingcheng = row[x];
					disabledForm.value.shangjiamingcheng = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.ispay='未支付'
			form.value.sfsh='待审核'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('yonghuzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuzhanghao = json.yonghuzhanghao
				disabledForm.value.yonghuzhanghao = true;
			}
			if(json.hasOwnProperty('yonghuxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuxingming = json.yonghuxingming
				disabledForm.value.yonghuxingming = true;
			}
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
									emit('formModelChange')
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
							emit('formModelChange')
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 1px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 0 20px 0;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					height: 36px;
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
				//日期选择器
				.list_date {
					border: 1px solid #ddd;
					border-radius: 4px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #313131;
			background: #EED7B3;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
			color: #fff;
			background: #D09D7D;
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #313131;
			background: #EED7B3;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
			color: #fff;
			background: #D09D7D;
		}
	}
</style>