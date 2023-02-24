package com.ruoyi.old.wmOut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.old.wmOut.domain.WmOutInfo;
import com.ruoyi.old.wmOut.domain.bo.WmOutInfoBo;
import com.ruoyi.old.wmOut.domain.vo.WmOutInfoVo;
import com.ruoyi.old.wmOut.service.IWmOutInfoService;
import com.ruoyi.old.wmOut.mapper.WmOutInfoMapper;
import com.ruoyi.old.wmPut.service.impl.WmPutInfoServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 商品出库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@RequiredArgsConstructor
@Service
public class WmOutInfoServiceImpl implements IWmOutInfoService {

    private final WmOutInfoMapper baseMapper;
    @Autowired
    private WmPutInfoServiceImpl wmPutInfoService;

    /**
     * 查询商品出库信息
     */
    @Override
    public WmOutInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询商品出库信息列表
     */
    @Override
    public TableDataInfo<WmOutInfoVo> queryPageList(WmOutInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WmOutInfo> lqw = buildQueryWrapper(bo);
        Page<WmOutInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询商品出库信息列表
     */
    @Override
    public List<WmOutInfoVo> queryList(WmOutInfoBo bo) {
        LambdaQueryWrapper<WmOutInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmOutInfo> buildQueryWrapper(WmOutInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmOutInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getWmOutCoded()), WmOutInfo::getWmOutCoded, bo.getWmOutCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getCertificateCoded()), WmOutInfo::getCertificateCoded, bo.getCertificateCoded());
        lqw.eq(bo.getGoodsId() != null, WmOutInfo::getGoodsId, bo.getGoodsId());
        lqw.eq(bo.getWmOutNumber() != null, WmOutInfo::getWmOutNumber, bo.getWmOutNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getInvoicesStatus()), WmOutInfo::getInvoicesStatus, bo.getInvoicesStatus());
        lqw.eq(bo.getWmOutDate() != null, WmOutInfo::getWmOutDate, bo.getWmOutDate());
        lqw.eq(StringUtils.isNotBlank(bo.getStorekeeper()), WmOutInfo::getStorekeeper, bo.getStorekeeper());
        lqw.eq(bo.getStorekeeperId() != null, WmOutInfo::getStorekeeperId, bo.getStorekeeperId());
        lqw.eq(StringUtils.isNotBlank(bo.getSynthesisKeeper()), WmOutInfo::getSynthesisKeeper, bo.getSynthesisKeeper());
        lqw.eq(bo.getSynthesisKeeperId() != null, WmOutInfo::getSynthesisKeeperId, bo.getSynthesisKeeperId());
        lqw.eq(StringUtils.isNotBlank(bo.getReceiver()), WmOutInfo::getReceiver, bo.getReceiver());
        lqw.eq(bo.getReceiverId() != null, WmOutInfo::getReceiverId, bo.getReceiverId());
        lqw.eq(StringUtils.isNotBlank(bo.getEnclosure()), WmOutInfo::getEnclosure, bo.getEnclosure());
        lqw.eq(StringUtils.isNotBlank(bo.getOutType()), WmOutInfo::getOutType, bo.getOutType());
        return lqw;
    }

    /**
     * 新增商品出库信息
     */
    @Override
    public Boolean insertByBo(WmOutInfoBo bo) {
        WmOutInfo add = BeanUtil.toBean(bo, WmOutInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改商品出库信息
     */
    @Override
    public Boolean updateByBo(WmOutInfoBo bo) {
        WmOutInfo update = BeanUtil.toBean(bo, WmOutInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmOutInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除商品出库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public R createWmOutCoded(String type) {
        String coded=type;
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        String s = sdf.format(new Date());
        coded=coded+s;
        LambdaQueryWrapper<WmOutInfo> lqw = Wrappers.lambdaQuery();
        lqw.likeRight(WmOutInfo::getWmOutCoded,coded);
        List<WmOutInfoVo> wmOutInfoVos = this.baseMapper.selectVoList(lqw);
        if(CollectionUtils.isEmpty(wmOutInfoVos)){
            return R.ok(coded+"-00001");
        }
        List<Integer> collect = wmOutInfoVos.stream().map(m ->{
            String s1 = m.getWmOutCoded().split("-")[1];
            return  Integer.parseInt(s1);
        } ).collect(Collectors.toList());
        Integer max = Collections.max(collect)+1;
        int i=1;
        String m=max.toString();
        if(max<99999){
            while (i<=5-max.toString().length()){
                m=0+m;
                i++;
            }
        }else{
            coded=coded+"-"+m;
            return R.ok(coded);
        }
        coded=coded+"-"+m;
        return R.ok(coded);
    }
}
