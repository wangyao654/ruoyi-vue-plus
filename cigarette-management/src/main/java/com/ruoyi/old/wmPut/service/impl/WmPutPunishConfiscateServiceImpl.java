package com.ruoyi.old.wmPut.service.impl;

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
import com.ruoyi.old.wmPut.domain.bo.WmPutPunishConfiscateBo;
import com.ruoyi.old.wmPut.domain.vo.WmPutPunishConfiscateVo;
import com.ruoyi.old.wmPut.domain.WmPutPunishConfiscate;
import com.ruoyi.old.wmPut.mapper.WmPutPunishConfiscateMapper;
import com.ruoyi.old.wmPut.service.IWmPutPunishConfiscateService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 罚没入库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-29
 */
@RequiredArgsConstructor
@Service
public class WmPutPunishConfiscateServiceImpl implements IWmPutPunishConfiscateService {

    private final WmPutPunishConfiscateMapper baseMapper;
    @Autowired
    private WmPutTemporaryServiceImpl wmPutTemporaryService;
    @Autowired
    private WmPutInfoServiceImpl wmPutInfoService;

    /**
     * 查询罚没入库信息
     */
    @Override
    public WmPutPunishConfiscateVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询罚没入库信息列表
     */
    @Override
    public TableDataInfo<WmPutPunishConfiscateVo> queryPageList(WmPutPunishConfiscateBo bo, PageQuery pageQuery) {
       /* LambdaQueryWrapper<WmPutPunishConfiscate> lqw = buildQueryWrapper(bo);*/
        Page<WmPutPunishConfiscateVo> result = baseMapper.selectPageList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(wmPutTemporaryService.getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(wmPutTemporaryService.getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }

    /**
     * 查询罚没入库信息列表
     */
    @Override
    public List<WmPutPunishConfiscateVo> queryList(WmPutPunishConfiscateBo bo) {
        LambdaQueryWrapper<WmPutPunishConfiscate> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmPutPunishConfiscate> buildQueryWrapper(WmPutPunishConfiscateBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmPutPunishConfiscate> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getCigaretteType()), WmPutPunishConfiscate::getCigaretteType, bo.getCigaretteType());
        return lqw;
    }

    /**
     * 新增罚没入库信息
     */
    @Override
    public Integer insertByBo(WmPutPunishConfiscateBo bo) {
        WmPutPunishConfiscate add = BeanUtil.toBean(bo, WmPutPunishConfiscate.class);
        validEntityBeforeSave(add);
        int id = baseMapper.insert(add);
        boolean flag =false;
        if(id!=0){
            flag=true;
        }
        if (flag) {
            return add.getId().intValue();
        }
        return 0;
    }

    /**
     * 修改罚没入库信息
     */
    @Override
    public Boolean updateByBo(WmPutPunishConfiscateBo bo) {
        WmPutPunishConfiscate update = BeanUtil.toBean(bo, WmPutPunishConfiscate.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmPutPunishConfiscate entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除罚没入库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public TableDataInfo<WmPutPunishConfiscateVo> getPunishConfiscateList(WmPutPunishConfiscateBo bo, PageQuery pageQuery) {
        Page<WmPutPunishConfiscateVo> result = baseMapper.getPunishConfiscateList(pageQuery.build(), bo);
        result.getRecords().forEach(t->{
            t.setStorekeeper(wmPutTemporaryService.getKeeper(t.getStorekeeper(),null).get("2"));
            t.setSynthesisKeeper(wmPutTemporaryService.getKeeper(null,t.getSynthesisKeeper()).get("1"));
        });
        return TableDataInfo.build(result);
    }

    @Override
    public Boolean delPutPunishConfiscateByPutId(Collection<Long> ids, Boolean isValid) {
        //删除副表数据
        baseMapper.deleteByPutId(ids);
        return wmPutInfoService.deleteWithValidByIds(ids,isValid);
    }
}
