package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsWhAreaInfo;
import com.ruoyi.base.domain.vo.BsWhAreaInfoVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * 库区信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-01-02
 */
public interface BsWhAreaInfoMapper extends BaseMapperPlus<BsWhAreaInfoMapper, BsWhAreaInfo, BsWhAreaInfoVo> {

    int updateWarehouseNameByWarehouseCoded(@Param("warehouseCoded") String warehouseCoded,@Param("warehouseName") String warehouseName);

    List<BsWhAreaInfo> selectListByIds(@Param("ids") Collection<Long> ids);
}
