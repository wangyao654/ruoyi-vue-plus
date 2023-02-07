package com.ruoyi.wmPut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wmPut.domain.WmPutTemporary;
import com.ruoyi.wmPut.domain.bo.WmPutTemporaryBo;
import com.ruoyi.wmPut.domain.vo.WmPutTemporaryVo;
import com.ruoyi.wmPut.mapper.WmPutTemporaryMapper;
import com.ruoyi.wmPut.service.IWmPutTemporaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Collection;

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
        LambdaQueryWrapper<WmPutTemporary> lqw = buildQueryWrapper(bo);
        Page<WmPutTemporaryVo> result= baseMapper.selectPageList(pageQuery.build(), bo);
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
        return TableDataInfo.build(result);
    }
}
