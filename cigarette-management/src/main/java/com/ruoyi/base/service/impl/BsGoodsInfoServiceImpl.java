package com.ruoyi.base.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.base.domain.BsGoodsInfo;
import com.ruoyi.base.domain.bo.BsBrandManageBo;
import com.ruoyi.base.domain.vo.BsBrandManageVo;
import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.base.mapper.BsGoodsInfoMapper;
import com.ruoyi.base.service.IBsGoodsInfoService;
import com.ruoyi.common.businessUtils.ExcelConst;
import com.ruoyi.common.businessUtils.businessUtils;
import com.ruoyi.base.utils.goodsImportUtil;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.system.service.ISysDictDataService;
import com.ruoyi.system.service.ISysDictTypeService;
import com.ruoyi.wmPut.domain.bo.WmPutInfoBo;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.bo.BsGoodsInfoBo;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 商品信息Service业务层处理
 *
 * @author ruoyi
 * @date 2022-12-27
 */
@RequiredArgsConstructor
@Service
public class BsGoodsInfoServiceImpl implements IBsGoodsInfoService {

    private final BsGoodsInfoMapper baseMapper;
    private final BsBrandManageServiceImpl bsBrandManageService;
    @Autowired
    private ISysDictDataService dictDataService;
    @Autowired
    private ISysDictTypeService sysDictTypeService;

    /**
     * 查询商品信息
     */
    @Override
    public BsGoodsInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询商品信息列表
     */
    @Override
    public TableDataInfo<BsGoodsInfoVo> queryPageList(BsGoodsInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = buildQueryWrapper(bo);
        Page<BsGoodsInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询商品信息列表
     */
    @Override
    public List<BsGoodsInfoVo> queryList(BsGoodsInfoBo bo) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BsGoodsInfo> buildQueryWrapper(BsGoodsInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BsGoodsInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getGoodsCoded() != null, BsGoodsInfo::getGoodsCoded, bo.getGoodsCoded());
        lqw.like(StringUtils.isNotBlank(bo.getGoodsName()), BsGoodsInfo::getGoodsName, bo.getGoodsName());
        lqw.like(StringUtils.isNotBlank(bo.getBrandName()), BsGoodsInfo::getBrandName, bo.getBrandName());
        lqw.eq(bo.getBrandCoded() != null, BsGoodsInfo::getBrandCoded, bo.getBrandCoded());
        lqw.eq(StringUtils.isNotBlank(bo.getSmallBoxBarcode()), BsGoodsInfo::getSmallBoxBarcode, bo.getSmallBoxBarcode());
        lqw.eq(StringUtils.isNotBlank(bo.getBarboxBarcode()), BsGoodsInfo::getBarboxBarcode, bo.getBarboxBarcode());
        lqw.eq(StringUtils.isNotBlank(bo.getGoodsType()), BsGoodsInfo::getGoodsType, bo.getGoodsType());
        lqw.eq(StringUtils.isNotBlank(bo.getGoodsSpecification()), BsGoodsInfo::getGoodsSpecification, bo.getGoodsSpecification());
       /* lqw.eq(StringUtils.isNotBlank(bo.getMeasureUnit()), BsGoodsInfo::getMeasureUnit, bo.getMeasureUnit());
        lqw.eq(StringUtils.isNotBlank(bo.getSingleBarboxNumber()), BsGoodsInfo::getSingleBarboxNumber, bo.getSingleBarboxNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getSmallBoxNumber()), BsGoodsInfo::getSmallBoxNumber, bo.getSmallBoxNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getPackagingForms()), BsGoodsInfo::getPackagingForms, bo.getPackagingForms());*/
        lqw.eq(StringUtils.isNotBlank(bo.getListingStatus()), BsGoodsInfo::getListingStatus, bo.getListingStatus());
        if (Objects.nonNull(bo.getStartTime()) && Objects.nonNull(bo.getEndTime())) {
            lqw.between(BsGoodsInfo::getUpdateTime, bo.getStartTime(), bo.getEndTime());
        } else if (Objects.nonNull(bo.getStartTime())) {
            lqw.ge(BsGoodsInfo::getUpdateTime, bo.getStartTime());
        } else if (Objects.nonNull(bo.getEndTime())) {
            lqw.le(BsGoodsInfo::getUpdateTime, bo.getEndTime());
        }
        return lqw;
    }

