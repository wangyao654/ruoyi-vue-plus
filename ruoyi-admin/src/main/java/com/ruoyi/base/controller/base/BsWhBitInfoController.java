package com.ruoyi.base.controller.base;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.base.domain.bo.BsWhBitInfoBo;
import com.ruoyi.base.domain.vo.BsWhBitInfoVo;
import com.ruoyi.base.service.IBsWhBitInfoService;
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
 * 库位信息
 *
 * @author ruoyi
 * @date 2023-01-02
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/whBitInfo/whBitInfo")
public class BsWhBitInfoController extends BaseController {

    private final IBsWhBitInfoService iBsWhBitInfoService;

    /**
     * 查询库位信息列表
     */
    @SaCheckPermission("whBitInfo:whBitInfo:list")
    @GetMapping("/list")
    public TableDataInfo<BsWhBitInfoVo> list(BsWhBitInfoBo bo, PageQuery pageQuery) {
        return iBsWhBitInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出库位信息列表
     */
    @SaCheckPermission("whBitInfo:whBitInfo:export")
    @Log(title = "库位信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BsWhBitInfoBo bo, HttpServletResponse response) {
        List<BsWhBitInfoVo> list = iBsWhBitInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "库位信息", BsWhBitInfoVo.class, response);
    }

    /**
     * 获取库位信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("whBitInfo:whBitInfo:query")
    @GetMapping("/{id}")
    public R<BsWhBitInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBsWhBitInfoService.queryById(id));
    }

    /**
     * 新增库位信息
     */
    @SaCheckPermission("whBitInfo:whBitInfo:add")
    @Log(title = "库位信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BsWhBitInfoBo bo) {
        return toAjax(iBsWhBitInfoService.insertByBo(bo));
    }

    /**
     * 修改库位信息
     */
    @SaCheckPermission("whBitInfo:whBitInfo:edit")
    @Log(title = "库位信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BsWhBitInfoBo bo) {
        return toAjax(iBsWhBitInfoService.updateByBo(bo));
    }

    /**
     * 删除库位信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("whBitInfo:whBitInfo:remove")
    @Log(title = "库位信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return iBsWhBitInfoService.deleteWithValidByIds(Arrays.asList(ids), true);
    }
    /*
    * 校验库位编码
    * */
    @GetMapping("/verifyWhBitCoded")
    public R verifyWhBitCoded(BsWhBitInfoBo bo) {
        return iBsWhBitInfoService.verifyWhBitCoded(bo);
    }
    /*
    * 获取所有库位编号
    * */
    @GetMapping("/listAll")
    public R listAll(BsWhBitInfoBo bo) {
        return iBsWhBitInfoService.listAll(bo);
    }
}
