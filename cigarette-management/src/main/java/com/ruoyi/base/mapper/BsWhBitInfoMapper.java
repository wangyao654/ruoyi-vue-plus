package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsWhBitInfo;
import com.ruoyi.base.domain.vo.BsWhBitInfoVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * 库位信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-01-02
 */
public interface BsWhBitInfoMapper extends BaseMapperPlus<BsWhBitInfoMapper, BsWhBitInfo, BsWhBitInfoVo> {

    int updateWarehouseNameByWarehouseCoded(@Param("warehouseCoded") String warehouseCoded, @Param("warehouseName") String warehouseName);

    int updateWhAreaNameByWhAreaCoded(@Param("whAreaCoded")String whAreaCoded,@Param("whAreaName") String whAreaName);

    List<BsWhBitInfo> selectListByIds(@Param("ids") Collection<Long> ids);
}
