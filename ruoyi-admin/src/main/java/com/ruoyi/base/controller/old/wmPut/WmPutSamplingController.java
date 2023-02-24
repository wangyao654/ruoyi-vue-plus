package com.ruoyi.base.controller.old.wmPut;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.old.wmPut.domain.bo.WmPutSamplingBo;
import com.ruoyi.old.wmPut.domain.vo.WmPutSamplingVo;
import com.ruoyi.old.wmPut.service.IWmPutSamplingService;
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
 * 抽检返还入库信息
 *
 * @author ruoyi
 * @date 2023-02-13
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmPut/putSampling")
public class WmPutSamplingController extends BaseController {

    private final IWmPutSamplingService iWmPutSamplingService;

    /**
     * 查询抽检返还入库信息列表
     */
    @SaCheckPermission("wmPut:putSampling:list")
    @GetMapping("/list")
    public TableDataInfo<WmPutSamplingVo> list(WmPutSamplingBo bo, PageQuery pageQuery) {
        return iWmPutSamplingService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出抽检返还入库信息列表
     */
    @SaCheckPermission("wmPut:putSampling:export")
    @Log(title = "抽检返还入库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmPutSamplingBo bo, HttpServletResponse response) {
        List<WmPutSamplingVo> list = iWmPutSamplingService.queryList(bo);
        ExcelUtil.exportExcel(list, "抽检返还入库信息", WmPutSamplingVo.class, response);
    }

    /**
     * 获取抽检返还入库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wmPut:putSampling:query")
    @GetMapping("/{id}")
    public R<WmPutSamplingVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmPutSamplingService.queryById(id));
    }

    /**
     * 新增抽检返还入库信息
     */
    @SaCheckPermission("wmPut:putSampling:add")
    @Log(title = "抽检返还入库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WmPutSamplingBo bo) {
        return toAjax(iWmPutSamplingService.insertByBo(bo));
    }

    /**
     * 修改抽检返还入库信息
     */
    @SaCheckPermission("wmPut:putSampling:edit")
    @Log(title = "抽检返还入库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmPutSamplingBo bo) {
        return toAjax(iWmPutSamplingService.updateByBo(bo));
    }

    /**
     * 删除抽检返还入库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wmPut:putSampling:remove")
    @Log(title = "抽检返还入库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutSamplingService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    @DeleteMapping("/delSamplingByPutId/{ids}")
    public R<Void> delSamplingByPutId(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutSamplingService.delSamplingByPutId(Arrays.asList(ids), true));
    }
    @GetMapping("/getPutSamplingList")
    public TableDataInfo<WmPutSamplingVo> getPutSamplingList(WmPutSamplingBo bo, PageQuery pageQuery) {
        return iWmPutSamplingService.getPutSamplingList(bo, pageQuery);
    }
}
