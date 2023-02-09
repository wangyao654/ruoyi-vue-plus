package com.ruoyi.wmPut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import com.ruoyi.wmPut.domain.WmPutTemporary;
import com.ruoyi.wmPut.domain.bo.WmPutTemporaryBo;
import com.ruoyi.wmPut.domain.vo.WmPutTemporaryVo;
import com.ruoyi.wmPut.mapper.WmPutTemporaryMapper;
import com.ruoyi.wmPut.service.IWmPutTemporaryService;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 暂存入库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-09
 */
@RequiredArgsConstructor
@Service
public class WmPutTemporaryServiceImpl implements IWmPutTemporaryService {

    private final WmPutTemporaryMapper baseMapper;
    @Autowired
    private WmPutInfoServiceImpl wmPutInfoService;
    @Autowired
    private SysUserServiceImpl sysUserService;

    /**
     * 查询暂存入库信息
     */
    @Override
    public WmPutTemporaryVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询暂存入库信息列表
     */
    @Override
    public TableDataInfo<WmPutTemporaryVo> queryPageList(WmPutTemporaryBo bo, PageQuery pageQuery) {
        //LambdaQueryWrapper<WmPutTemporary> lqw = buildQueryWrapper(bo);
        Page<WmPutTemporaryVo> result= baseMapper.selectPageList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        //  Page<WmPutTemporaryVo> result = baseMapper.selectVoPage(, lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询暂存入库信息列表
     */
    @Override
    public List<WmPutTemporaryVo> queryList(WmPutTemporaryBo bo) {
        LambdaQueryWrapper<WmPutTemporary> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmPutTemporary> buildQueryWrapper(WmPutTemporaryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmPutTemporary> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getClient()), WmPutTemporary::getClient, bo.getClient());
        lqw.eq(StringUtils.isNotBlank(bo.getCause()), WmPutTemporary::getCause, bo.getCause());
        lqw.eq(StringUtils.isNotBlank(bo.getGoodsCoded()), WmPutTemporary::getGoodsCoded, bo.getGoodsCoded());
        return lqw;
    }

    /**
     * 新增暂存入库信息
     */
    @Override
    public Integer insertByBo(WmPutTemporaryBo bo) {
        WmPutTemporary add = BeanUtil.toBean(bo, WmPutTemporary.class);
        validEntityBeforeSave(add);
       int id= baseMapper.insertWmPutTemporary(add);
        boolean flag =false;
        if(id!=0){
            flag=true;
        }
        if (flag) {
            return add.getId().intValue();
        }
        return 0;
    }

    /**
     * 修改暂存入库信息
     */
    @Override
    public Boolean updateByBo(WmPutTemporaryBo bo) {
        WmPutTemporary update = BeanUtil.toBean(bo, WmPutTemporary.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmPutTemporary entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除暂存入库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public TableDataInfo<WmPutTemporaryVo> getPutTemporaryList(WmPutTemporaryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WmPutTemporary> lqw = buildQueryWrapper(bo);
        Page<WmPutTemporaryVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        result.getRecords().forEach(t->{
            t.setStorekeeper(getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }
    /**
     * 查询暂存入库信息列表
     */
    @Override
    public TableDataInfo<WmPutTemporaryVo> attachedList(WmPutTemporaryBo bo, PageQuery pageQuery) {
        //LambdaQueryWrapper<WmPutTemporary> lqw = buildQueryWrapper(bo);
        Page<WmPutTemporaryVo> result= baseMapper.attachedList(pageQuery.build(), bo);
        //  Page<WmPutTemporaryVo> result = baseMapper.selectVoPage(, lqw);
        result.getRecords().forEach(t->{
            t.setStorekeeper(getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }
   /*
   * 查询保管员 和综合保管员
   *
   * */
    public Map<String,String>  getKeeper(String storekeeper,String synthesisKeeper){
        Map<String,String> map = new HashMap<>();
        List<String> list = new ArrayList<>();
        if(!StringUtils.isEmpty(storekeeper)) {
            String[] split = storekeeper.split(",");
            list = Arrays.asList(split);
        }
        if(!StringUtils.isEmpty(synthesisKeeper)){
            list.addAll(Arrays.asList(synthesisKeeper.split(",")));
        }
        if(CollectionUtils.isEmpty(list)){
            map.put("1","");
            map.put("2","");
            return map;
        }
       List<SysUser>  listUser= sysUserService.selectByUserId(list);
        List<String> synthesisKeepers = listUser.stream().filter(f -> f.getPosition().equals("1")).map(SysUser::getUserName).collect(Collectors.toList());
        List<String> storekeepers = listUser.stream().filter(f -> f.getPosition().equals("2")).map(SysUser::getUserName).collect(Collectors.toList());
        map.put("1",StringUtils.join(synthesisKeepers,","));
        map.put("2",StringUtils.join(storekeepers,","));
        return map;
    }

}
