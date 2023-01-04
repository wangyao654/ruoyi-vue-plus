package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsWhAreaInfo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.base.domain.bo.BsDealingsunitInfoBo;
import com.ruoyi.base.domain.vo.BsDealingsunitInfoVo;
import com.ruoyi.base.domain.BsDealingsunitInfo;
import com.ruoyi.base.mapper.BsDealingsunitInfoMapper;
import com.ruoyi.base.service.IBsDealingsunitInfoService;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.Objects;

/**
 * 来往单位信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-04
 */
@RequiredArgsConstructor
@Service
public class BsDealingsunitInfoServiceImpl implements IBsDealingsunitInfoService {

    private final BsDealingsunitInfoMapper baseMapper;

    /**
     * 查询来往单位信息
     */
    @Override
    public BsDealingsunitInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询来往单位信息列表
     */
    @Override
    public TableDataInfo<BsDealingsunitInfoVo> queryPageList(BsDealingsunitInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsDealingsunitInfo> lqw = buildQueryWrapper(bo);
        Page<BsDealingsunitInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询来往单位信息列表
     */
    @Override
    public List<BsDealingsunitInfoVo> queryList(BsDealingsunitInfoBo bo) {
        LambdaQueryWrapper<BsDealingsunitInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsDealingsunitInfo> buildQueryWrapper(BsDealingsunitInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsDealingsunitInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getUnitCoded()), BsDealingsunitInfo::getUnitCoded, bo.getUnitCoded());
        lqw.like(StringUtils.isNotBlank(bo.getUnitName()), BsDealingsunitInfo::getUnitName, bo.getUnitName());
        lqw.eq(StringUtils.isNotBlank(bo.getUnitType()), BsDealingsunitInfo::getUnitType, bo.getUnitType());
        lqw.eq(StringUtils.isNotBlank(bo.getUnitEnabled()), BsDealingsunitInfo::getUnitEnabled, bo.getUnitEnabled());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsDealingsunitInfo::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsDealingsunitInfo::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsDealingsunitInfo::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增来往单位信息
     */
    @Override
    public Boolean insertByBo(BsDealingsunitInfoBo bo) {
        BsDealingsunitInfo add = BeanUtil.toBean(bo, BsDealingsunitInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改来往单位信息
     */
    @Override
    public Boolean updateByBo(BsDealingsunitInfoBo bo) {
        BsDealingsunitInfo update = BeanUtil.toBean(bo, BsDealingsunitInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsDealingsunitInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除来往单位信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public R verifyDealingsUnitCoded(BsDealingsunitInfoBo bo) {
        LambdaQueryWrapper<BsDealingsunitInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId()!=null&&bo.getId()>0,BsDealingsunitInfo::getId,bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getUnitCoded()), BsDealingsunitInfo::getUnitCoded, bo.getUnitCoded());
        List<BsDealingsunitInfoVo> bsDealingsunitInfoVos = baseMapper.selectVoList(lqw);
        return R.ok(bsDealingsunitInfoVos);
    }


}
