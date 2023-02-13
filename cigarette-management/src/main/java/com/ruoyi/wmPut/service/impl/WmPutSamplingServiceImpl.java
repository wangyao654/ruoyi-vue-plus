package com.ruoyi.wmPut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.wmPut.domain.WmPutSampling;
import com.ruoyi.wmPut.domain.bo.WmPutSamplingBo;
import com.ruoyi.wmPut.domain.vo.WmPutSamplingVo;
import com.ruoyi.wmPut.mapper.WmPutInfoMapper;
import com.ruoyi.wmPut.mapper.WmPutSamplingMapper;
import com.ruoyi.wmPut.service.IWmPutSamplingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 抽检返还入库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-13
 */
@RequiredArgsConstructor
@Service
public class WmPutSamplingServiceImpl implements IWmPutSamplingService {

    private final WmPutSamplingMapper baseMapper;
    private final WmPutInfoServiceImpl wmPutInfoService;

    /**
     * 查询抽检返还入库信息
     */
    @Override
    public WmPutSamplingVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询抽检返还入库信息列表
     */
    @Override
    public TableDataInfo<WmPutSamplingVo> queryPageList(WmPutSamplingBo bo, PageQuery pageQuery) {
      //  LambdaQueryWrapper<WmPutSampling> lqw = buildQueryWrapper(bo);
        Page<WmPutSamplingVo> result = baseMapper.selectPageList(pageQuery.build(), bo);
        return TableDataInfo.build(result);
    }

    /**
     * 查询抽检返还入库信息列表
     */
    @Override
    public List<WmPutSamplingVo> queryList(WmPutSamplingBo bo) {
        LambdaQueryWrapper<WmPutSampling> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmPutSampling> buildQueryWrapper(WmPutSamplingBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmPutSampling> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getWmOutCoded()), WmPutSampling::getWmOutCoded, bo.getWmOutCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getCauseCoded()), WmPutSampling::getCauseCoded, bo.getCauseCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getCigaretteType()), WmPutSampling::getCigaretteType, bo.getCigaretteType());
        lqw.eq(StringUtils.isNotBlank(bo.getGoodsCoded()), WmPutSampling::getGoodsCoded, bo.getGoodsCoded());
        return lqw;
    }

    /**
     * 新增抽检返还入库信息
     */
    @Override
    public Boolean insertByBo(WmPutSamplingBo bo) {
        WmPutSampling add = BeanUtil.toBean(bo, WmPutSampling.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改抽检返还入库信息
     */
    @Override
    public Boolean updateByBo(WmPutSamplingBo bo) {
        WmPutSampling update = BeanUtil.toBean(bo, WmPutSampling.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmPutSampling entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除抽检返还入库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public Boolean delSamplingByPutId(Collection<Long> asList, boolean b) {
        baseMapper.delSamplingByPutId(asList);
        return wmPutInfoService.deleteWithValidByIds(asList,b);
    }

    @Override
    public TableDataInfo<WmPutSamplingVo> getPutSamplingList(WmPutSamplingBo bo, PageQuery pageQuery) {
        Page<WmPutSamplingVo> result = baseMapper.getPutSamplingList(pageQuery.build(), bo);
        return TableDataInfo.build(result);

    }
}
