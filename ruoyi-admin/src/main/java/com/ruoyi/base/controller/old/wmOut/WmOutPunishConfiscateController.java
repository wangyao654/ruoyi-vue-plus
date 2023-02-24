package com.ruoyi.base.controller.old.wmOut;

import java.util.List;
import java.util.Arrays;

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
import com.ruoyi.old.wmOut.domain.vo.WmOutPunishConfiscateVo;
import com.ruoyi.old.wmOut.domain.bo.WmOutPunishConfiscateBo;
import com.ruoyi.old.wmOut.service.IWmOutPunishConfiscateService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 罚没出库信息
 *
 * @author ruoyi
 * @date 2023-02-17
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmOut/outPunishConfiscate")
public class WmOutPunishConfiscateController extends BaseController {

    private final IWmOutPunishConfiscateService iWmOutPunishConfiscateService;

    /**
     * 查询罚没出库信息列表
     */
    @SaCheckPermission("wmOut:outPunishConfiscate:list")
    @GetMapping("/list")
    public TableDataInfo<WmOutPunishConfiscateVo> list(WmOutPunishConfiscateBo bo, PageQuery pageQuery) {
        return iWmOutPunishConfiscateService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出罚没出库信息列表
     */
    @SaCheckPermission("wmOut:outPunishConfiscate:export")
    @Log(title = "罚没出库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmOutPunishConfiscateBo bo, HttpServletResponse response) {
        List<WmOutPunishConfiscateVo> list = iWmOutPunishConfiscateService.queryList(bo);
        ExcelUtil.exportExcel(list, "罚没出库信息", WmOutPunishConfiscateVo.class, response);
    }

    /**
     * 获取罚没出库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wmOut:outPunishConfiscate:query")
    @GetMapping("/{id}")
    public R<WmOutPunishConfiscateVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmOutPunishConfiscateService.queryById(id));
    }

    /**
     * 新增罚没出库信息
     */
    @SaCheckPermission("wmOut:outPunishConfiscate:add")
    @Log(title = "罚没出库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WmOutPunishConfiscateBo bo) {
        return toAjax(iWmOutPunishConfiscateService.insertByBo(bo));
    }

    /**
     * 修改罚没出库信息
     */
    @SaCheckPermission("wmOut:outPunishConfiscate:edit")
    @Log(title = "罚没出库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmOutPunishConfiscateBo bo) {
        return toAjax(iWmOutPunishConfiscateService.updateByBo(bo));
    }

    /**
     * 删除罚没出库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wmOut:outPunishConfiscate:remove")
    @Log(title = "罚没出库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmOutPunishConfiscateService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
