package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsGoodsInfo;
import com.ruoyi.base.domain.BsWarehouseInfo;
import com.ruoyi.base.domain.bo.BsWarehouseInfoBo;
import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.base.domain.vo.BsWarehouseInfoVo;
import com.ruoyi.base.mapper.BsWarehouseInfoMapper;
import com.ruoyi.base.service.IBsWarehouseInfoService;
import com.ruoyi.common.core.domain.R;
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
 * 仓库管理Service业务层处理
 *
 * @author ruoyi
 * @date 2022-12-30
 */
@RequiredArgsConstructor
@Service
public class BsWarehouseInfoServiceImpl implements IBsWarehouseInfoService {

    private final BsWarehouseInfoMapper baseMapper;

    /**
     * 查询仓库管理
     */
    @Override
    public BsWarehouseInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询仓库管理列表
     */
    @Override
    public TableDataInfo<BsWarehouseInfoVo> queryPageList(BsWarehouseInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsWarehouseInfo> lqw = buildQueryWrapper(bo);
        Page<BsWarehouseInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询仓库管理列表
     */
    @Override
    public List<BsWarehouseInfoVo> queryList(BsWarehouseInfoBo bo) {
        LambdaQueryWrapper<BsWarehouseInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsWarehouseInfo> buildQueryWrapper(BsWarehouseInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsWarehouseInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getWarehouseCoded() != null, BsWarehouseInfo::getWarehouseCoded, bo.getWarehouseCoded());
        lqw.like(StringUtils.isNotBlank(bo.getWarehouseName()), BsWarehouseInfo::getWarehouseName, bo.getWarehouseName());
        lqw.eq(StringUtils.isNotBlank(bo.getWarehouseType()), BsWarehouseInfo::getWarehouseType, bo.getWarehouseType());
        lqw.eq(bo.getWarehouseOrganization() != null, BsWarehouseInfo::getWarehouseOrganization, bo.getWarehouseOrganization());
        lqw.eq(StringUtils.isNotBlank(bo.getWarehouseAddress()), BsWarehouseInfo::getWarehouseAddress, bo.getWarehouseAddress());
        lqw.eq(StringUtils.isNotBlank(bo.getWarehousePrincipal()), BsWarehouseInfo::getWarehousePrincipal, bo.getWarehousePrincipal());
        lqw.eq(StringUtils.isNotBlank(bo.getWarehouseEnabled()), BsWarehouseInfo::getWarehouseEnabled, bo.getWarehouseEnabled());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsWarehouseInfo::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsWarehouseInfo::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsWarehouseInfo::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增仓库管理
     */
    @Override
    public Boolean insertByBo(BsWarehouseInfoBo bo) {
        BsWarehouseInfo add = BeanUtil.toBean(bo, BsWarehouseInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改仓库管理
     */
    @Override
    public Boolean updateByBo(BsWarehouseInfoBo bo) {
        BsWarehouseInfo update = BeanUtil.toBean(bo, BsWarehouseInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsWarehouseInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除仓库管理
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public R verifyWarehouseCoded(BsWarehouseInfoBo bo) {
        LambdaQueryWrapper<BsWarehouseInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null&&bo.getId() != 0  , BsWarehouseInfo::getId, bo.getId());
        lqw.eq(bo.getWarehouseCoded() != null && bo.getWarehouseCoded() != 0, BsWarehouseInfo::getWarehouseCoded, bo.getWarehouseCoded());
        List<BsWarehouseInfoVo> bsWarehouseInfoVos = this.baseMapper.selectVoList(lqw);
        return R.ok(bsWarehouseInfoVos);
    }
}
