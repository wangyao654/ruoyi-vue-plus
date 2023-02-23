package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BrandTemplateInfo;
import com.ruoyi.base.domain.bo.BrandTemplateInfoBo;
import com.ruoyi.base.domain.vo.BrandTemplateInfoVo;
import com.ruoyi.base.mapper.BrandTemplateInfoMapper;
import com.ruoyi.base.service.IBrandTemplateInfoService;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-23
 */
@RequiredArgsConstructor
@Service
public class BrandTemplateInfoServiceImpl implements IBrandTemplateInfoService {

    private final BrandTemplateInfoMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     */
    @Override
    public BrandTemplateInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @Override
    public TableDataInfo<BrandTemplateInfoVo> queryPageList(BrandTemplateInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BrandTemplateInfo> lqw = buildQueryWrapper(bo);
        Page<BrandTemplateInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @Override
    public List<BrandTemplateInfoVo> queryList(BrandTemplateInfoBo bo) {
        LambdaQueryWrapper<BrandTemplateInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BrandTemplateInfo> buildQueryWrapper(BrandTemplateInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BrandTemplateInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getBrandId() != null, BrandTemplateInfo::getBrandId, bo.getBrandId());
        lqw.eq(StringUtils.isNotBlank(bo.getTemplateCoded()), BrandTemplateInfo::getTemplateCoded, bo.getTemplateCoded());
        lqw.like(StringUtils.isNotBlank(bo.getTemplateName()), BrandTemplateInfo::getTemplateName, bo.getTemplateName());
        lqw.like(StringUtils.isNotBlank(bo.getTemplateFileName()), BrandTemplateInfo::getTemplateFileName, bo.getTemplateFileName());
        lqw.eq(StringUtils.isNotBlank(bo.getTemplatePicture()), BrandTemplateInfo::getTemplatePicture, bo.getTemplatePicture());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     */
    @Override
    public Boolean insertByBo(BrandTemplateInfoBo bo) {
        BrandTemplateInfo add = BeanUtil.toBean(bo, BrandTemplateInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改【请填写功能名称】
     */
    @Override
    public Boolean updateByBo(BrandTemplateInfoBo bo) {
        BrandTemplateInfo update = BeanUtil.toBean(bo, BrandTemplateInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BrandTemplateInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除【请填写功能名称】
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
