package com.ruoyi.wmPut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import com.ruoyi.wmPut.domain.WmPutTemporary;
import com.ruoyi.wmPut.domain.bo.WmPutTemporaryBo;
import com.ruoyi.wmPut.domain.vo.WmPutTemporaryVo;
import org.apache.ibatis.annotations.Param;

/**
 * 暂存入库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-01-09
 */
public interface WmPutTemporaryMapper extends BaseMapperPlus<WmPutTemporaryMapper, WmPutTemporary, WmPutTemporaryVo> {

    Page<WmPutTemporaryVo> selectPageList(@Param("page") Page<WmPutTemporaryVo> build,@Param("bo") WmPutTemporaryBo bo);

    int insertWmPutTemporary(@Param("bo")WmPutTemporary add);
}
