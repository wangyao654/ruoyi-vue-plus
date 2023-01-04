package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsGoodsInfo;
import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;

/**
 * 商品信息Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-26
 */
public interface BsGoodsInfoMapper extends BaseMapperPlus<BsGoodsInfoMapper, BsGoodsInfo, BsGoodsInfoVo> {

    Long selectCoded();
}
