package com.ruoyi.base.controller.base;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

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
import com.ruoyi.base.domain.vo.BsWhAreaInfoVo;
import com.ruoyi.base.domain.bo.BsWhAreaInfoBo;
import com.ruoyi.base.service.IBsWhAreaInfoService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库区信息
 *
 * @author ruoyi
 * @date 2022-12-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/base/whAreaInfo")
public class BsWhAreaInfoController extends BaseController {

    private final IBsWhAreaInfoService iBsWhAreaInfoService;

    /**
     * 查询库区信息列表
     */
    @SaCheckPermission("base:whAreaInfo:list")
    @GetMapping("/list")
    public TableDataInfo<BsWhAreaInfoVo> list(BsWhAreaInfoBo bo, PageQuery pageQuery) {
        return iBsWhAreaInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出库区信息列表
     */
    @SaCheckPermission("base:whAreaInfo:export")
    @Log(title = "库区信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BsWhAreaInfoBo bo, HttpServletResponse response) {
        List<BsWhAreaInfoVo> list = iBsWhAreaInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "库区信息", BsWhAreaInfoVo.class, response);
    }

    /**
     * 获取库区信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("base:whAreaInfo:query")
    @GetMapping("/{id}")
    public R<BsWhAreaInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBsWhAreaInfoService.queryById(id));
    }
    @GetMapping("/getWhAreaInfoByWhAreaCoded")
    public R<BsWhAreaInfoVo> getWhAreaInfoByWhAreaCoded(BsWhAreaInfoBo bo) {
        return R.ok(iBsWhAreaInfoService.getWhAreaInfoByWhAreaCoded(bo.getWhAreaCoded()));
    }

    /**
     * 新增库区信息
     */
    @SaCheckPermission("base:whAreaInfo:add")
    @Log(title = "库区信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BsWhAreaInfoBo bo) {
        return toAjax(iBsWhAreaInfoService.insertByBo(bo));
    }

    /**
     * 修改库区信息
     */
    @SaCheckPermission("base:whAreaInfo:edit")
    @Log(title = "库区信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BsWhAreaInfoBo bo) {
        return toAjax(iBsWhAreaInfoService.updateByBo(bo));
    }

    /**
     * 删除库区信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("base:whAreaInfo:remove")
    @Log(title = "库区信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return iBsWhAreaInfoService.deleteWithValidByIds(Arrays.asList(ids), true);
    }
    /*
    * 校验库区编号
    * */
    @GetMapping("/verifyWhAreaCoded")
    public R verifyWhAreaCoded(BsWhAreaInfoBo bo) {
        return iBsWhAreaInfoService.verifyWhAreaCoded(bo);
    }
}
