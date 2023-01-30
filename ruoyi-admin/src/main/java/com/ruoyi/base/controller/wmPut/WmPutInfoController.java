package com.ruoyi.base.controller.wmPut;

import java.io.*;
import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.ruoyi.base.domain.bo.BsWhAreaInfoBo;
import com.ruoyi.wmPut.domain.bo.WmPutInfoBo;
import com.ruoyi.wmPut.domain.vo.WmPutInfoVo;
import com.ruoyi.wmPut.service.IWmPutInfoService;
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
import org.springframework.web.multipart.MultipartFile;

/**
 * 商品入库信息
 *
 * @author ruoyi
 * @date 2023-01-09
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wmPut/putInfo")
public class WmPutInfoController extends BaseController {

    private final IWmPutInfoService iWmPutInfoService;

    /**
     * 查询商品入库信息列表
     */
    @SaCheckPermission("system:putInfo:list")
    @GetMapping("/list")
    public TableDataInfo<WmPutInfoVo> list(WmPutInfoBo bo, PageQuery pageQuery) {
        return iWmPutInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出商品入库信息列表
     */
    @SaCheckPermission("system:putInfo:export")
    @Log(title = "商品入库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WmPutInfoBo bo, HttpServletResponse response) {
        List<WmPutInfoVo> list = iWmPutInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "商品入库信息", WmPutInfoVo.class, response);
    }

    /**
     * 获取商品入库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("system:putInfo:query")
    @GetMapping("/{id}")
    public R<WmPutInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iWmPutInfoService.queryById(id));
    }

    /**
     * 新增商品入库信息
     */
    @SaCheckPermission("system:putInfo:add")
    @Log(title = "商品入库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R add(@Validated(AddGroup.class) @RequestBody WmPutInfoBo bo) {
        return R.ok(iWmPutInfoService.insertGetId(bo));
    }

    /**
     * 修改商品入库信息
     */
    @SaCheckPermission("system:putInfo:edit")
    @Log(title = "商品入库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WmPutInfoBo bo) {
        return toAjax(iWmPutInfoService.updateByBo(bo));
    }

    /**
     * 删除商品入库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("system:putInfo:remove")
    @Log(title = "商品入库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iWmPutInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
    /*
     * 校验入库编号
     * */
    @GetMapping("/verifyWmPutCoded")
    public R verifyWmPutCoded(WmPutInfoBo bo) {
        return iWmPutInfoService.verifyWmPutCoded(bo);
    }
    @PostMapping("/enclosure")
    public R<Void> fileEnclosure(@RequestPart("file") MultipartFile file) throws IOException {
        if(file==null){
            return R.fail("上传失败文件为空");
        }
        byte[] bytes = file.getBytes();
        WmPutInfoBo wmPutInfoBo = new WmPutInfoBo();
        wmPutInfoBo.setEnclosure(file.getBytes());
        return toAjax(iWmPutInfoService.updateByBo(wmPutInfoBo));
    }
}
