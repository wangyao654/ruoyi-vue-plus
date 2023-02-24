package com.ruoyi.old.wmPut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.old.wmPut.domain.WmPutPunishConfiscate;
import com.ruoyi.old.wmPut.domain.bo.WmPutPunishConfiscateBo;
import com.ruoyi.old.wmPut.domain.vo.WmPutPunishConfiscateVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;

/**
 * 罚没入库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-01-29
 */
public interface WmPutPunishConfiscateMapper extends BaseMapperPlus<WmPutPunishConfiscateMapper, WmPutPunishConfiscate, WmPutPunishConfiscateVo> {
    Page<WmPutPunishConfiscateVo> selectPageList(@Param("page") Page<WmPutPunishConfiscateVo> build, @Param("bo") WmPutPunishConfiscateBo bo);
    int insertWmPutPunishConfiscate(@Param("bo") WmPutPunishConfiscate add);

    Page<WmPutPunishConfiscateVo> getPunishConfiscateList(@Param("page") Page<WmPutPunishConfiscateVo> build,@Param("bo") WmPutPunishConfiscateBo bo);

    void deleteByPutId(@Param("ids") Collection<Long> ids);
}
