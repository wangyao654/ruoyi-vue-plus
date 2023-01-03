package com.ruoyi.base.controller;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.base.domain.bo.BsWarehouseInfoBo;
import com.ruoyi.base.domain.vo.BsWarehouseInfoVo;
import com.ruoyi.base.service.IBsWarehouseInfoService;
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
 * 仓库管理
 *
 * @author ruoyi
 * @date 2022-12-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/base/warehouseInfo")
public class BsWarehouseInfoController extends BaseController {

    private final IBsWarehouseInfoService iBsWarehouseInfoService;

    /**
     * 查询仓库管理列表
     */
    @SaCheckPermission("system:warehouseInfo:list")
    @GetMapping("/list")
    public TableDataInfo<BsWarehouseInfoVo> list(BsWarehouseInfoBo bo, PageQuery pageQuery) {
        return iBsWarehouseInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出仓库管理列表
     */
    @SaCheckPermission("system:warehouseInfo:export")
    @Log(title = "仓库管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BsWarehouseInfoBo bo, HttpServletResponse response) {
        List<BsWarehouseInfoVo> list = iBsWarehouseInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "仓库管理", BsWarehouseInfoVo.class, response);
    }

    /**
     * 获取仓库管理详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("system:warehouseInfo:query")
    @GetMapping("/{id}")
    public R<BsWarehouseInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBsWarehouseInfoService.queryById(id));
    }

    /**
     * 新增仓库管理
     */
    @SaCheckPermission("system:warehouseInfo:add")
    @Log(title = "仓库管理", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BsWarehouseInfoBo bo) {
        return toAjax(iBsWarehouseInfoService.insertByBo(bo));
    }

    /**
     * 修改仓库管理
     */
    @SaCheckPermission("system:warehouseInfo:edit")
    @Log(title = "仓库管理", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BsWarehouseInfoBo bo) {
        return toAjax(iBsWarehouseInfoService.updateByBo(bo));
    }

    /**
     * 删除仓库管理
     *
     * @param ids 主键串
     */
    @SaCheckPermission("system:warehouseInfo:remove")
    @Log(title = "仓库管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iBsWarehouseInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    /**
     * 校验仓库编号
     */
    @GetMapping("/verifyWarehouseCoded")
    public R verifyWarehouseCoded(BsWarehouseInfoBo bo) {
        return iBsWarehouseInfoService.verifyWarehouseCoded(bo);
    }
}
