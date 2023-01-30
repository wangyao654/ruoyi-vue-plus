package com.ruoyi.wmPut.service;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.wmPut.domain.bo.WmPutTemporaryBo;
import com.ruoyi.wmPut.domain.vo.WmPutTemporaryVo;

import java.util.Collection;
import java.util.List;

/**
 * 暂存入库信息Service接口
 *
 * @author ruoyi
 * @date 2023-01-09
 */
public interface IWmPutTemporaryService {

    /**
     * 查询暂存入库信息
     */
    WmPutTemporaryVo queryById(Long id);

    /**
     * 查询暂存入库信息列表
     */
    TableDataInfo<WmPutTemporaryVo> queryPageList(WmPutTemporaryBo bo, PageQuery pageQuery);

    /**
     * 查询暂存入库信息列表
     */
    List<WmPutTemporaryVo> queryList(WmPutTemporaryBo bo);

    /**
     * 新增暂存入库信息
     */
    Integer insertByBo(WmPutTemporaryBo bo);

    /**
     * 修改暂存入库信息
     */
    Boolean updateByBo(WmPutTemporaryBo bo);

    /**
     * 校验并批量删除暂存入库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
