package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsBrandManage;
import com.ruoyi.base.domain.BsWarehouseInfo;
import com.ruoyi.base.domain.bo.BsBrandManageBo;
import com.ruoyi.base.domain.vo.BsBrandManageVo;
import com.ruoyi.base.mapper.BsBrandManageMapper;
import com.ruoyi.base.service.IBsBrandManageService;
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
import java.util.Objects;

/**
 * 品牌管理/品牌详细信息Service业务层处理
 *
 * @author ruoyi
 * @date 2022-12-26
 */
@RequiredArgsConstructor
@Service
public class BsBrandManageServiceImpl implements IBsBrandManageService {

    private final BsBrandManageMapper baseMapper;

    /**
     * 查询品牌管理/品牌详细信息
     */
    @Override
    public BsBrandManageVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询品牌管理/品牌详细信息列表
     */
    @Override
    public TableDataInfo<BsBrandManageVo> queryPageList(BsBrandManageBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsBrandManage> lqw = buildQueryWrapper(bo);
        Page<BsBrandManageVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询品牌管理/品牌详细信息列表
     */
    @Override
    public List<BsBrandManageVo> queryList(BsBrandManageBo bo) {
        LambdaQueryWrapper<BsBrandManage> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsBrandManage> buildQueryWrapper(BsBrandManageBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsBrandManage> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getBrandCoded()), BsBrandManage::getBrandCoded, bo.getBrandCoded());
        lqw.like(StringUtils.isNotBlank(bo.getBrandName()), BsBrandManage::getBrandName, bo.getBrandName());
        lqw.eq(StringUtils.isNotBlank(bo.getBrandLocality()), BsBrandManage::getBrandLocality, bo.getBrandLocality());
        lqw.eq(StringUtils.isNotBlank(bo.getBrandEnabled()), BsBrandManage::getBrandEnabled, bo.getBrandEnabled());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsBrandManage::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsBrandManage::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsBrandManage::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增品牌管理/品牌详细信息
     */
    @Override
    public Boolean insertByBo(BsBrandManageBo bo) {
        BsBrandManage add = BeanUtil.toBean(bo, BsBrandManage.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改品牌管理/品牌详细信息
     */
    @Override
    public Boolean updateByBo(BsBrandManageBo bo) {
        BsBrandManage update = BeanUtil.toBean(bo, BsBrandManage.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsBrandManage entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除品牌管理/品牌详细信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public List<BsBrandManageVo> verifyBrandCode(BsBrandManageBo bo) {
        LambdaQueryWrapper<BsBrandManage> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.ne(bo.getId() != null&&bo.getId() != 0  , BsBrandManage::getId, bo.getId());
        queryWrapper.eq(StringUtils.isNotBlank(bo.getBrandCoded()), BsBrandManage::getBrandCoded, bo.getBrandCoded());

        return baseMapper.selectVoList(queryWrapper);
    }
}
