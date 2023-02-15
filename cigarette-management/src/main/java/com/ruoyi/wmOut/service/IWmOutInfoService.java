package com.ruoyi.wmOut.service;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.wmOut.domain.bo.WmOutInfoBo;
import com.ruoyi.wmOut.domain.vo.WmOutInfoVo;

import java.util.Collection;
import java.util.List;

/**
 * 商品出库信息Service接口
 *
 * @author ruoyi
 * @date 2023-02-14
 */
public interface IWmOutInfoService {

    /**
     * 查询商品出库信息
     */
    WmOutInfoVo queryById(Long id);

    /**
     * 查询商品出库信息列表
     */
    TableDataInfo<WmOutInfoVo> queryPageList(WmOutInfoBo bo, PageQuery pageQuery);

    /**
     * 查询商品出库信息列表
     */
    List<WmOutInfoVo> queryList(WmOutInfoBo bo);

    /**
     * 新增商品出库信息
     */
    Boolean insertByBo(WmOutInfoBo bo);

    /**
     * 修改商品出库信息
     */
    Boolean updateByBo(WmOutInfoBo bo);

    /**
     * 校验并批量删除商品出库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    R createWmOutCoded(String type);
}
