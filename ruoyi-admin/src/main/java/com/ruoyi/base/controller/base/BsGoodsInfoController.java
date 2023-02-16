package com.ruoyi.base.controller.base;

import java.net.URLEncoder;
import java.util.List;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import com.ruoyi.base.domain.bo.BsBrandManageBo;
import com.ruoyi.base.service.IBsGoodsInfoService;
import com.ruoyi.common.businessUtils.ExcelConst;
import com.ruoyi.common.businessUtils.ExcelUtilX;
import com.ruoyi.system.domain.bo.BsGoodsInfoBo;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.ruoyi.base.domain.vo.BsGoodsInfoVo;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 商品信息
 *
 * @author ruoyi
 * @date 2022-12-26
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/base/goodsInfo")
public class BsGoodsInfoController extends BaseController {

    private final IBsGoodsInfoService iBsGoodsInfoService;

    /**
     * 查询商品信息列表
     */
    @SaCheckPermission("base:goodsInfo:list")
    @GetMapping("/list")
    public TableDataInfo<BsGoodsInfoVo> list(BsGoodsInfoBo bo, PageQuery pageQuery) {
        return iBsGoodsInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出商品信息列表
     */
    @SaCheckPermission("base:goodsInfo:export")
    @Log(title = "商品信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BsGoodsInfoBo bo, HttpServletResponse response) {
        List<BsGoodsInfoVo> list = iBsGoodsInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "商品信息", BsGoodsInfoVo.class, response);
    }

    /**
     * 获取商品信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("base:goodsInfo:query")
    @GetMapping("/{id}")
    public R<BsGoodsInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBsGoodsInfoService.queryById(id));
    }

    /**
     * 新增商品信息
     */
    @SaCheckPermission("base:goodsInfo:add")
    @Log(title = "商品信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BsGoodsInfoBo bo) {
        return toAjax(iBsGoodsInfoService.insertByBo(bo));
    }

    /**
     * 修改商品信息
     */
    @SaCheckPermission("base:goodsInfo:edit")
    @Log(title = "商品信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BsGoodsInfoBo bo) {
        return toAjax(iBsGoodsInfoService.updateByBo(bo));
    }

    /**
     * 删除商品信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("base:goodsInfo:remove")
    @Log(title = "商品信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return iBsGoodsInfoService.deleteWithValidByIds(Arrays.asList(ids), true);
    }
    /**
     * 校验商品编号
     */
    @GetMapping("/verifyGoodsCoded")
    public R verifyGoodsCoded( BsGoodsInfoBo bo) {
        return iBsGoodsInfoService.verifyGoodsCoded(bo);
    }
    /*
     * 自动生成编号
     * */
    @GetMapping("/createGoodsCoded")
    public R createGoodsCoded() {
        String GoodsCoded = iBsGoodsInfoService.createGoodsCoded();
        return R.ok(GoodsCoded);
    }
    /*
    * 下载模板
    * */
    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) throws Exception {
        String fileName = URLEncoder.encode("品牌信息模板", "UTF-8");
        Map<String, List<String>> dicSelectList = iBsGoodsInfoService.queryDiction();
        XSSFWorkbook xssfWorkbook = ExcelUtilX.dynamicTemplate("品牌信息", ExcelConst.goodsTitle, dicSelectList, null);
        ExcelUtilX.exportExcel(fileName, xssfWorkbook, response);
    }
    @PostMapping("/importData")
    public R<Map<String, Object>> importData(@RequestPart("file") MultipartFile file, boolean updateSupport) throws Exception {
        Map<String, Object> map = iBsGoodsInfoService.importData(file);
        return R.ok(map);
    }
    /**/
    @GetMapping("/selectByBarcode")
    public R selectByBarcode(@RequestParam("barcode")String barcode){
        return iBsGoodsInfoService.selectBybarcode(barcode);
    }

    @GetMapping("/getAllGoodsInfoList")
    public R getAllGoodsInfoList(BsGoodsInfoBo bo) {
        return iBsGoodsInfoService.getAllGoodsInfoList(bo);
    }
}
