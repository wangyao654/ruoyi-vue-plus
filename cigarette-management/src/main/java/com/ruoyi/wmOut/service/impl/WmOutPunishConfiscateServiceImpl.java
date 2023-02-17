package com.ruoyi.wmOut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.wmOut.domain.bo.WmOutPunishConfiscateBo;
import com.ruoyi.wmOut.domain.vo.WmOutPunishConfiscateVo;
import com.ruoyi.wmOut.domain.WmOutPunishConfiscate;
import com.ruoyi.wmOut.mapper.WmOutPunishConfiscateMapper;
import com.ruoyi.wmOut.service.IWmOutPunishConfiscateService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 罚没出库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-17
 */
@RequiredArgsConstructor
@Service
public class WmOutPunishConfiscateServiceImpl implements IWmOutPunishConfiscateService {

    private final WmOutPunishConfiscateMapper baseMapper;

    /**
     * 查询罚没出库信息
     */
    @Override
    public WmOutPunishConfiscateVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询罚没出库信息列表
     */
    @Override
    public TableDataInfo<WmOutPunishConfiscateVo> queryPageList(WmOutPunishConfiscateBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WmOutPunishConfiscate> lqw = buildQueryWrapper(bo);
        Page<WmOutPunishConfiscateVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询罚没出库信息列表
     */
    @Override
    public List<WmOutPunishConfiscateVo> queryList(WmOutPunishConfiscateBo bo) {
        LambdaQueryWrapper<WmOutPunishConfiscate> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmOutPunishConfiscate> buildQueryWrapper(WmOutPunishConfiscateBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmOutPunishConfiscate> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getWmOutId() != null, WmOutPunishConfiscate::getWmOutId, bo.getWmOutId());
        lqw.eq(StringUtils.isNotBlank(bo.getClient()), WmOutPunishConfiscate::getClient, bo.getClient());
        lqw.eq(StringUtils.isNotBlank(bo.getCause()), WmOutPunishConfiscate::getCause, bo.getCause());
        lqw.eq(bo.getWmOutReason() != null, WmOutPunishConfiscate::getWmOutReason, bo.getWmOutReason());
        lqw.eq(StringUtils.isNotBlank(bo.getCigaretteQuality()), WmOutPunishConfiscate::getCigaretteQuality, bo.getCigaretteQuality());
        lqw.eq(bo.getUnitCoded() != null, WmOutPunishConfiscate::getUnitCoded, bo.getUnitCoded());
        lqw.like(StringUtils.isNotBlank(bo.getUnitName()), WmOutPunishConfiscate::getUnitName, bo.getUnitName());
        return lqw;
    }

    /**
     * 新增罚没出库信息
     */
    @Override
    public Boolean insertByBo(WmOutPunishConfiscateBo bo) {
        WmOutPunishConfiscate add = BeanUtil.toBean(bo, WmOutPunishConfiscate.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改罚没出库信息
     */
    @Override
    public Boolean updateByBo(WmOutPunishConfiscateBo bo) {
        WmOutPunishConfiscate update = BeanUtil.toBean(bo, WmOutPunishConfiscate.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmOutPunishConfiscate entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除罚没出库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