    /**
     * 新增商品信息
     */
    @Override
    public Boolean insertByBo(BsGoodsInfoBo bo) {
        BsGoodsInfo add = BeanUtil.toBean(bo, BsGoodsInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改商品信息
     */
    @Override
    public Boolean updateByBo(BsGoodsInfoBo bo) {
        BsGoodsInfo update = BeanUtil.toBean(bo, BsGoodsInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BsGoodsInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除商品信息
     */
    @Override
    public R deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
            List<BsGoodsInfo> list =  baseMapper.selectListByIds(ids);
            if(!CollectionUtils.isEmpty(list)){
                return R.fail("已上市的商品不能删除！");
            }
        }
        return baseMapper.deleteBatchIds(ids) > 0? R.ok(): R.fail();
    }

    @Override
    public R verifyGoodsCoded(BsGoodsInfoBo bo) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null&&bo.getId() != 0  , BsGoodsInfo::getId, bo.getId());
        lqw.eq(StringUtils.isNotEmpty(bo.getGoodsCoded()), BsGoodsInfo::getGoodsCoded, bo.getGoodsCoded());
        List<BsGoodsInfoVo> bsGoodsInfoVos = this.baseMapper.selectVoList(lqw);
        return R.ok(bsGoodsInfoVos);
    }

    @Override
    public Map<String, List<String>> queryDiction() {
        //查询字典
        List<SysDictData> list= dictDataService.selectDictDataByTypeList(ExcelConst.dictGoodsType);
        Map<String, List<SysDictData>> map = list.stream().collect(Collectors.groupingBy(SysDictData::getDictType));
        Iterator<Map.Entry<String, List<SysDictData>>> iterator = map.entrySet().iterator();
        Map<String,List<String>> listMap = new HashMap<>();
        while (iterator.hasNext()){
            Map.Entry<String, List<SysDictData>> next = iterator.next();
            List<SysDictData> value = next.getValue();
            List<String> collect = value.stream().map(SysDictData::getDictLabel).collect(Collectors.toList());
            listMap.put(next.getKey(),collect);
        }
        List<String> dictGoodsType = ExcelConst.dictGoodsType;
        List<String> dictGoodsTypeName = ExcelConst.dictGoodsTypeName;
        Map<String,List<String>> mapBrand =  new HashMap<>();
        for (int i = 0; i < dictGoodsType.size(); i++) {
            mapBrand.put(dictGoodsTypeName.get(i),listMap.get(dictGoodsType.get(i)));
        }
        //查询品牌字典
        BsBrandManageBo bsBrandManageBo = new BsBrandManageBo();
        bsBrandManageBo.setBrandEnabled("0");
        List<BsBrandManageVo> list1 = bsBrandManageService.queryList(bsBrandManageBo);
        mapBrand.put("品牌名称",list1.stream().map(BsBrandManageVo::getBrandName).collect(Collectors.toList()));
        return mapBrand;
    }

    /*
     * 导入校验
     * */
    @Override
    public Map<String, Object> importData(MultipartFile file) throws Exception {
        Map<String, Object> map = goodsImportUtil.importTemp( file, ExcelConst.goodsField,ExcelConst.goodsTitle,sysDictTypeService,false,baseMapper,bsBrandManageService);
        List<Map<String,String>> list= (List<Map<String, String>>) map.get("successData");
        Long deptId = LoginHelper.getDeptId();
        if(!CollectionUtils.isEmpty(list)){
            //list = list.stream().peek(p->p.put("deptId",deptId+"")).collect(Collectors.toList());
            //   baseMapper.insertList(list);
            //商品名重复
            //baseMapper.deleteByCoded();
            baseMapper.insertList(list);
        }
        return map;
    }

