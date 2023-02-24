package com.ruoyi.old.wmOut.service;

import com.ruoyi.old.wmOut.domain.bo.WmOutEscrowBo;
import com.ruoyi.old.wmOut.domain.vo.WmOutEscrowVo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 代管出库信息Service接口
 *
 * @author ruoyi
 * @date 2023-02-16
 */
public interface IWmOutEscrowService {

    /**
     * 查询代管出库信息
     */
    WmOutEscrowVo queryById(Long id);

    /**
     * 查询代管出库信息列表
     */
    TableDataInfo<WmOutEscrowVo> queryPageList(WmOutEscrowBo bo, PageQuery pageQuery);

    /**
     * 查询代管出库信息列表
     */
    List<WmOutEscrowVo> queryList(WmOutEscrowBo bo);

    /**
     * 新增代管出库信息
     */
    Boolean insertByBo(WmOutEscrowBo bo);

    /**
     * 修改代管出库信息
     */
    Boolean updateByBo(WmOutEscrowBo bo);

    /**
     * 校验并批量删除代管出库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
