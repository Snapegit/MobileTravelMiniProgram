	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import jingdianleixing from '@/views/jingdianleixing/list'
	import discussjiudianxinxi from '@/views/discussjiudianxinxi/list'
	import jiudianxinxi from '@/views/jiudianxinxi/list'
	import jingdianxinxi from '@/views/jingdianxinxi/list'
	import storeup from '@/views/storeup/list'
	import shangjia from '@/views/shangjia/list'
	import jiudianleixing from '@/views/jiudianleixing/list'
	import menpiaogoumai from '@/views/menpiaogoumai/list'
	import yonghu from '@/views/yonghu/list'
	import discussjingdianxinxi from '@/views/discussjingdianxinxi/list'
	import jiudianyuding from '@/views/jiudianyuding/list'
	import config from '@/views/config/list'
	import shangjiaRegister from '@/views/shangjia/register'
	import shangjiaCenter from '@/views/shangjia/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/shangjiaCenter',
			name: '商家个人中心',
			component: shangjiaCenter
		}
		,{
			path: '/news',
			name: '旅游资讯',
			component: news
		}
		,{
			path: '/jingdianleixing',
			name: '景点类型',
			component: jingdianleixing
		}
		,{
			path: '/discussjiudianxinxi',
			name: '酒店信息评论',
			component: discussjiudianxinxi
		}
		,{
			path: '/jiudianxinxi',
			name: '酒店信息',
			component: jiudianxinxi
		}
		,{
			path: '/jingdianxinxi',
			name: '景点信息',
			component: jingdianxinxi
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/shangjia',
			name: '商家',
			component: shangjia
		}
		,{
			path: '/jiudianleixing',
			name: '酒店类型',
			component: jiudianleixing
		}
		,{
			path: '/menpiaogoumai',
			name: '门票购买',
			component: menpiaogoumai
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/discussjingdianxinxi',
			name: '景点信息评论',
			component: discussjingdianxinxi
		}
		,{
			path: '/jiudianyuding',
			name: '酒店预定',
			component: jiudianyuding
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		]
	},
	{
		path: '/shangjiaRegister',
		name: '商家注册',
		component: shangjiaRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
