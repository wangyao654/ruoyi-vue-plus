package com.ruoyi.base.service;

import com.ruoyi.base.domain.BsDealingsunitInfo;
import com.ruoyi.base.domain.vo.BsDealingsunitInfoVo;
import com.ruoyi.base.domain.bo.BsDealingsunitInfoBo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 来往单位信息Service接口
 *
 * @author ruoyi
 * @date 2023-01-04
 */
public interface IBsDealingsunitInfoService {

    /**
     * 查询来往单位信息
     */
    BsDealingsunitInfoVo queryById(Long id);

    /**
     * 查询来往单位信息列表
     */
    TableDataInfo<BsDealingsunitInfoVo> queryPageList(BsDealingsunitInfoBo bo, PageQuery pageQuery);

    /**
     * 查询来往单位信息列表
     */
    List<BsDealingsunitInfoVo> queryList(BsDealingsunitInfoBo bo);

    /**
     * 新增来往单位信息
     */
    Boolean insertByBo(BsDealingsunitInfoBo bo);

    /**
     * 修改来往单位信息
     */
    Boolean updateByBo(BsDealingsunitInfoBo bo);

    /**
     * 校验并批量删除来往单位信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    R verifyDealingsUnitCoded(BsDealingsunitInfoBo bo);

}
