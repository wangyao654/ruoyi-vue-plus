package com.ruoyi.wmPut.service;

import com.ruoyi.wmPut.domain.WmPutPunishConfiscate;
import com.ruoyi.wmPut.domain.vo.WmPutPunishConfiscateVo;
import com.ruoyi.wmPut.domain.bo.WmPutPunishConfiscateBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 罚没入库信息Service接口
 *
 * @author ruoyi
 * @date 2023-01-29
 */
public interface IWmPutPunishConfiscateService {

    /**
     * 查询罚没入库信息
     */
    WmPutPunishConfiscateVo queryById(Long id);

    /**
     * 查询罚没入库信息列表
     */
    TableDataInfo<WmPutPunishConfiscateVo> queryPageList(WmPutPunishConfiscateBo bo, PageQuery pageQuery);

    /**
     * 查询罚没入库信息列表
     */
    List<WmPutPunishConfiscateVo> queryList(WmPutPunishConfiscateBo bo);

    /**
     * 新增罚没入库信息
     */
    Integer insertByBo(WmPutPunishConfiscateBo bo);

    /**
     * 修改罚没入库信息
     */
    Boolean updateByBo(WmPutPunishConfiscateBo bo);

    /**
     * 校验并批量删除罚没入库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    TableDataInfo<WmPutPunishConfiscateVo> getPunishConfiscateList(WmPutPunishConfiscateBo bo, PageQuery pageQuery);

    Boolean delPutPunishConfiscateByPutId(Collection<Long> ids, Boolean isValid);
}
