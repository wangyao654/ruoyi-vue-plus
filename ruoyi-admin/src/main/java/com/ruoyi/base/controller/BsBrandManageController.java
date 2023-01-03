package com.ruoyi.base.controller;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.base.domain.bo.BsBrandManageBo;
import com.ruoyi.base.domain.vo.BsBrandManageVo;
import com.ruoyi.base.service.IBsBrandManageService;
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
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 品牌管理/品牌详细信息
 *
 * @author ruoyi
 * @date 2022-12-26
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/base/brandManage")
public class BsBrandManageController extends BaseController {

    private final IBsBrandManageService iBsBrandManageService;

    /**
     * 查询品牌管理/品牌详细信息列表
     */
    @SaCheckPermission("system:brandManage:list")
    @GetMapping("/list")
    public TableDataInfo<BsBrandManageVo> list(BsBrandManageBo bo, PageQuery pageQuery) {
        return iBsBrandManageService.queryPageList(bo, pageQuery);
    }
    /**
     * 校验品牌编号
     */
    @SaCheckPermission("system:brandManage:list")
    @GetMapping("/verifyBrandCode")
    public R verifyBrandCode(BsBrandManageBo bo) {
        List<BsBrandManageVo> bsBrandManageVos = iBsBrandManageService.verifyBrandCode(bo);
        return R.ok(bsBrandManageVos);
    }

    /**
     * 导出品牌管理/品牌详细信息列表
     */
    @SaCheckPermission("system:brandManage:export")
    @Log(title = "品牌管理/品牌详细信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BsBrandManageBo bo, HttpServletResponse response) {
        List<BsBrandManageVo> list = iBsBrandManageService.queryList(bo);
        ExcelUtil.exportExcel(list, "品牌详细信息", BsBrandManageVo.class, response);
    }

    /**
     * 获取品牌管理/品牌详细信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("system:brandManage:query")
    @GetMapping("/{id}")
    public R<BsBrandManageVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBsBrandManageService.queryById(id));
    }

    /**
     * 新增品牌管理/品牌详细信息
     */
    @SaCheckPermission("system:brandManage:add")
    @Log(title = "品牌管理/品牌详细信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BsBrandManageBo bo) {
        return toAjax(iBsBrandManageService.insertByBo(bo));
    }

    /**
     * 修改品牌管理/品牌详细信息
     */
    @SaCheckPermission("system:brandManage:edit")
    @Log(title = "品牌管理/品牌详细信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BsBrandManageBo bo) {
        return toAjax(iBsBrandManageService.updateByBo(bo));
    }

    /**
     * 删除品牌管理/品牌详细信息
     *
     * @param ids 主键串
     */
    @Log(title = "品牌管理/品牌详细信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iBsBrandManageService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
