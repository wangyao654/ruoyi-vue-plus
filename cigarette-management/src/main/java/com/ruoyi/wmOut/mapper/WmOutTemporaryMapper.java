package com.ruoyi.wmOut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.wmOut.domain.WmOutInfo;
import com.ruoyi.wmOut.domain.WmOutTemporary;
import com.ruoyi.wmOut.domain.bo.WmOutTemporaryBo;
import com.ruoyi.wmOut.domain.vo.WmOutTemporaryVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;

/**
 * 暂存出库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-02-14
 */
public interface WmOutTemporaryMapper extends BaseMapperPlus<WmOutTemporaryMapper, WmOutTemporary, WmOutTemporaryVo> {

    Page<WmOutTemporaryVo> selectPageList(@Param("page") Page<WmOutTemporaryVo> build,@Param("bo") WmOutTemporaryBo bo);

    void deleteByOutId(@Param("ids") Collection<Long> ids);

    void insertOutInfo(@Param("info") WmOutInfo wmOutInfo);

    WmOutTemporaryVo selectWmOutTemporaryById(@Param("id") Long id);
}
