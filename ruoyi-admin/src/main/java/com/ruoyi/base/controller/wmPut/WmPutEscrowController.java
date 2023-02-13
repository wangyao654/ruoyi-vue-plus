package com.ruoyi.base.controller.wmPut;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.wmPut.domain.bo.WmPutPunishConfiscateBo;
import com.ruoyi.wmPut.domain.vo.WmPutPunishConfiscateVo;
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
import com.ruoyi.wmPut.domain.vo.WmPutEscrowVo;
import com.ruoyi.wmPut.domain.bo.WmPutEscrowBo;
import com.ruoyi.wmPut.service.IWmPutEscrowService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 代管入库信息
 *
 * @author ruoyi
 * @date 2023-02-09
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmPut/putEscrow")
public class WmPutEscrowController extends BaseController {

    private final IWmPutEscrowService iWmPutEscrowService;

    /**
     * 查询代管入库信息列表
     */
    @SaCheckPermission("putEscrow:putEscrow:list")
    @GetMapping("/list")
    public TableDataInfo<WmPutEscrowVo> list(WmPutEscrowBo bo, PageQuery pageQuery) {
        return iWmPutEscrowService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出代管入库信息列表
     */
    @SaCheckPermission("putEscrow:putEscrow:export")
    @Log(title = "代管入库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmPutEscrowBo bo, HttpServletResponse response) {
        List<WmPutEscrowVo> list = iWmPutEscrowService.queryList(bo);
        ExcelUtil.exportExcel(list, "代管入库信息", WmPutEscrowVo.class, response);
    }

    /**
     * 获取代管入库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("putEscrow:putEscrow:query")
    @GetMapping("/{id}")
    public R<WmPutEscrowVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmPutEscrowService.queryById(id));
    }

    /**
     * 新增代管入库信息
     */
    @SaCheckPermission("putEscrow:putEscrow:add")
    @Log(title = "代管入库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WmPutEscrowBo bo) {
        return toAjax(iWmPutEscrowService.insertByBo(bo));
    }

    /**
     * 修改代管入库信息
     */
    @SaCheckPermission("putEscrow:putEscrow:edit")
    @Log(title = "代管入库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmPutEscrowBo bo) {
        return toAjax(iWmPutEscrowService.updateByBo(bo));
    }

    /**
     * 删除代管入库信息
     *
     * @param ids 主键串
     */
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutEscrowService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    /*
    * 展示添加时扫入信息
    * */
    @GetMapping("/getEscrowList")
    public TableDataInfo<WmPutEscrowVo> getEscrowList(WmPutEscrowBo bo, PageQuery pageQuery) {
        return iWmPutEscrowService.getEscrowList(bo, pageQuery);
    }
    @SaCheckPermission("putEscrow:putEscrow:remove")
    @Log(title = "代管入库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/delPutEscrowByPutId/{ids}")
    public R<Void> delPutEscrowByPutId(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutEscrowService.delPutEscrowByPutId(Arrays.asList(ids), true));
    }
}
