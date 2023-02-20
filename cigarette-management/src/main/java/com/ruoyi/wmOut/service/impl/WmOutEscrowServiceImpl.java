package com.ruoyi.wmOut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wmOut.domain.bo.WmOutInfoBo;
import com.ruoyi.wmPut.service.impl.WmPutTemporaryServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wmOut.domain.bo.WmOutEscrowBo;
import com.ruoyi.wmOut.domain.vo.WmOutEscrowVo;
import com.ruoyi.wmOut.domain.WmOutEscrow;
import com.ruoyi.wmOut.mapper.WmOutEscrowMapper;
import com.ruoyi.wmOut.service.IWmOutEscrowService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 代管出库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-16
 */
@RequiredArgsConstructor
@Service
public class WmOutEscrowServiceImpl implements IWmOutEscrowService {

    private final WmOutEscrowMapper baseMapper;
    @Autowired
    private WmOutInfoServiceImpl wmOutInfoService;
    @Autowired
    private WmPutTemporaryServiceImpl wmPutTemporaryService;

    /**
     * 查询代管出库信息
     */
    @Override
    public WmOutEscrowVo queryById(Long id) {
        return baseMapper.selectEscrowById(id);
    }

    /**
     * 查询代管出库信息列表
     */
    @Override
    public TableDataInfo<WmOutEscrowVo> queryPageList(WmOutEscrowBo bo, PageQuery pageQuery) {
      //  LambdaQueryWrapper<WmOutEscrow> lqw = buildQueryWrapper(bo);
        Page<WmOutEscrowVo> result = baseMapper.selectPageList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(wmPutTemporaryService.getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(wmPutTemporaryService.getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }

    /**
     * 查询代管出库信息列表
     */
    @Override
    public List<WmOutEscrowVo> queryList(WmOutEscrowBo bo) {
        LambdaQueryWrapper<WmOutEscrow> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmOutEscrow> buildQueryWrapper(WmOutEscrowBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmOutEscrow> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getWmOutId() != null, WmOutEscrow::getWmOutId, bo.getWmOutId());
        lqw.eq(StringUtils.isNotBlank(bo.getCertificateCodedAssaciation()), WmOutEscrow::getCertificateCodedAssaciation, bo.getCertificateCodedAssaciation());
        lqw.eq(bo.getUnitCoded() != null, WmOutEscrow::getUnitCoded, bo.getUnitCoded());
        lqw.eq(bo.getWhPutDate() != null, WmOutEscrow::getWhPutDate, bo.getWhPutDate());
        lqw.eq(bo.getVarietyNumber() != null, WmOutEscrow::getVarietyNumber, bo.getVarietyNumber());
        lqw.eq(bo.getWhPutNumber() != null, WmOutEscrow::getWhPutNumber, bo.getWhPutNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getMeasureUnit()), WmOutEscrow::getMeasureUnit, bo.getMeasureUnit());
        return lqw;
    }

    /**
     * 新增代管出库信息
     */
    @Override
    @Transactional
    public Boolean insertByBo(WmOutEscrowBo bo) {
        WmOutEscrow add = BeanUtil.toBean(bo, WmOutEscrow.class);
        validEntityBeforeSave(add);
        WmOutInfoBo wmOutInfoBo = BeanUtil.toBean(bo, WmOutInfoBo.class);
        /*        baseMapper.insertOutInfo(wmOutInfo);*/
        wmOutInfoService.insertByBo(wmOutInfoBo);
        add.setWmOutId(wmOutInfoBo.getId());
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改代管出库信息
     */
    @Override
    @Transactional
    public Boolean updateByBo(WmOutEscrowBo bo) {
        WmOutEscrow update = BeanUtil.toBean(bo, WmOutEscrow.class);
        WmOutInfoBo wmOutInfoBo = BeanUtil.toBean(bo, WmOutInfoBo.class);
        wmOutInfoService.updateByBo(wmOutInfoBo);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmOutEscrow entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除代管出库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验0
        }
        baseMapper.deleteByOutId(ids);
        return  wmOutInfoService.deleteWithValidByIds(ids,isValid);
    }
}
