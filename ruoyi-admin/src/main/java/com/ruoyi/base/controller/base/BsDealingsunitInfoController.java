package com.ruoyi.base.controller.base;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.base.domain.bo.BsBrandManageBo;
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
import com.ruoyi.base.domain.vo.BsDealingsunitInfoVo;
import com.ruoyi.base.domain.bo.BsDealingsunitInfoBo;
import com.ruoyi.base.service.IBsDealingsunitInfoService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 来往单位信息
 *
 * @author ruoyi
 * @date 2023-01-04
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/base/dealingsunitInfo")
public class BsDealingsunitInfoController extends BaseController {

    private final IBsDealingsunitInfoService iBsDealingsunitInfoService;

    /**
     * 查询来往单位信息列表
     */
    @SaCheckPermission("dealingsunitInfo:dealingsunitInfo:list")
    @GetMapping("/list")
    public TableDataInfo<BsDealingsunitInfoVo> list(BsDealingsunitInfoBo bo, PageQuery pageQuery) {
        return iBsDealingsunitInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出来往单位信息列表
     */
    @SaCheckPermission("dealingsunitInfo:dealingsunitInfo:export")
    @Log(title = "来往单位信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BsDealingsunitInfoBo bo, HttpServletResponse response) {
        List<BsDealingsunitInfoVo> list = iBsDealingsunitInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "来往单位信息", BsDealingsunitInfoVo.class, response);
    }

    /**
     * 获取来往单位信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("dealingsunitInfo:dealingsunitInfo:query")
    @GetMapping("/{id}")
    public R<BsDealingsunitInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBsDealingsunitInfoService.queryById(id));
    }

    /**
     * 新增来往单位信息
     */
    @SaCheckPermission("dealingsunitInfo:dealingsunitInfo:add")
    @Log(title = "来往单位信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BsDealingsunitInfoBo bo) {
        return toAjax(iBsDealingsunitInfoService.insertByBo(bo));
    }

    /**
     * 修改来往单位信息
     */
    @SaCheckPermission("dealingsunitInfo:dealingsunitInfo:edit")
    @Log(title = "来往单位信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BsDealingsunitInfoBo bo) {
        return toAjax(iBsDealingsunitInfoService.updateByBo(bo));
    }

    /**
     * 删除来往单位信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("dealingsunitInfo:dealingsunitInfo:remove")
    @Log(title = "来往单位信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iBsDealingsunitInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    /*
    * 校验编号
    * */
    @GetMapping("/verifyDealingsUnitCoded")
    public R verifyDealingsUnitCoded(BsDealingsunitInfoBo bo) {
        return iBsDealingsunitInfoService.verifyDealingsUnitCoded(bo);
    }

}
