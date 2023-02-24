package com.ruoyi.base.controller.old.wmPut;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.old.wmPut.domain.bo.WmPutTemporaryBo;
import com.ruoyi.old.wmPut.domain.vo.WmPutTemporaryVo;
import com.ruoyi.old.wmPut.service.IWmPutTemporaryService;
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
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 暂存入库信息
 *
 * @author ruoyi
 * @date 2023-01-09
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmPut/putTemporary")
public class WmPutTemporaryController extends BaseController {

    private final IWmPutTemporaryService iWmPutTemporaryService;

    /**
     * 查询暂存入库信息列表
     */
    @SaCheckPermission("wmPut:putTemporary:list")
    @GetMapping("/list")
    public TableDataInfo<WmPutTemporaryVo> list(WmPutTemporaryBo bo, PageQuery pageQuery) {
        return iWmPutTemporaryService.queryPageList(bo, pageQuery);
    }
    /*
    * 查询附表
    * */
    @GetMapping("/attachedList")
    public TableDataInfo<WmPutTemporaryVo> attachedList(WmPutTemporaryBo bo, PageQuery pageQuery) {
        return iWmPutTemporaryService.attachedList(bo, pageQuery);
    }

    /**
     * 导出暂存入库信息列表
     */
    @SaCheckPermission("wmPut:putTemporary:export")
    @Log(title = "暂存入库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmPutTemporaryBo bo, HttpServletResponse response) {
        List<WmPutTemporaryVo> list = iWmPutTemporaryService.queryList(bo);
        ExcelUtil.exportExcel(list, "暂存入库信息", WmPutTemporaryVo.class, response);
    }

    /**
     * 获取暂存入库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wmPut:putTemporary:query")
    @GetMapping("/{id}")
    public R<WmPutTemporaryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmPutTemporaryService.queryById(id));
    }

    /**
     * 新增暂存入库信息
     */
    @SaCheckPermission("wmPut:putTemporary:add")
    @Log(title = "暂存入库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R add(@RequestBody WmPutTemporaryBo bo) {
        return R.ok(iWmPutTemporaryService.insertByBo(bo));
    }

    /**
     * 修改暂存入库信息
     */
    @SaCheckPermission("wmPut:putTemporary:edit")
    @Log(title = "暂存入库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmPutTemporaryBo bo) {
        return toAjax(iWmPutTemporaryService.updateByBo(bo));
    }

    /**
     * 删除暂存入库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wmPut:putTemporary:remove")
    @Log(title = "暂存入库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutTemporaryService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    /*
    * 查询副表 getPutTemporaryList
    * */
    @GetMapping("/getPutTemporaryList")
    public TableDataInfo<WmPutTemporaryVo> getPutTemporaryList(WmPutTemporaryBo bo, PageQuery pageQuery) {
        return iWmPutTemporaryService.getPutTemporaryList(bo, pageQuery);
    }
    @DeleteMapping("/delPutTemporaryByPutId/{ids}")
    public R<Void> delPutTemporaryByPutId(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutTemporaryService.delPutTemporaryByPutId(Arrays.asList(ids), true));
    }
}
