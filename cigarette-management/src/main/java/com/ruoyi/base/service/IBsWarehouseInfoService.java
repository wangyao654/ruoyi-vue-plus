package com.ruoyi.base.service;

import com.ruoyi.base.domain.bo.BsWarehouseInfoBo;
import com.ruoyi.base.domain.vo.BsWarehouseInfoVo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 仓库管理Service接口
 *
 * @author ruoyi
 * @date 2022-12-30
 */
public interface IBsWarehouseInfoService {

    /**
     * 查询仓库管理
     */
    BsWarehouseInfoVo queryById(Long id);

    /**
     * 查询仓库管理列表
     */
    TableDataInfo<BsWarehouseInfoVo> queryPageList(BsWarehouseInfoBo bo, PageQuery pageQuery);

    /**
     * 查询仓库管理列表
     */
    List<BsWarehouseInfoVo> queryList(BsWarehouseInfoBo bo);

    /**
     * 新增仓库管理
     */
    Boolean insertByBo(BsWarehouseInfoBo bo);

    /**
     * 修改仓库管理
     */
    Boolean updateByBo(BsWarehouseInfoBo bo);

    /**
     * 校验并批量删除仓库管理信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    R verifyWarehouseCoded(BsWarehouseInfoBo bo);
}
