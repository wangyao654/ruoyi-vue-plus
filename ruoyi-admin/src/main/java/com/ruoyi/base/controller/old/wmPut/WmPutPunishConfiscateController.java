package com.ruoyi.base.controller.old.wmPut;

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
import com.ruoyi.old.wmPut.domain.vo.WmPutPunishConfiscateVo;
import com.ruoyi.old.wmPut.domain.bo.WmPutPunishConfiscateBo;
import com.ruoyi.old.wmPut.service.IWmPutPunishConfiscateService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 罚没入库信息
 *
 * @author ruoyi
 * @date 2023-01-29
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmPut/putPunishConfiscate")
public class WmPutPunishConfiscateController extends BaseController {

    private final IWmPutPunishConfiscateService iWmPutPunishConfiscateService;

    /**
     * 查询罚没入库信息列表
     */
    @SaCheckPermission("wmPut:putPunishConfiscate:list")
    @GetMapping("/list")
    public TableDataInfo<WmPutPunishConfiscateVo> list(WmPutPunishConfiscateBo bo, PageQuery pageQuery) {
        return iWmPutPunishConfiscateService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出罚没入库信息列表
     */
    @SaCheckPermission("wmPut:putPunishConfiscate:export")
    @Log(title = "罚没入库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmPutPunishConfiscateBo bo, HttpServletResponse response) {
        List<WmPutPunishConfiscateVo> list = iWmPutPunishConfiscateService.queryList(bo);
        ExcelUtil.exportExcel(list, "罚没入库信息", WmPutPunishConfiscateVo.class, response);
    }

    /**
     * 获取罚没入库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wmPut:putPunishConfiscate:query")
    @GetMapping("/{id}")
    public R<WmPutPunishConfiscateVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmPutPunishConfiscateService.queryById(id));
    }

    /**
     * 新增罚没入库信息
     */
    @SaCheckPermission("wmPut:putPunishConfiscate:add")
    @Log(title = "罚没入库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R add(@Validated(AddGroup.class) @RequestBody WmPutPunishConfiscateBo bo) {
        return R.ok(iWmPutPunishConfiscateService.insertByBo(bo));
    }

    /**
     * 修改罚没入库信息
     */
    @SaCheckPermission("wmPut:putPunishConfiscate:edit")
    @Log(title = "罚没入库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmPutPunishConfiscateBo bo) {
        return toAjax(iWmPutPunishConfiscateService.updateByBo(bo));
    }

    /**
     * 删除罚没入库信息
     *
     * @param ids 主键串
     */

    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutPunishConfiscateService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    @GetMapping("/getPunishConfiscateList")
    public TableDataInfo<WmPutPunishConfiscateVo> getPunishConfiscateList(WmPutPunishConfiscateBo bo, PageQuery pageQuery) {
        return iWmPutPunishConfiscateService.getPunishConfiscateList(bo, pageQuery);
    }
    @SaCheckPermission("wmPut:putPunishConfiscate:remove")
    @Log(title = "罚没入库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/delPutPunishConfiscateByPutId/{ids}")
    public R<Void> delPutPunishConfiscateByPutId(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutPunishConfiscateService.delPutPunishConfiscateByPutId(Arrays.asList(ids), true));
    }
}
