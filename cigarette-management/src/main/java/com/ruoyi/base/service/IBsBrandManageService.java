package com.ruoyi.base.service;

import com.ruoyi.base.domain.bo.BsBrandManageBo;
import com.ruoyi.base.domain.vo.BsBrandManageVo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 品牌管理/品牌详细信息Service接口
 *
 * @author ruoyi
 * @date 2022-12-26
 */
public interface IBsBrandManageService {

    /**
     * 查询品牌管理/品牌详细信息
     */
    BsBrandManageVo queryById(Long id);

    /**
     * 查询品牌管理/品牌详细信息列表
     */
    TableDataInfo<BsBrandManageVo> queryPageList(BsBrandManageBo bo, PageQuery pageQuery);

    /**
     * 查询品牌管理/品牌详细信息列表
     */
    List<BsBrandManageVo> queryList(BsBrandManageBo bo);

    /**
     * 新增品牌管理/品牌详细信息
     */
    Boolean insertByBo(BsBrandManageBo bo);

    /**
     * 修改品牌管理/品牌详细信息
     */
    Boolean updateByBo(BsBrandManageBo bo);

    /**
     * 校验并批量删除品牌管理/品牌详细信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    List<BsBrandManageVo> verifyBrandCode(BsBrandManageBo bo);

    String createBrandCode(BsBrandManageBo bo);
}
