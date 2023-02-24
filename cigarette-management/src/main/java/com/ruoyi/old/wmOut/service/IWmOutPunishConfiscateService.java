package com.ruoyi.old.wmOut.service;

import com.ruoyi.old.wmOut.domain.vo.WmOutPunishConfiscateVo;
import com.ruoyi.old.wmOut.domain.bo.WmOutPunishConfiscateBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 罚没出库信息Service接口
 *
 * @author ruoyi
 * @date 2023-02-17
 */
public interface IWmOutPunishConfiscateService {

    /**
     * 查询罚没出库信息
     */
    WmOutPunishConfiscateVo queryById(Long id);

    /**
     * 查询罚没出库信息列表
     */
    TableDataInfo<WmOutPunishConfiscateVo> queryPageList(WmOutPunishConfiscateBo bo, PageQuery pageQuery);

    /**
     * 查询罚没出库信息列表
     */
    List<WmOutPunishConfiscateVo> queryList(WmOutPunishConfiscateBo bo);

    /**
     * 新增罚没出库信息
     */
    Boolean insertByBo(WmOutPunishConfiscateBo bo);

    /**
     * 修改罚没出库信息
     */
    Boolean updateByBo(WmOutPunishConfiscateBo bo);

    /**
     * 校验并批量删除罚没出库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
