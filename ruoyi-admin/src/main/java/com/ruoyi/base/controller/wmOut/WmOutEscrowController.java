package com.ruoyi.base.controller.wmOut;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
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
import com.ruoyi.wmOut.domain.vo.WmOutEscrowVo;
import com.ruoyi.wmOut.domain.bo.WmOutEscrowBo;
import com.ruoyi.wmOut.service.IWmOutEscrowService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 代管出库信息
 *
 * @author ruoyi
 * @date 2023-02-16
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/outEscrow/outEscrow")
public class WmOutEscrowController extends BaseController {

    private final IWmOutEscrowService iWmOutEscrowService;

    /**
     * 查询代管出库信息列表
     */
    @ApiResponse
    @SaCheckPermission("outEscrow:outEscrow:list")
    @GetMapping("/list")
    public TableDataInfo<WmOutEscrowVo> list(WmOutEscrowBo bo, PageQuery pageQuery) {
        return iWmOutEscrowService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出代管出库信息列表
     */
    @SaCheckPermission("outEscrow:outEscrow:export")
    @Log(title = "代管出库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmOutEscrowBo bo, HttpServletResponse response) {
        List<WmOutEscrowVo> list = iWmOutEscrowService.queryList(bo);
        ExcelUtil.exportExcel(list, "代管出库信息", WmOutEscrowVo.class, response);
    }

    /**
     * 获取代管出库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("outEscrow:outEscrow:query")
    @GetMapping("/{id}")
    public R<WmOutEscrowVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmOutEscrowService.queryById(id));
    }

    /**
     * 新增代管出库信息
     */
    @SaCheckPermission("outEscrow:outEscrow:add")
    @Log(title = "代管出库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WmOutEscrowBo bo) {
        return toAjax(iWmOutEscrowService.insertByBo(bo));
    }

    /**
     * 修改代管出库信息
     */
    @SaCheckPermission("outEscrow:outEscrow:edit")
    @Log(title = "代管出库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmOutEscrowBo bo) {
        return toAjax(iWmOutEscrowService.updateByBo(bo));
    }

    /**
     * 删除代管出库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("outEscrow:outEscrow:remove")
    @Log(title = "代管出库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmOutEscrowService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
