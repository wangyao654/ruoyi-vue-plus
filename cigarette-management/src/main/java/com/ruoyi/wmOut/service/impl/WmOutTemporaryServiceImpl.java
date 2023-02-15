package com.ruoyi.wmOut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wmPut.service.impl.WmPutTemporaryServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wmOut.domain.bo.WmOutTemporaryBo;
import com.ruoyi.wmOut.domain.vo.WmOutTemporaryVo;
import com.ruoyi.wmOut.domain.WmOutTemporary;
import com.ruoyi.wmOut.mapper.WmOutTemporaryMapper;
import com.ruoyi.wmOut.service.IWmOutTemporaryService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 暂存出库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@RequiredArgsConstructor
@Service
public class WmOutTemporaryServiceImpl implements IWmOutTemporaryService {

    private final WmOutTemporaryMapper baseMapper;
    @Autowired
    private WmOutInfoServiceImpl wmOutInfoService;
    @Autowired
    private WmPutTemporaryServiceImpl wmPutTemporaryService;

    /**
     * 查询暂存出库信息
     */
    @Override
    public WmOutTemporaryVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询暂存出库信息列表
     */
    @Override
    public TableDataInfo<WmOutTemporaryVo> queryPageList(WmOutTemporaryBo bo, PageQuery pageQuery) {
      //  LambdaQueryWrapper<WmOutTemporary> lqw = buildQueryWrapper(bo);
        Page<WmOutTemporaryVo> result = baseMapper.selectPageList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(wmPutTemporaryService.getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(wmPutTemporaryService.getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }

    /**
     * 查询暂存出库信息列表
     */
    @Override
    public List<WmOutTemporaryVo> queryList(WmOutTemporaryBo bo) {
        LambdaQueryWrapper<WmOutTemporary> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmOutTemporary> buildQueryWrapper(WmOutTemporaryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmOutTemporary> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getWmOutId() != null, WmOutTemporary::getWmOutId, bo.getWmOutId());
        lqw.eq(StringUtils.isNotBlank(bo.getClient()), WmOutTemporary::getClient, bo.getClient());
        lqw.eq(StringUtils.isNotBlank(bo.getCause()), WmOutTemporary::getCause, bo.getCause());
        lqw.eq(StringUtils.isNotBlank(bo.getCertificateCodedAssaciation()), WmOutTemporary::getCertificateCodedAssaciation, bo.getCertificateCodedAssaciation());
        lqw.eq(StringUtils.isNotBlank(bo.getWmOutReason()), WmOutTemporary::getWmOutReason, bo.getWmOutReason());
        lqw.eq(StringUtils.isNotBlank(bo.getCigaretteQuality()), WmOutTemporary::getCigaretteQuality, bo.getCigaretteQuality());
        lqw.eq(StringUtils.isNotBlank(bo.getUnitCoded()), WmOutTemporary::getUnitCoded, bo.getUnitCoded());
        return lqw;
    }

    /**
     * 新增暂存出库信息
     */
    @Override
    public Boolean insertByBo(WmOutTemporaryBo bo) {
        WmOutTemporary add = BeanUtil.toBean(bo, WmOutTemporary.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改暂存出库信息
     */
    @Override
    public Boolean updateByBo(WmOutTemporaryBo bo) {
        WmOutTemporary update = BeanUtil.toBean(bo, WmOutTemporary.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmOutTemporary entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除暂存出库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        baseMapper.deleteByOutId(ids);
        return  wmOutInfoService.deleteWithValidByIds(ids,isValid);
    }
}
