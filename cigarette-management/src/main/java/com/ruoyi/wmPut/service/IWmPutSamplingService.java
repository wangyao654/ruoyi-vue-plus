package com.ruoyi.wmPut.service;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.wmPut.domain.bo.WmPutSamplingBo;
import com.ruoyi.wmPut.domain.vo.WmPutSamplingVo;

import java.util.Collection;
import java.util.List;

/**
 * 抽检返还入库信息Service接口
 *
 * @author ruoyi
 * @date 2023-02-13
 */
public interface IWmPutSamplingService {

    /**
     * 查询抽检返还入库信息
     */
    WmPutSamplingVo queryById(Long id);

    /**
     * 查询抽检返还入库信息列表
     */
    TableDataInfo<WmPutSamplingVo> queryPageList(WmPutSamplingBo bo, PageQuery pageQuery);

    /**
     * 查询抽检返还入库信息列表
     */
    List<WmPutSamplingVo> queryList(WmPutSamplingBo bo);

    /**
     * 新增抽检返还入库信息
     */
    Boolean insertByBo(WmPutSamplingBo bo);

    /**
     * 修改抽检返还入库信息
     */
    Boolean updateByBo(WmPutSamplingBo bo);

    /**
     * 校验并批量删除抽检返还入库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    Boolean delSamplingByPutId(Collection<Long>ids, boolean b);

    TableDataInfo<WmPutSamplingVo> getPutSamplingList(WmPutSamplingBo bo, PageQuery pageQuery);
}
