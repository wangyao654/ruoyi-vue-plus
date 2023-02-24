package com.ruoyi.old.wmOut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.old.wmOut.domain.WmOutEscrow;
import com.ruoyi.old.wmOut.domain.bo.WmOutEscrowBo;
import com.ruoyi.old.wmOut.domain.vo.WmOutEscrowVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;

/**
 * 代管出库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-02-16
 */
public interface WmOutEscrowMapper extends BaseMapperPlus<WmOutEscrowMapper, WmOutEscrow, WmOutEscrowVo> {

    Page<WmOutEscrowVo> selectPageList(@Param("page") Page<WmOutEscrowVo> build,@Param("bo") WmOutEscrowBo bo);

    void deleteByOutId(@Param("ids") Collection<Long> ids);

    WmOutEscrowVo selectEscrowById(@Param("id") Long id);
}
