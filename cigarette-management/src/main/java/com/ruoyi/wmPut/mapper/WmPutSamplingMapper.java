package com.ruoyi.wmPut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import com.ruoyi.wmPut.domain.WmPutSampling;
import com.ruoyi.wmPut.domain.bo.WmPutSamplingBo;
import com.ruoyi.wmPut.domain.vo.WmPutSamplingVo;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;

/**
 * 抽检返还入库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-02-13
 */
public interface WmPutSamplingMapper extends BaseMapperPlus<WmPutSamplingMapper, WmPutSampling, WmPutSamplingVo> {

    void delSamplingByPutId(@Param("ids") Collection<Long> asList);

    Page<WmPutSamplingVo> selectPageList(@Param("page") Page<WmPutSamplingVo> build,@Param("bo") WmPutSamplingBo bo);

    Page<WmPutSamplingVo> getPutSamplingList(Page<Object> build, WmPutSamplingBo bo);
}
