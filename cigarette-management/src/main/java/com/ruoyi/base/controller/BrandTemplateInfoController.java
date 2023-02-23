package com.ruoyi.base.controller;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.base.domain.bo.BrandTemplateInfoBo;
import com.ruoyi.base.domain.vo.BrandTemplateInfoVo;
import com.ruoyi.base.service.IBrandTemplateInfoService;
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
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】
 *
 * @author ruoyi
 * @date 2023-02-23
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/brand/templateInfo")
public class BrandTemplateInfoController extends BaseController {

    private final IBrandTemplateInfoService iBrandTemplateInfoService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:templateInfo:list")
    @GetMapping("/list")
    public TableDataInfo<BrandTemplateInfoVo> list(BrandTemplateInfoBo bo, PageQuery pageQuery) {
        return iBrandTemplateInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:templateInfo:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BrandTemplateInfoBo bo, HttpServletResponse response) {
        List<BrandTemplateInfoVo> list = iBrandTemplateInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", BrandTemplateInfoVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("system:templateInfo:query")
    @GetMapping("/{id}")
    public R<BrandTemplateInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBrandTemplateInfoService.queryById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:templateInfo:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BrandTemplateInfoBo bo) {
        return toAjax(iBrandTemplateInfoService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:templateInfo:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BrandTemplateInfoBo bo) {
        return toAjax(iBrandTemplateInfoService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param ids 主键串
     */
    @SaCheckPermission("system:templateInfo:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iBrandTemplateInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
