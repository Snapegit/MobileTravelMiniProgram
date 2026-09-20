package com.cl.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.cl.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.JiudianyudingEntity;
import com.cl.entity.view.JiudianyudingView;

import com.cl.service.JiudianyudingService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 酒店预定
 * 后端接口
 * @author 
 * @email 
 * @date 2024-02-17 16:41:31
 */
@RestController
@RequestMapping("/jiudianyuding")
public class JiudianyudingController {
    @Autowired
    private JiudianyudingService jiudianyudingService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JiudianyudingEntity jiudianyuding,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			jiudianyuding.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("shangjia")) {
			jiudianyuding.setShangjiazhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<JiudianyudingEntity> ew = new EntityWrapper<JiudianyudingEntity>();

		PageUtils page = jiudianyudingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiudianyuding), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JiudianyudingEntity jiudianyuding, 
		HttpServletRequest request){
        EntityWrapper<JiudianyudingEntity> ew = new EntityWrapper<JiudianyudingEntity>();

		PageUtils page = jiudianyudingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiudianyuding), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( JiudianyudingEntity jiudianyuding){
       	EntityWrapper<JiudianyudingEntity> ew = new EntityWrapper<JiudianyudingEntity>();
      	ew.allEq(MPUtil.allEQMapPre( jiudianyuding, "jiudianyuding")); 
        return R.ok().put("data", jiudianyudingService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(JiudianyudingEntity jiudianyuding){
        EntityWrapper< JiudianyudingEntity> ew = new EntityWrapper< JiudianyudingEntity>();
 		ew.allEq(MPUtil.allEQMapPre( jiudianyuding, "jiudianyuding")); 
		JiudianyudingView jiudianyudingView =  jiudianyudingService.selectView(ew);
		return R.ok("查询酒店预定成功").put("data", jiudianyudingView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JiudianyudingEntity jiudianyuding = jiudianyudingService.selectById(id);
		jiudianyuding = jiudianyudingService.selectView(new EntityWrapper<JiudianyudingEntity>().eq("id", id));
        return R.ok().put("data", jiudianyuding);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        JiudianyudingEntity jiudianyuding = jiudianyudingService.selectById(id);
		jiudianyuding = jiudianyudingService.selectView(new EntityWrapper<JiudianyudingEntity>().eq("id", id));
        return R.ok().put("data", jiudianyuding);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiudianyudingEntity jiudianyuding, HttpServletRequest request){
    	jiudianyuding.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiudianyuding);
        jiudianyudingService.insert(jiudianyuding);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody JiudianyudingEntity jiudianyuding, HttpServletRequest request){
    	jiudianyuding.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiudianyuding);
        jiudianyudingService.insert(jiudianyuding);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody JiudianyudingEntity jiudianyuding, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiudianyuding);
        jiudianyudingService.updateById(jiudianyuding);//全部更新
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf){
        List<JiudianyudingEntity> list = new ArrayList<JiudianyudingEntity>();
        for(Long id : ids) {
            JiudianyudingEntity jiudianyuding = jiudianyudingService.selectById(id);
            jiudianyuding.setSfsh(sfsh);
            jiudianyuding.setShhf(shhf);
            list.add(jiudianyuding);
        }
        jiudianyudingService.updateBatchById(list);
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jiudianyudingService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
