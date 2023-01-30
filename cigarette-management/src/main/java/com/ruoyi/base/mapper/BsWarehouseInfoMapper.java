package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsWarehouseInfo;
import com.ruoyi.base.domain.vo.BsWarehouseInfoVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * 仓库管理Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-30
 */
public interface BsWarehouseInfoMapper extends BaseMapperPlus<BsWarehouseInfoMapper, BsWarehouseInfo, BsWarehouseInfoVo> {

    List<BsWarehouseInfo> selectListByIds(@Param("ids") Collection<Long> ids);
}
