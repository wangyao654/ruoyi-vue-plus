package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsBrandManage;
import com.ruoyi.base.domain.BsGoodsInfo;
import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.base.mapper.BsGoodsInfoMapper;
import com.ruoyi.base.service.IBsGoodsInfoService;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.bo.BsGoodsInfoBo;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.Objects;

/**
 * 商品信息Service业务层处理
 *
 * @author ruoyi
 * @date 2022-12-27
 */
@RequiredArgsConstructor
@Service
public class BsGoodsInfoServiceImpl implements IBsGoodsInfoService {

    private final BsGoodsInfoMapper baseMapper;

    /**
     * 查询商品信息
     */
    @Override
    public BsGoodsInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询商品信息列表
     */
    @Override
    public TableDataInfo<BsGoodsInfoVo> queryPageList(BsGoodsInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = buildQueryWrapper(bo);
        Page<BsGoodsInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询商品信息列表
     */
    @Override
    public List<BsGoodsInfoVo> queryList(BsGoodsInfoBo bo) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsGoodsInfo> buildQueryWrapper(BsGoodsInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsGoodsInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getGoodsCoded() != null, BsGoodsInfo::getGoodsCoded, bo.getGoodsCoded());
        lqw.like(StringUtils.isNotBlank(bo.getGoodsName()), BsGoodsInfo::getGoodsName, bo.getGoodsName());
        lqw.like(StringUtils.isNotBlank(bo.getBrandName()), BsGoodsInfo::getBrandName, bo.getBrandName());
        lqw.eq(bo.getBrandCoded() != null, BsGoodsInfo::getBrandCoded, bo.getBrandCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getSmallBoxBarcode()), BsGoodsInfo::getSmallBoxBarcode, bo.getSmallBoxBarcode());
        lqw.eq(StringUtils.isNotBlank(bo.getBarboxBarcode()), BsGoodsInfo::getBarboxBarcode, bo.getBarboxBarcode());
        lqw.eq(StringUtils.isNotBlank(bo.getGoodsType()), BsGoodsInfo::getGoodsType, bo.getGoodsType());
        lqw.eq(StringUtils.isNotBlank(bo.getGoodsSpecification()), BsGoodsInfo::getGoodsSpecification, bo.getGoodsSpecification());
       /* lqw.eq(StringUtils.isNotBlank(bo.getMeasureUnit()), BsGoodsInfo::getMeasureUnit, bo.getMeasureUnit());
        lqw.eq(StringUtils.isNotBlank(bo.getSingleBarboxNumber()), BsGoodsInfo::getSingleBarboxNumber, bo.getSingleBarboxNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getSmallBoxNumber()), BsGoodsInfo::getSmallBoxNumber, bo.getSmallBoxNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getPackagingForms()), BsGoodsInfo::getPackagingForms, bo.getPackagingForms());*/
        lqw.eq(StringUtils.isNotBlank(bo.getListingStatus()), BsGoodsInfo::getListingStatus, bo.getListingStatus());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsGoodsInfo::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsGoodsInfo::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsGoodsInfo::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增商品信息
     */
    @Override
    public Boolean insertByBo(BsGoodsInfoBo bo) {
        BsGoodsInfo add = BeanUtil.toBean(bo, BsGoodsInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改商品信息
     */
    @Override
    public Boolean updateByBo(BsGoodsInfoBo bo) {
        BsGoodsInfo update = BeanUtil.toBean(bo, BsGoodsInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsGoodsInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除商品信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public R verifyGoodsCoded(BsGoodsInfoBo bo) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null&&bo.getId() != 0  , BsGoodsInfo::getId, bo.getId());
        lqw.eq(bo.getGoodsCoded() != null && bo.getGoodsCoded() != 0, BsGoodsInfo::getGoodsCoded, bo.getGoodsCoded());
        List<BsGoodsInfoVo> bsGoodsInfoVos = this.baseMapper.selectVoList(lqw);
        return R.ok(bsGoodsInfoVos);
    }
}