    @Override
    public R selectBybarcode(String barcode) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(BsGoodsInfo::getBarboxBarcode,barcode);
        lqw.or().eq(BsGoodsInfo::getSmallBoxBarcode,barcode);
        List<BsGoodsInfo> bsGoodsInfos = baseMapper.selectList(lqw);
        if(CollectionUtils.isEmpty(bsGoodsInfos)){
            return R.fail(504,"不存在，请先维护商品数据。");
        }
        //返回条数
        BsGoodsInfo bsGoodsInfo = bsGoodsInfos.get(0);
        WmPutInfoBo wmPutInfoBo = new WmPutInfoBo();
        wmPutInfoBo.setGoodsCoded(bsGoodsInfo.getGoodsCoded());
        wmPutInfoBo.setGoodsName(bsGoodsInfo.getGoodsName());
        wmPutInfoBo.setGoodsSpecification(bsGoodsInfo.getGoodsName());
        //条数
         Double sum=Double.valueOf(0);
        int i= Integer.parseInt(bsGoodsInfo.getMeasureUnit());
        switch (i){
            case 1: sum= num(1.0);
                 break;
            case 2: verdict(sum,bsGoodsInfo.getSingleBarboxNumber());
                 break;
            case 3:verdict(sum,bsGoodsInfo.getSingleBarboxNumber());
                 break;
      /*      case 4:tingVerdict(sum,bsGoodsInfo);
                break;*/
        }
        //品种数
        Long variety=1L;
        wmPutInfoBo.setWhPutNumber(sum);
        wmPutInfoBo.setVarietyNumber(variety);
        return R.ok(wmPutInfoBo);
    }

    @Override
    public R getAllGoodsInfoList(BsGoodsInfoBo bo) {
        LambdaQueryWrapper<BsGoodsInfo> lqw = buildQueryWrapper(bo);
        List<BsGoodsInfoVo> bsGoodsInfos = baseMapper.selectVoList(lqw);
        return R.ok(bsGoodsInfos);
    }

    private void verdict(Double sum,String singleBarboxNumber){
        switch (Integer.parseInt(singleBarboxNumber)){
            case 1: sum=num(1.00/10.00);
            break;
            case 2: sum=0.20;
            break;
            case 3:sum=num(1.00/6.00);
            break;
            case 4:sum=0.25;
            break;
        }
}

private void  tingVerdict(Double sum, BsGoodsInfo bsGoodsInfo){
       switch (Integer.parseInt(bsGoodsInfo.getSmallBoxNumber())){
           case 1: verdict(sum,bsGoodsInfo.getSingleBarboxNumber());
           sum= num(sum/20.00);
           break;
           case 2:verdict(sum,bsGoodsInfo.getSingleBarboxNumber());
               sum=num(sum/16.00);
               break;
           case 3:verdict(sum,bsGoodsInfo.getSingleBarboxNumber());
               break;
       }
}
    @Override
    public String createGoodsCoded() {
        Long  i = baseMapper.selectCoded();
        if(i==null){
            i=0L;
        }
        Long coded=i+1;
        int count = businessUtils.getCount(coded);
        String goodsCoded;
        switch (count){
            case 1: goodsCoded= "000000"+coded;
             break;
            case 2:  goodsCoded="00000"+coded;
            break;
            case 3:goodsCoded="0000"+coded;
            break;
            case 4:goodsCoded="000"+coded;
            break;
            case 5:goodsCoded="00"+coded;
            break;
            case 6:goodsCoded="0"+coded;
            break;
            default:goodsCoded=coded.toString();
        }
        return goodsCoded;
    }
    private Double num (Double d){
        return Double.valueOf(String.format("%.2f",d));
    }
}
