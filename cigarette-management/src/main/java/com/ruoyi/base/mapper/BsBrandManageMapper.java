package com.ruoyi.base.mapper;

import com.ruoyi.base.domain.BsBrandManage;
import com.ruoyi.base.domain.vo.BsBrandManageVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;

/**
 * 品牌管理/品牌详细信息Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-26
 */
public interface BsBrandManageMapper extends BaseMapperPlus<BsBrandManageMapper, BsBrandManage, BsBrandManageVo> {

    Long selectCoded();
}
