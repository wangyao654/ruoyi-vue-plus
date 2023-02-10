package com.ruoyi.wmPut.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsWarehouseInfo;
import com.ruoyi.base.domain.bo.BsWhAreaInfoBo;
import com.ruoyi.base.domain.vo.BsWarehouseInfoVo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysDictType;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.system.service.ISysDictDataService;
import com.ruoyi.system.service.ISysDictTypeService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.wmPut.domain.WmPutInfo;
import com.ruoyi.wmPut.domain.bo.WmPutInfoBo;
import com.ruoyi.wmPut.domain.vo.WmPutInfoVo;
import com.ruoyi.wmPut.mapper.WmPutInfoMapper;
import com.ruoyi.wmPut.service.IWmPutInfoService;
import com.sun.mail.imap.protocol.UIDSet;
import io.netty.util.internal.StringUtil;
import lombok.RequiredArgsConstructor;
import net.sf.jsqlparser.statement.select.GroupByElement;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 商品入库信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-09
 */
@RequiredArgsConstructor
@Service
public class WmPutInfoServiceImpl implements IWmPutInfoService {

    private final WmPutInfoMapper baseMapper;
    @Autowired
    private ISysDictDataService dictDataService;
    @Autowired
    private ISysDictTypeService sysDictTypeService;
    @Autowired
    private ISysUserService userService;

    /**
     * 查询商品入库信息
     */
    @Override
    public WmPutInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询商品入库信息列表
     */
    @Override
    public TableDataInfo<WmPutInfoVo> queryPageList(WmPutInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WmPutInfo> lqw = buildQueryWrapper(bo);
        Page<WmPutInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询商品入库信息列表
     */
    @Override
    public List<WmPutInfoVo> queryList(WmPutInfoBo bo) {
        LambdaQueryWrapper<WmPutInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WmPutInfo> buildQueryWrapper(WmPutInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WmPutInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getWmPutCoded()), WmPutInfo::getWmPutCoded, bo.getWmPutCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getCertificateCoded()), WmPutInfo::getCertificateCoded, bo.getCertificateCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getCauseType()), WmPutInfo::getCauseType, bo.getCauseType());
        lqw.eq(bo.getWhPutDate() != null, WmPutInfo::getWhPutDate, bo.getWhPutDate());
        lqw.eq(bo.getVarietyNumber() != null, WmPutInfo::getVarietyNumber, bo.getVarietyNumber());
        lqw.eq(bo.getWhPutNumber() != null, WmPutInfo::getWhPutNumber, bo.getWhPutNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getInvoicesStatus()), WmPutInfo::getInvoicesStatus, bo.getInvoicesStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getStorekeeper()), WmPutInfo::getStorekeeper, bo.getStorekeeper());
        lqw.eq(StringUtils.isNotBlank(bo.getSynthesisKeeper()), WmPutInfo::getSynthesisKeeper, bo.getSynthesisKeeper());
        return lqw;
    }

    /**
     * 新增商品入库信息
     */
    @Override
    public Boolean insertByBo(WmPutInfoBo bo) {
        WmPutInfo add = BeanUtil.toBean(bo, WmPutInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改商品入库信息
     */
    @Override
    public Boolean updateByBo(WmPutInfoBo bo) {
        WmPutInfo update = BeanUtil.toBean(bo, WmPutInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(WmPutInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除商品入库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public int insertGetId(WmPutInfoBo bo) {
        WmPutInfo add = BeanUtil.toBean(bo, WmPutInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
            return add.getId().intValue();
        }
        return 0;
    }

    @Override
    public R verifyWmPutCoded(WmPutInfoBo bo) {
        LambdaQueryWrapper<WmPutInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null&&bo.getId() != 0  , WmPutInfo::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getWmPutCoded()), WmPutInfo::getWmPutCoded, bo.getWmPutCoded());
        List<WmPutInfoVo> WmPutInfoVos = this.baseMapper.selectVoList(lqw);
        return R.ok(WmPutInfoVos);
    }

    @Override
    public R createWmPutCoded(String type) {
        String coded=type;
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        String s = sdf.format(new Date());
        coded=coded+s;
        LambdaQueryWrapper<WmPutInfo> lqw = Wrappers.lambdaQuery();
        lqw.likeRight(WmPutInfo::getWmPutCoded,coded);
        List<WmPutInfoVo> wmPutInfoVos = this.baseMapper.selectVoList(lqw);
        if(CollectionUtils.isEmpty(wmPutInfoVos)){
            return R.ok(coded+"-00001");
        }
        List<Integer> collect = wmPutInfoVos.stream().map(m ->{
            String s1 = m.getWmPutCoded().split("-")[1];
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

    @Override
    public R getKeeperUser(String type) {
        //SysDictType sysDictType = sysDictTypeService.selectDictTypeByType(type);
        List<SysDictData> list=  dictDataService.selectDictDataByType(type);
        SysUser user = new SysUser();
        if(CollectionUtils.isEmpty(list)){
            return R.fail("没有该角色");
        }
        user.setPositions(list.stream().map(SysDictData::getDictValue).collect(Collectors.toList()));
        List<SysUser> list1 = userService.selectUserList(user);
        List<SysUser> collect1 = list1.stream().filter(f -> !StringUtil.isNullOrEmpty(f.getPosition())).collect(Collectors.toList());
        Map<String, List<SysUser>> collect = collect1.stream().collect(Collectors.groupingBy(SysUser::getPosition));
        //List<String,List<SysUser>> listUser=new ArrayList<>();
        return R.ok(collect);
    }
}
