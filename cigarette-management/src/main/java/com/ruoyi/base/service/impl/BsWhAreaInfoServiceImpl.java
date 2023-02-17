package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsWarehouseInfo;
import com.ruoyi.base.mapper.BsWhBitInfoMapper;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.base.domain.bo.BsWhAreaInfoBo;
import com.ruoyi.base.domain.vo.BsWhAreaInfoVo;
import com.ruoyi.base.domain.BsWhAreaInfo;
import com.ruoyi.base.mapper.BsWhAreaInfoMapper;
import com.ruoyi.base.service.IBsWhAreaInfoService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.Objects;

/**
 * 库区信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@RequiredArgsConstructor
@Service
public class BsWhAreaInfoServiceImpl implements IBsWhAreaInfoService {

    private final BsWhAreaInfoMapper baseMapper;
    private final BsWhBitInfoMapper bsWhBitInfoMapper;

    /**
     * 查询库区信息
     */
    @Override
    public BsWhAreaInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询库区信息列表
     */
    @Override
    public TableDataInfo<BsWhAreaInfoVo> queryPageList(BsWhAreaInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsWhAreaInfo> lqw = buildQueryWrapper(bo);
        Page<BsWhAreaInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询库区信息列表
     */
    @Override
    public List<BsWhAreaInfoVo> queryList(BsWhAreaInfoBo bo) {
        LambdaQueryWrapper<BsWhAreaInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsWhAreaInfo> buildQueryWrapper(BsWhAreaInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsWhAreaInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getWarehouseCoded() != null, BsWhAreaInfo::getWarehouseCoded, bo.getWarehouseCoded());
        lqw.like(StringUtils.isNotBlank(bo.getWarehouseName()), BsWhAreaInfo::getWarehouseName, bo.getWarehouseName());
        lqw.eq(StringUtils.isNotBlank(bo.getWhAreaEnabled()), BsWhAreaInfo::getWhAreaEnabled, bo.getWhAreaEnabled());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsWhAreaInfo::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsWhAreaInfo::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsWhAreaInfo::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增库区信息
     */
    @Override
    public Boolean insertByBo(BsWhAreaInfoBo bo) {
        BsWhAreaInfo add = BeanUtil.toBean(bo, BsWhAreaInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改库区信息
     */
    @Override
    @Transactional
    public Boolean updateByBo(BsWhAreaInfoBo bo) {
        BsWhAreaInfo update = BeanUtil.toBean(bo, BsWhAreaInfo.class);
        validEntityBeforeSave(update);
        //修改库位中库区编号
        int i=bsWhBitInfoMapper.updateWhAreaNameByWhAreaCoded(bo.getWhAreaCoded(),bo.getWhAreaName());
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsWhAreaInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除库区信息
     */
    @Override
    public R deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
            List<BsWhAreaInfo> list =  baseMapper.selectListByIds(ids);
            if(!CollectionUtils.isEmpty(list)){
                return R.fail("已启用的库区不能删除！");
            }
        }
        return baseMapper.deleteBatchIds(ids) > 0? R.ok(): R.fail();
    }

    @Override
    public BsWhAreaInfoVo getWhAreaInfoByWhAreaCoded(String whAreaCoded) {
        LambdaQueryWrapper<BsWhAreaInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(whAreaCoded),BsWhAreaInfo::getWhAreaCoded,whAreaCoded);
        BsWhAreaInfoVo bsWhAreaInfoVo = baseMapper.selectVoOne(lqw);
        return bsWhAreaInfoVo;
    }

    @Override
    public R verifyWhAreaCoded(BsWhAreaInfoBo bo) {
        LambdaQueryWrapper<BsWhAreaInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null&&bo.getId() != 0  , BsWhAreaInfo::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getWhAreaCoded()), BsWhAreaInfo::getWhAreaCoded, bo.getWhAreaCoded());
        List<BsWhAreaInfoVo> bsWhAreaInfoVos = baseMapper.selectVoList(lqw);
        return R.ok(bsWhAreaInfoVos);
    }
}
