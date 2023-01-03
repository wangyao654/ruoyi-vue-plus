package com.ruoyi.base.service;

import com.ruoyi.base.domain.BsWhAreaInfo;
import com.ruoyi.base.domain.vo.BsWhAreaInfoVo;
import com.ruoyi.base.domain.bo.BsWhAreaInfoBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;
import java.util.Objects;

/**
 * 库区信息Service接口
 *
 * @author ruoyi
 * @date 2023-01-02
 */
public interface IBsWhAreaInfoService {

    /**
     * 查询库区信息
     */
    BsWhAreaInfoVo queryById(Long id);

    /**
     * 查询库区信息列表
     */
    TableDataInfo<BsWhAreaInfoVo> queryPageList(BsWhAreaInfoBo bo, PageQuery pageQuery);

    /**
     * 查询库区信息列表
     */
    List<BsWhAreaInfoVo> queryList(BsWhAreaInfoBo bo);

    /**
     * 新增库区信息
     */
    Boolean insertByBo(BsWhAreaInfoBo bo);

    /**
     * 修改库区信息
     */
    Boolean updateByBo(BsWhAreaInfoBo bo);

    /**
     * 校验并批量删除库区信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    BsWhAreaInfoVo getWhAreaInfoByWhAreaCoded(String whAreaCoded);
}
