package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsDealingsunitInfo;
import com.ruoyi.base.domain.vo.BsDealingsunitInfoVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * 来往单位信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-01-04
 */
public interface BsDealingsunitInfoMapper extends BaseMapperPlus<BsDealingsunitInfoMapper, BsDealingsunitInfo, BsDealingsunitInfoVo> {

    List<BsDealingsunitInfo> selectListByIds(@Param("ids") Collection<Long> ids);
}
