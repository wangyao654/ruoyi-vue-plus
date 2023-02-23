package com.ruoyi.base.controller.wmOut;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.wmOut.domain.bo.WmOutInfoBo;
import com.ruoyi.wmOut.domain.vo.WmOutInfoVo;
import com.ruoyi.wmOut.service.IWmOutInfoService;
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
 * 商品出库信息
 *
 * @author ruoyi
 * @date 2023-02-14
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmOut/outInfo")
public class WmOutInfoController extends BaseController {

    private final IWmOutInfoService iWmOutInfoService;

    /**
     * 查询商品出库信息列表
     */
    @SaCheckPermission("system:outInfo:list")
    @GetMapping("/list")
    public TableDataInfo<WmOutInfoVo> list(WmOutInfoBo bo, PageQuery pageQuery) {
        return iWmOutInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出商品出库信息列表
     */
    @SaCheckPermission("system:outInfo:export")
    @Log(title = "商品出库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmOutInfoBo bo, HttpServletResponse response) {
        List<WmOutInfoVo> list = iWmOutInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "商品出库信息", WmOutInfoVo.class, response);
    }

    /**
     * 获取商品出库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("system:outInfo:query")
    @GetMapping("/{id}")
    public R<WmOutInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmOutInfoService.queryById(id));
    }

    /**
     * 新增商品出库信息
     */
    @SaCheckPermission("system:outInfo:add")
    @Log(title = "商品出库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WmOutInfoBo bo) {
        return toAjax(iWmOutInfoService.insertByBo(bo));
    }

    /**
     * 修改商品出库信息
     */
    @SaCheckPermission("system:outInfo:edit")
    @Log(title = "商品出库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmOutInfoBo bo) {
        return toAjax(iWmOutInfoService.updateByBo(bo));
    }

    /**
     * 删除商品出库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("system:outInfo:remove")
    @Log(title = "商品出库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmOutInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    /*
     *
     * */
    @GetMapping("/createWmOutCoded")
    @Log(title = "自动生成入库编号 ZC-暂存 DC-代管 FMC-罚没 CJC-抽检", businessType = BusinessType.DELETE)
    public R createWmOutCoded(@RequestParam("type")String type) {
        return iWmOutInfoService.createWmOutCoded(type);
    }
}
