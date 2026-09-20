<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="景点名称" prop="jingdianmingcheng">
							<el-input class="list_inp" v-model="form.jingdianmingcheng" placeholder="景点名称"
								 type="text" 								:readonly="!isAdd||disabledForm.jingdianmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="景点图片" prop="jingdiantupian">
							<uploads
								:disabled="!isAdd||disabledForm.jingdiantupian?true:false"
								action="file/upload" 
								tip="请上传景点图片" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="form.jingdiantupian?form.jingdiantupian:''" 
								@change="jingdiantupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="门票价格" prop="menpiaojiage">
							<el-input class="list_inp" v-model.number="form.menpiaojiage" placeholder="门票价格"
								 type="number" 								:readonly="!isAdd||disabledForm.menpiaojiage?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="数量" prop="shuliang">
							<el-input class="list_inp" v-model.number="form.shuliang" placeholder="数量"
								 type="text" 								:readonly="!isAdd||disabledForm.shuliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="景点类型" prop="jingdianleixing">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.jingdianleixing?true:false"
								v-model="form.jingdianleixing" 
								placeholder="请选择景点类型"
								>
								<el-option v-for="(item,index) in jingdianleixingLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="开放时间" prop="kaifangshijian">
							<el-input class="list_inp" v-model="form.kaifangshijian" placeholder="开放时间"
								 type="text" 								:readonly="!isAdd||disabledForm.kaifangshijian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="景点地址" prop="jingdiandizhi">
							<el-input class="list_inp" v-model="form.jingdiandizhi" placeholder="景点地址"
								 type="text" 								:readonly="!isAdd||disabledForm.jingdiandizhi?true:false" />
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

					<el-col :span="24">
						<el-form-item label="路线推荐" prop="luxiantuijian">
							<el-input v-model="form.luxiantuijian" placeholder="路线推荐" type="textarea"
							:readonly="!isAdd||disabledForm.luxiantuijian?true:false"
							/>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="景点介绍" prop="jingdianjieshao">
							<editor :value="form.jingdianjieshao" placeholder="请输入景点介绍" :readonly="!isAdd||disabledForm.jingdianjieshao?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'jingdianjieshao')"></editor>
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
	const tableName = 'jingdianxinxi'
	const formName = '景点信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		jingdianmingcheng : false,
		jingdiantupian : false,
		menpiaojiage : false,
		shuliang : false,
		jingdianleixing : false,
		kaifangshijian : false,
		luxiantuijian : false,
		jingdianjieshao : false,
		jingdiandizhi : false,
		storeupnum : false,
		clicktime : false,
		clicknum : false,
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
		jingdianmingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		jingdiantupian: [
		],
		menpiaojiage: [
			{required: true,message: '请输入',trigger: 'blur'}, 
			{ validator: validateNumber, trigger: 'blur' },
		],
		shuliang: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		jingdianleixing: [
		],
		kaifangshijian: [
		],
		luxiantuijian: [
		],
		jingdianjieshao: [
		],
		jingdiandizhi: [
		],
		storeupnum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		clicktime: [
		],
		clicknum: [
			{ validator: validateIntNumber, trigger: 'blur' },
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
	//景点图片上传回调
	const jingdiantupianUploadSuccess=(e)=>{
		form.value.jingdiantupian = e
	}
	//景点类型列表
	const jingdianleixingLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			jingdianmingcheng: '',
			jingdiantupian: '',
			menpiaojiage: '',
			shuliang: '',
			jingdianleixing: '',
			kaifangshijian: '',
			luxiantuijian: '',
			jingdianjieshao: '',
			jingdiandizhi: '',
			storeupnum: '0',
			clicktime: '',
			clicknum: '0',
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
			res.data.data.jingdianjieshao = res.data.data.jingdianjieshao?(res.data.data.jingdianjieshao.replace(reg,'../../../cl6751742/file')):'';
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
				if(x=='jingdianmingcheng'){
					form.value.jingdianmingcheng = row[x];
					disabledForm.value.jingdianmingcheng = true;
					continue;
				}
				if(x=='jingdiantupian'){
					form.value.jingdiantupian = row[x];
					disabledForm.value.jingdiantupian = true;
					continue;
				}
				if(x=='menpiaojiage'){
					form.value.menpiaojiage = row[x];
					disabledForm.value.menpiaojiage = true;
					continue;
				}
				if(x=='shuliang'){
					form.value.shuliang = row[x];
					disabledForm.value.shuliang = true;
					continue;
				}
				if(x=='jingdianleixing'){
					form.value.jingdianleixing = row[x];
					disabledForm.value.jingdianleixing = true;
					continue;
				}
				if(x=='kaifangshijian'){
					form.value.kaifangshijian = row[x];
					disabledForm.value.kaifangshijian = true;
					continue;
				}
				if(x=='luxiantuijian'){
					form.value.luxiantuijian = row[x];
					disabledForm.value.luxiantuijian = true;
					continue;
				}
				if(x=='jingdianjieshao'){
					form.value.jingdianjieshao = row[x];
					disabledForm.value.jingdianjieshao = true;
					continue;
				}
				if(x=='jingdiandizhi'){
					form.value.jingdiandizhi = row[x];
					disabledForm.value.jingdiandizhi = true;
					continue;
				}
				if(x=='storeupnum'){
					form.value.storeupnum = row[x];
					disabledForm.value.storeupnum = true;
					continue;
				}
				if(x=='clicktime'){
					form.value.clicktime = row[x];
					disabledForm.value.clicktime = true;
					continue;
				}
				if(x=='clicknum'){
					form.value.clicknum = row[x];
					disabledForm.value.clicknum = true;
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
			form.value.storeupnum='0'
			form.value.clicknum='0'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('shangjiazhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.shangjiazhanghao = json.shangjiazhanghao
				disabledForm.value.shangjiazhanghao = true;
			}
			if(json.hasOwnProperty('shangjiamingcheng')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.shangjiamingcheng = json.shangjiamingcheng
				disabledForm.value.shangjiamingcheng = true;
			}
		})
		context?.$http({
			url: `option/jingdianleixing/jingdianleixing`,
			method: 'get'
		}).then(res=>{
			jingdianleixingLists.value = res.data.data
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
		if(form.value.jingdiantupian!=null) {
			form.value.jingdiantupian = form.value.jingdiantupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
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
				// 下拉框
				.list_sel {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
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
				}
				// 富文本
				.list_editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					margin: 0;
					width: auto;
					border-color: #ccc;
					border-width: 0;
					border-style: solid;
					min-width: 800px;
					height: auto;
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid #ddd;
					padding: 12px;
					outline: none;
					color: #333;
					width: auto;
					font-size: 14px;
					min-height: 120px;
					outline-offset: 4px;
					min-width: 550px;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid #ddd;
						cursor: pointer;
						background-color: #fff;
						border-radius: 4px;
						width: 80px;
						line-height: 80px;
						text-align: center;
						height: 80px;
						//图标
						.el-icon{
							color: #999;
							font-size: 32px;
							line-height: 80px;
						}
					}
					.el-upload-list__item {
						border: 1px solid #ddd;
						cursor: pointer;
						background-color: #fff;
						border-radius: 4px;
						width: 80px;
						line-height: 80px;
						text-align: center;
						height: 80px;
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