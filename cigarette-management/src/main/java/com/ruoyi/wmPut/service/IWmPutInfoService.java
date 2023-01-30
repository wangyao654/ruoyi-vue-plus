package com.ruoyi.wmPut.service;

import com.ruoyi.base.domain.bo.BsWhAreaInfoBo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.wmPut.domain.bo.WmPutInfoBo;
import com.ruoyi.wmPut.domain.vo.WmPutInfoVo;

import java.util.Collection;
import java.util.List;

/**
 * 商品入库信息Service接口
 *
 * @author ruoyi
 * @date 2023-01-09
 */
public interface IWmPutInfoService {

    /**
     * 查询商品入库信息
     */
    WmPutInfoVo queryById(Long id);

    /**
     * 查询商品入库信息列表
     */
    TableDataInfo<WmPutInfoVo> queryPageList(WmPutInfoBo bo, PageQuery pageQuery);

    /**
     * 查询商品入库信息列表
     */
    List<WmPutInfoVo> queryList(WmPutInfoBo bo);

    /**
     * 新增商品入库信息
     */
    Boolean insertByBo(WmPutInfoBo bo);

    /**
     * 修改商品入库信息
     */
    Boolean updateByBo(WmPutInfoBo bo);

    /**
     * 校验并批量删除商品入库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    int insertGetId(WmPutInfoBo bo);

    R verifyWmPutCoded(WmPutInfoBo bo);
}