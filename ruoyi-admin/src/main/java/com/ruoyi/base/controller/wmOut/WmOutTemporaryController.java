package com.ruoyi.base.controller.wmOut;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.core.validate.QueryGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wmOut.domain.vo.WmOutTemporaryVo;
import com.ruoyi.wmOut.domain.bo.WmOutTemporaryBo;
import com.ruoyi.wmOut.service.IWmOutTemporaryService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 暂存出库信息
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmOut/outTemporary")
public class WmOutTemporaryController extends BaseController {

    private final IWmOutTemporaryService iWmOutTemporaryService;

    /**
     * 查询暂存出库信息列表
     */
    @SaCheckPermission("wmOut:outTemporary:list")
    @GetMapping("/list")
    public TableDataInfo<WmOutTemporaryVo> list(WmOutTemporaryBo bo, PageQuery pageQuery) {
        return iWmOutTemporaryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出暂存出库信息列表
     */
    @SaCheckPermission("wmOut:outTemporary:export")
    @Log(title = "暂存出库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmOutTemporaryBo bo, HttpServletResponse response) {
        List<WmOutTemporaryVo> list = iWmOutTemporaryService.queryList(bo);
        ExcelUtil.exportExcel(list, "暂存出库信息", WmOutTemporaryVo.class, response);
    }

    /**
     * 获取暂存出库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wmOut:outTemporary:query")
    @GetMapping("/{id}")
    public R<WmOutTemporaryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmOutTemporaryService.queryById(id));
    }

    /**
     * 新增暂存出库信息
     */
    @SaCheckPermission("wmOut:outTemporary:add")
    @Log(title = "暂存出库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WmOutTemporaryBo bo) {
        return toAjax(iWmOutTemporaryService.insertByBo(bo));
    }

    /**
     * 修改暂存出库信息
     */
    @SaCheckPermission("wmOut:outTemporary:edit")
    @Log(title = "暂存出库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmOutTemporaryBo bo) {
        return toAjax(iWmOutTemporaryService.updateByBo(bo));
    }

    /**
     * 删除暂存出库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wmOut:outTemporary:remove")
    @Log(title = "暂存出库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmOutTemporaryService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
