package com.ruoyi.wmOut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.wmOut.domain.WmOutPunishConfiscate;
import com.ruoyi.wmOut.domain.bo.WmOutPunishConfiscateBo;
import com.ruoyi.wmOut.domain.vo.WmOutPunishConfiscateVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;

/**
 * 罚没出库信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-02-17
 */
public interface WmOutPunishConfiscateMapper extends BaseMapperPlus<WmOutPunishConfiscateMapper, WmOutPunishConfiscate, WmOutPunishConfiscateVo> {

    Page<WmOutPunishConfiscateVo> selectPageList(@Param("page") Page<WmOutPunishConfiscateVo> build,@Param("bo") WmOutPunishConfiscateBo bo);

    WmOutPunishConfiscateVo selectPunishConfiscateById(@Param("id") Long id);

    void deleteByOutId(@Param("ids") Collection<Long> ids);
}
