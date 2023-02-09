package com.ruoyi.wmPut.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.wmPut.domain.WmPutPunishConfiscate;
import com.ruoyi.wmPut.domain.WmPutTemporary;
import com.ruoyi.wmPut.domain.bo.WmPutPunishConfiscateBo;
import com.ruoyi.wmPut.domain.bo.WmPutTemporaryBo;
import com.ruoyi.wmPut.domain.vo.WmPutPunishConfiscateVo;
import com.ruoyi.common.core.mapper.BaseMapperPlus;
import com.ruoyi.wmPut.domain.vo.WmPutTemporaryVo;
import org.apache.ibatis.annotations.Param;

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
}
