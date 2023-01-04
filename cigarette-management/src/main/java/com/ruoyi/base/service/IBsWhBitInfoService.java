package com.ruoyi.base.service;

import com.ruoyi.base.domain.bo.BsWhBitInfoBo;
import com.ruoyi.base.domain.vo.BsWhBitInfoVo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 库位信息Service接口
 *
 * @author ruoyi
 * @date 2023-01-02
 */
public interface IBsWhBitInfoService {

    /**
     * 查询库位信息
     */
    BsWhBitInfoVo queryById(Long id);

    /**
     * 查询库位信息列表
     */
    TableDataInfo<BsWhBitInfoVo> queryPageList(BsWhBitInfoBo bo, PageQuery pageQuery);

    /**
     * 查询库位信息列表
     */
    List<BsWhBitInfoVo> queryList(BsWhBitInfoBo bo);

    /**
     * 新增库位信息
     */
    Boolean insertByBo(BsWhBitInfoBo bo);

    /**
     * 修改库位信息
     */
    Boolean updateByBo(BsWhBitInfoBo bo);

    /**
     * 校验并批量删除库位信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    R verifyWhBitCoded(BsWhBitInfoBo bo);
}
