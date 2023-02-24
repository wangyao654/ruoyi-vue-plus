package com.ruoyi.old.wmPut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.old.wmPut.domain.WmPutEscrow;
import com.ruoyi.old.wmPut.domain.bo.WmPutEscrowBo;
import com.ruoyi.old.wmPut.domain.vo.WmPutEscrowVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;

/**
 * 代管入库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-02-09
 */
public interface WmPutEscrowMapper extends BaseMapperPlus<WmPutEscrowMapper, WmPutEscrow, WmPutEscrowVo> {

    Page<WmPutEscrowVo> selectPageList(@Param("page") Page<WmPutEscrowVo> build,@Param("bo") WmPutEscrowBo lqw);

    Page<WmPutEscrowVo> getEscrowList(@Param("page")Page<WmPutEscrowVo> build,@Param("bo") WmPutEscrowBo bo);

    void deleteByPutId(@Param("ids") Collection<Long> asList);
}