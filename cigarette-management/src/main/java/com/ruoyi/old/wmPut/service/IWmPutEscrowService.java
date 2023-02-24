package com.ruoyi.old.wmPut.service;

import com.ruoyi.old.wmPut.domain.vo.WmPutEscrowVo;
import com.ruoyi.old.wmPut.domain.bo.WmPutEscrowBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 代管入库信息Service接口
 *
 * @author ruoyi
 * @date 2023-02-09
 */
public interface IWmPutEscrowService {

    /**
     * 查询代管入库信息
     */
    WmPutEscrowVo queryById(Long id);

    /**
     * 查询代管入库信息列表
     */
    TableDataInfo<WmPutEscrowVo> queryPageList(WmPutEscrowBo bo, PageQuery pageQuery);

    /**
     * 查询代管入库信息列表
     */
    List<WmPutEscrowVo> queryList(WmPutEscrowBo bo);

    /**
     * 新增代管入库信息
     */
    Boolean insertByBo(WmPutEscrowBo bo);

    /**
     * 修改代管入库信息
     */
    Boolean updateByBo(WmPutEscrowBo bo);

    /**
     * 校验并批量删除代管入库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    TableDataInfo<WmPutEscrowVo> getEscrowList(WmPutEscrowBo bo, PageQuery pageQuery);

    Boolean delPutEscrowByPutId(Collection<Long> asList, boolean b);
}
