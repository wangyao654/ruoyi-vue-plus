package com.ruoyi.wmPut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wmPut.domain.bo.WmPutEscrowBo;
import com.ruoyi.wmPut.domain.vo.WmPutEscrowVo;
import com.ruoyi.wmPut.domain.WmPutEscrow;
import com.ruoyi.wmPut.mapper.WmPutEscrowMapper;
import com.ruoyi.wmPut.service.IWmPutEscrowService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 代管入库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-09
 */
@RequiredArgsConstructor
@Service
public class WmPutEscrowServiceImpl implements IWmPutEscrowService {

    private final WmPutEscrowMapper baseMapper;
    @Autowired
    private WmPutTemporaryServiceImpl wmPutTemporaryService;
    @Autowired
    private WmPutInfoServiceImpl wmPutInfoService;

    /**
     * 查询代管入库信息
     */
    @Override
    public WmPutEscrowVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询代管入库信息列表
     */
    @Override
    public TableDataInfo<WmPutEscrowVo> queryPageList(WmPutEscrowBo bo, PageQuery pageQuery) {
     //   LambdaQueryWrapper<WmPutEscrow> lqw = buildQueryWrapper(bo);
        Page<WmPutEscrowVo> result = baseMapper.selectPageList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(wmPutTemporaryService.getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(wmPutTemporaryService.getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }

    /**
     * 查询代管入库信息列表
     */
    @Override
    public List<WmPutEscrowVo> queryList(WmPutEscrowBo bo) {
        LambdaQueryWrapper<WmPutEscrow> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmPutEscrow> buildQueryWrapper(WmPutEscrowBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmPutEscrow> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getEntrustUnit()), WmPutEscrow::getEntrustUnit, bo.getEntrustUnit());
        lqw.eq(bo.getEntrustUnitId() != null, WmPutEscrow::getEntrustUnitId, bo.getEntrustUnitId());
        lqw.eq(bo.getEntrustDate() != null, WmPutEscrow::getEntrustDate, bo.getEntrustDate());
        lqw.eq(StringUtils.isNotBlank(bo.getWhBitCoded()), WmPutEscrow::getWhBitCoded, bo.getWhBitCoded());
        return lqw;
    }

    /**
     * 新增代管入库信息
     */
    @Override
    public Boolean insertByBo(WmPutEscrowBo bo) {
        WmPutEscrow add = BeanUtil.toBean(bo, WmPutEscrow.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改代管入库信息
     */
    @Override
    public Boolean updateByBo(WmPutEscrowBo bo) {
        WmPutEscrow update = BeanUtil.toBean(bo, WmPutEscrow.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmPutEscrow entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除代管入库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public TableDataInfo<WmPutEscrowVo> getEscrowList(WmPutEscrowBo bo, PageQuery pageQuery) {
        Page<WmPutEscrowVo> result = baseMapper.getEscrowList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(wmPutTemporaryService.getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(wmPutTemporaryService.getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }

    @Override
    public Boolean delPutEscrowByPutId(Collection<Long> asList, boolean b) {
         baseMapper.deleteByPutId(asList);
        return wmPutInfoService.deleteWithValidByIds(asList,b);
    }
}
