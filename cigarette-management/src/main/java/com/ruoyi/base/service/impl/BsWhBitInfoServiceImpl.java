package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsWarehouseInfo;
import com.ruoyi.base.domain.BsWhAreaInfo;
import com.ruoyi.base.domain.BsWhBitInfo;
import com.ruoyi.base.domain.bo.BsWhBitInfoBo;
import com.ruoyi.base.domain.vo.BsWhAreaInfoVo;
import com.ruoyi.base.domain.vo.BsWhBitInfoVo;
import com.ruoyi.base.mapper.BsWhBitInfoMapper;
import com.ruoyi.base.service.IBsWhBitInfoService;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.Objects;

/**
 * 库位信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@RequiredArgsConstructor
@Service
public class BsWhBitInfoServiceImpl implements IBsWhBitInfoService {

    private final BsWhBitInfoMapper baseMapper;

    /**
     * 查询库位信息
     */
    @Override
    public BsWhBitInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询库位信息列表
     */
    @Override
    public TableDataInfo<BsWhBitInfoVo> queryPageList(BsWhBitInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsWhBitInfo> lqw = buildQueryWrapper(bo);
        Page<BsWhBitInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库位信息列表
     */
    @Override
    public List<BsWhBitInfoVo> queryList(BsWhBitInfoBo bo) {
        LambdaQueryWrapper<BsWhBitInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsWhBitInfo> buildQueryWrapper(BsWhBitInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsWhBitInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getWhBitCoded()), BsWhBitInfo::getWhBitCoded, bo.getWhBitCoded());
        lqw.like(StringUtils.isNotBlank(bo.getWhBitName()), BsWhBitInfo::getWhBitName, bo.getWhBitName());
        lqw.eq(StringUtils.isNotBlank(bo.getWhBitCapacity()), BsWhBitInfo::getWhBitCapacity, bo.getWhBitCapacity());
        lqw.eq(StringUtils.isNotBlank(bo.getIsExclusive()), BsWhBitInfo::getIsExclusive, bo.getIsExclusive());
        lqw.eq(StringUtils.isNotBlank(bo.getExclusiveType()), BsWhBitInfo::getExclusiveType, bo.getExclusiveType());
        lqw.eq(StringUtils.isNotBlank(bo.getWhAreaCoded()), BsWhBitInfo::getWhAreaCoded, bo.getWhAreaCoded());
        lqw.like(StringUtils.isNotBlank(bo.getWhAreaName()), BsWhBitInfo::getWhAreaName, bo.getWhAreaName());
        lqw.eq(StringUtils.isNotBlank(bo.getWarehouseCoded()), BsWhBitInfo::getWarehouseCoded, bo.getWarehouseCoded());
        lqw.like(StringUtils.isNotBlank(bo.getWarehouseName()), BsWhBitInfo::getWarehouseName, bo.getWarehouseName());
        lqw.eq(StringUtils.isNotBlank(bo.getWhBitType()), BsWhBitInfo::getWhBitType, bo.getWhBitType());
        lqw.eq(StringUtils.isNotBlank(bo.getShelfCoded()), BsWhBitInfo::getShelfCoded, bo.getShelfCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getWhBitEnabled()), BsWhBitInfo::getWhBitEnabled, bo.getWhBitEnabled());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsWhBitInfo::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsWhBitInfo::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsWhBitInfo::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增库位信息
     */
    @Override
    public Boolean insertByBo(BsWhBitInfoBo bo) {
        BsWhBitInfo add = BeanUtil.toBean(bo, BsWhBitInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改库位信息
     */
    @Override
    public Boolean updateByBo(BsWhBitInfoBo bo) {
        BsWhBitInfo update = BeanUtil.toBean(bo, BsWhBitInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsWhBitInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除库位信息
     */
    @Override
    public R deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
            List<BsWhBitInfo> list =  baseMapper.selectListByIds(ids);
            if(!CollectionUtils.isEmpty(list)){
                return R.fail("已启用的库位不能删除！");
            }
        }
        return baseMapper.deleteBatchIds(ids) > 0? R.ok(): R.fail();
    }

    @Override
    public R verifyWhBitCoded(BsWhBitInfoBo bo) {
        LambdaQueryWrapper<BsWhBitInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null&&bo.getId() != 0 , BsWhBitInfo::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getWhBitCoded()), BsWhBitInfo::getWhBitCoded, bo.getWhBitCoded());
        List<BsWhBitInfoVo> bsWhBitInfoVos = baseMapper.selectVoList(lqw);
        return R.ok(bsWhBitInfoVos);
    }

    @Override
    public R listAll(BsWhBitInfoBo bo) {
        List<BsWhBitInfo> bsWhBitInfos = baseMapper.selectList();
        return R.ok(bsWhBitInfos);
    }
}
