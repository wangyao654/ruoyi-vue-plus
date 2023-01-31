package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsBrandManage;
import com.ruoyi.base.domain.BsGoodsInfo;
import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 商品信息Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-26
 */
public interface BsGoodsInfoMapper extends BaseMapperPlus<BsGoodsInfoMapper, BsGoodsInfo, BsGoodsInfoVo> {

    Long selectCoded();

    List<BsGoodsInfo> selectListByIds(@Param("ids") Collection<Long> ids);
    void insertList(@Param("list") List<Map<String, String>> list);

    int deleteByCoded(@Param("goodsCoded") String goodsCoded);
}
