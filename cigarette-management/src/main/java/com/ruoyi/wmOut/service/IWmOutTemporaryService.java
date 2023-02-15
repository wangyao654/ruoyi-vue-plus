package com.ruoyi.wmOut.service;

import com.ruoyi.wmOut.domain.WmOutTemporary;
import com.ruoyi.wmOut.domain.vo.WmOutTemporaryVo;
import com.ruoyi.wmOut.domain.bo.WmOutTemporaryBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 暂存出库信息Service接口
 *
 * @author ruoyi
 * @date 2023-02-14
 */
public interface IWmOutTemporaryService {

    /**
     * 查询暂存出库信息
     */
    WmOutTemporaryVo queryById(Long id);

    /**
     * 查询暂存出库信息列表
     */
    TableDataInfo<WmOutTemporaryVo> queryPageList(WmOutTemporaryBo bo, PageQuery pageQuery);

    /**
     * 查询暂存出库信息列表
     */
    List<WmOutTemporaryVo> queryList(WmOutTemporaryBo bo);

    /**
     * 新增暂存出库信息
     */
    Boolean insertByBo(WmOutTemporaryBo bo);

    /**
     * 修改暂存出库信息
     */
    Boolean updateByBo(WmOutTemporaryBo bo);

    /**
     * 校验并批量删除暂存出库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
