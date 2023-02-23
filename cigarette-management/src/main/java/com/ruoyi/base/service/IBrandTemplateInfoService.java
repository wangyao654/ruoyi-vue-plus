package com.ruoyi.base.service;

import com.ruoyi.base.domain.bo.BrandTemplateInfoBo;
import com.ruoyi.base.domain.vo.BrandTemplateInfoVo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 【请填写功能名称】Service接口
 *
 * @author ruoyi
 * @date 2023-02-23
 */
public interface IBrandTemplateInfoService {

    /**
     * 查询【请填写功能名称】
     */
    BrandTemplateInfoVo queryById(Long id);

    /**
     * 查询【请填写功能名称】列表
     */
    TableDataInfo<BrandTemplateInfoVo> queryPageList(BrandTemplateInfoBo bo, PageQuery pageQuery);

    /**
     * 查询【请填写功能名称】列表
     */
    List<BrandTemplateInfoVo> queryList(BrandTemplateInfoBo bo);

    /**
     * 新增【请填写功能名称】
     */
    Boolean insertByBo(BrandTemplateInfoBo bo);

    /**
     * 修改【请填写功能名称】
     */
    Boolean updateByBo(BrandTemplateInfoBo bo);

    /**
     * 校验并批量删除【请填写功能名称】信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
