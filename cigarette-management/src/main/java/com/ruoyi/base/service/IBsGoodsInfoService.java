package com.ruoyi.base.service;

import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.system.domain.bo.BsGoodsInfoBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 商品信息Service接口
 *
 * @author ruoyi
 * @date 2022-12-27
 */
public interface IBsGoodsInfoService {

    /**
     * 查询商品信息
     */
    BsGoodsInfoVo queryById(Long id);

    /**
     * 查询商品信息列表
     */
    TableDataInfo<BsGoodsInfoVo> queryPageList(BsGoodsInfoBo bo, PageQuery pageQuery);

    /**
     * 查询商品信息列表
     */
    List<BsGoodsInfoVo> queryList(BsGoodsInfoBo bo);

    /**
     * 新增商品信息
     */
    Boolean insertByBo(BsGoodsInfoBo bo);

    /**
     * 修改商品信息
     */
    Boolean updateByBo(BsGoodsInfoBo bo);

    /**
     * 校验并批量删除商品信息信息
     */
    R deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    R verifyGoodsCoded(BsGoodsInfoBo bo);

    String createGoodsCoded();
}
