<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="商品编码" prop="goodsCoded">
        <el-input
          v-model="queryParams.goodsCoded"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品名称" prop="goodsName">
        <el-input
          v-model="queryParams.goodsName"
          placeholder="请输入商品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="品牌名称" prop="brandName">
        <el-select v-model="queryParams.brandName" placeholder="请选择品牌名称" filterable clearable @keyup.enter.native="handleQuery">
          <el-option
            v-for="brand in this.brandManageList"
            :key="brand.id"
            :label="brand.brandName"
            :value="brand.brandName"
          ></el-option>
        </el-select>
      </el-form-item>
      <!--      <el-form-item label="所属品牌编号" prop="brandCoded">
              <el-input
                v-model="queryParams.brandCoded"
                placeholder="请输入所属品牌编号"
                clearable
                @keyup.enter.native="handleQuery"
              />
            </el-form-item>-->
      <el-form-item label="商品规格" prop="goodsSpecification">
        <el-select v-model="queryParams.goodsSpecification" placeholder="请选择商品规格" clearable @keyup.enter.native="handleQuery">
          <el-option
            v-for="dict in dict.type.goods_specification"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
        <el-form-item label="上市状态" prop="listingStatus">
          <el-select v-model="queryParams.listingStatus" placeholder="请选择上市状态" clearable @keyup.enter.native="handleQuery">
            <el-option
              v-for="dict in dict.type.listing_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      <el-form-item  label="操作日期" prop="betweenTime">
        <el-date-picker
          v-model="queryParams.betweenTime"
          type="daterange"
          :picker-options="pickerOptions"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
        </el-date-picker>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:goodsInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:goodsInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:goodsInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:goodsInfo:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload2"
          size="mini"
          @click="handleImport"
          v-hasPermi="['communityInfo:community:import']"
        >导入
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="商品编码" align="center" prop="goodsCoded" width="100px"/>
      <el-table-column label="商品名称" align="center" prop="goodsName" />
      <el-table-column label="品牌名称" align="center" prop="brandName" />
      <el-table-column label="品牌编号" align="center" prop="brandCoded"  v-if="false" />
      <el-table-column label="小盒条码" align="center" prop="smallBoxBarcode" />
      <el-table-column label="条盒条码" align="center" prop="barboxBarcode" />
      <el-table-column label="商品类型" align="center" prop="goodsType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.goods_type" :value="scope.row.goodsType"/>
        </template>
      </el-table-column>
      <el-table-column label="商品规格" align="center" prop="goodsSpecification" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.goods_specification" :value="scope.row.goodsSpecification"/>
        </template>
      </el-table-column>
      <el-table-column label="计量单位" align="center" prop="measureUnit" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.measure_unit" :value="scope.row.measureUnit"/>
        </template>
      </el-table-column>
      <el-table-column label="单条盒数" align="center" prop="singleBarboxNumber" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.single_barbox_number" :value="scope.row.singleBarboxNumber"/>
        </template>
      </el-table-column>
      <el-table-column label="小盒支数" align="center" prop="smallBoxNumber" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.small_box_number" :value="scope.row.smallBoxNumber"/>
        </template>
      </el-table-column>
      <el-table-column label="单盒售价" align="center" prop="singleBoxPrice" />
      <el-table-column label="条盒售价" align="center" prop="barboxPrice" />
      <el-table-column label="条盒批发价" align="center" prop="barboxWholesalePrices" />
      <el-table-column label="包装形式" align="center" prop="packagingForms" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.packaging_forms" :value="scope.row.packagingForms"/>
        </template>
      </el-table-column>
      <el-table-column label="上市状态" align="center" prop="listingStatus" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.listing_status" :value="scope.row.listingStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="焦油量" align="center" prop="tarContent" >
        <template slot-scope="scope">{{scope.row.tarContent+'mg'}}</template>
      </el-table-column>
      <el-table-column label="烟气烟碱量" align="center" prop="smokeNicotine" >
        <template slot-scope="scope">{{scope.row.smokeNicotine+'mg'}}</template>
      </el-table-column>
      <el-table-column label="一氧化碳量" align="center" prop="monoxideCarbon" >
        <template slot-scope="scope">{{scope.row.monoxideCarbon+'mg'}}</template>
      </el-table-column>
<!--      <el-table-column label="最后操作时间" align="center" prop="updateTime" ></el-table-column>-->
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['base:goodsInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['base:goodsInfo:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <el-dialog
      :title="upload.title"
      :visible.sync="upload.open"
      width="400px"
      append-to-body
    >
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <!--          <div class="el-upload__tip" slot="tip">
                      <el-checkbox v-model="upload.updateSupport"/>
                      是否更新已经存在的小区信息
                    </div>-->
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link
            type="primary"
            :underline="false"
            style="font-size: 12px; vertical-align: baseline"
            @click="importTemplate"
          >下载模板
          </el-link
          >
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改商品信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="8">
            <el-form-item label="品牌名称" prop="brandName">
              <el-select v-model="form.brandName" placeholder="请选择品牌" filterable @change="getBrandInfo($event)">
                <el-option
                  v-for="dict in this.brandManageList"
                  :key="dict.brandCoded"
                  :label="dict.brandName"
                  :value="dict.brandCoded"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="商品编码" prop="goodsCoded">
              <el-input v-model="form.goodsCoded" placeholder="请输入商品编码" :disabled="ifEdit" />
              <el-button size="mini" @click="getGoodsCoded" v-if="!ifEdit">生成商品编码</el-button>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="商品名称" prop="goodsName">
              <el-input v-model="form.goodsName" placeholder="请输入商品名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="商品类型" prop="goodsType">
              <el-select v-model="form.goodsType" placeholder="请选择商品类型" >
                <el-option
                  v-for="dict in dict.type.goods_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="商品规格" prop="goodsSpecification">
              <el-select v-model="form.goodsSpecification" placeholder="请输入商品规格" >
                <el-option
                  v-for="dict in dict.type.goods_specification"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="小盒条码" prop="smallBoxBarcode">
              <el-input v-model="form.smallBoxBarcode" placeholder="请输入小盒条码" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="条盒条码" prop="barboxBarcode">
              <el-input v-model="form.barboxBarcode" placeholder="请输入条盒条码" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="计量单位" prop="measureUnit">
              <el-select v-model="form.measureUnit" placeholder="请输入计量单位" >
                <el-option
                  v-for="dict in dict.type.measure_unit"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="单条盒数" prop="singleBarboxNumber">
              <el-select v-model="form.singleBarboxNumber" placeholder="请输入单条盒数" >
                <el-option
                  v-for="dict in dict.type.single_barbox_number"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="小盒支数" prop="smallBoxNumber">
              <el-select v-model="form.smallBoxNumber" placeholder="请输入小盒支数" >
                <el-option
                  v-for="dict in dict.type.small_box_number"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="单盒售价" prop="singleBoxPrice">
              <el-input v-model="form.singleBoxPrice" placeholder="请输入单盒售价" >
                <i slot="suffix" style="font-style:normal;margin-right: 10px; line-height: 30px;">￥</i>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="条盒售价" prop="barboxPrice">
              <el-input v-model="form.barboxPrice" placeholder="请输入条盒售价" >
                <i slot="suffix" style="font-style:normal;margin-right: 10px; line-height: 30px;">￥</i>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="条盒批发价" prop="barboxWholesalePrices">
              <el-input v-model="form.barboxWholesalePrices" placeholder="请输入条盒批发价" >
                <i slot="suffix" style="font-style:normal;margin-right: 10px; line-height: 30px;">￥</i>
              </el-input>
            </el-form-item>
          </el-col>

          <el-col :span="8">
            <el-form-item label="包装形式" prop="packagingForms">
              <el-select v-model="form.packagingForms" placeholder="请选择包装形式" >
                <el-option
                  v-for="dict in dict.type.packaging_forms"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="焦油量" prop="tarContent">
              <el-input v-model="form.tarContent" placeholder="请输入焦油量">
                <i slot="suffix" style="font-style:normal;margin-right: 10px; line-height: 30px;">/mg</i>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="烟气烟碱量" prop="smokeNicotine">
              <el-input v-model="form.smokeNicotine" placeholder="请输入烟气烟碱量" >
                <i slot="suffix" style="font-style:normal;margin-right: 10px; line-height: 30px;">/mg</i>
              </el-input>
            </el-form-item>
          </el-col>

          <el-col :span="8">

            <el-form-item label="一氧化碳量" prop="monoxideCarbon">
              <el-input v-model="form.monoxideCarbon" placeholder="请输入一氧化碳量" >
                <i slot="suffix" style="font-style:normal;margin-right: 10px; line-height: 30px;">/mg</i>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="上市状态" prop="listingStatus">
              <el-select v-model="form.listingStatus" placeholder="请选择上市状态" clearable >
                <el-option
                  v-for="dict in dict.type.listing_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" type="textarea" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGoodsInfo, getGoodsInfo, delGoodsInfo, addGoodsInfo, updateGoodsInfo, verifyGoodsCoded,createGoodsCoded } from "@/api/base/goodsInfo";
import { listBrandManage} from "@/api/base/brandManage";
import { getToken } from '@/utils/auth'

export default {
  name: "GoodsInfo",
  dicts: ['goods_type','goods_specification','measure_unit','single_barbox_number','small_box_number','packaging_forms','listing_status'],
  data() {
    let  goodsCodedVerify=(rule, value, callback)=>{
      let id = this.form.id;
      if(value){
        let flag=/^([0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入非0开头的整数！'))
        }
        console.log(value+"1232323")
        verifyGoodsCoded({goodsCoded:parseInt(value),id:id}).then(res=>{
          this.verifyGoodsInfoList=res.data
          if(this.verifyGoodsInfoList.length>0){
            this.verifyGoodsInfoList=[];
            callback(new Error('该商品编号已存在'))
          }else{
            callback()
          }
        })
      }else{
        callback()
      }
    }
    let moneyVerify=(rule, value, callback)=>{
      if(value){
        let flag= /^\d+.?\d{0,2}$/
        if(!flag.test(value)){
          callback(new Error('请输入小数点后不超过两位的价格！'))
        }else{
          callback()
        }
      }else{
        callback()
      }
    }
    let numberMgVerify=(rule, value, callback)=>{
      if(value){
        let flag=/^([1-9][0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入非0开头的整数'))
        }else{
          callback()
        }
      }else{
        callback()
      }
    }
    return {
      //导入参数
      upload: {
        // 是否显示弹出层
        open: false,
        // 弹出层标题
        title: '',
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: 'Bearer ' + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + '/communityInfo/community/importData',
        error: false,
        titleError: "异常数据列表",
        openError: false,
        errData: [],
      },
      //修改禁用
      ifEdit:false,
      brandManageList: [],
      verifyGoodsInfoList:[],
      brandInfo:{},
      // 按钮loading
      buttonLoading: false,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 商品信息表格数据
      goodsInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        goodsCoded: undefined,
        goodsName: undefined,
        brandName: undefined,
        brandCoded: undefined,
        smallBoxBarcode: undefined,
        barboxBarcode: undefined,
        goodsType: undefined,
        goodsSpecification: undefined,
        measureUnit: undefined,
        singleBarboxNumber: undefined,
        smallBoxNumber: undefined,
        singleBoxPrice: undefined,
        barboxPrice: undefined,
        barboxWholesalePrices: undefined,
        packagingForms: undefined,
        listingStatus: undefined,
        tarContent: undefined,
        smokeNicotine: undefined,
        monoxideCarbon: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        goodsCoded: [
          { required: true, message: "商品编码不能为空", trigger: "blur" },
          { validator:goodsCodedVerify, trigger: "blur"}
        ],
        goodsName: [
          { required: true, message: "商品名称不能为空", trigger: "blur" }
        ],
        brandName: [
          { required: true, message: "所属品牌名称不能为空", trigger: "blur" }
        ],
        brandCoded: [
          { required: true, message: "所属品牌编号不能为空", trigger: "blur" }
        ],
        smallBoxBarcode: [
          { required: true, message: "小盒条码不能为空", trigger: "blur" }
        ],
        barboxBarcode: [
          { required: true, message: "条盒条码不能为空", trigger: "blur" }
        ],
        goodsType: [
          { required: true, message: "商品类型不能为空", trigger: "change" }
        ],
        goodsSpecification: [
          { required: true, message: "商品规格不能为空", trigger: "blur" }
        ],
        measureUnit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" }
        ],
        singleBarboxNumber: [
          { required: true, message: "单条盒数不能为空", trigger: "blur" }
        ],
        smallBoxNumber: [
          { required: true, message: "小盒支数不能为空", trigger: "blur" }
        ],
        barboxWholesalePrices: [
          {validator:moneyVerify,trigger: "blur"}
        ],
        singleBoxPrice:[
          {validator:moneyVerify,trigger: "blur"}
        ],
        barboxPrice:[
          {validator:moneyVerify,trigger: "blur"}
        ],
        tarContent:[
          {validator:numberMgVerify,trigger: "blur"}
        ],
        smokeNicotine:[
          {validator:numberMgVerify,trigger: "blur"}
        ],
        monoxideCarbon:[
          {validator:numberMgVerify,trigger: "blur"}
        ],
        packagingForms: [
          { required: true, message: "包装形式不能为空", trigger: "blur" }
        ],
        listingStatus: [
          { required: true, message: "上市状态不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateBy: [
          { required: true, message: "操作者不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "操作时间不能为空", trigger: "blur" }
        ],
        createBy: [
          { required: true, message: "创建者不能为空", trigger: "blur" }
        ]
      },
      pickerOptions: {
        shortcuts: [{
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          }
        }]
      },
    };
  },
  created() {
    this.getList();
    this.getBrandInfoList();
  },
  methods: {
    //生成商品编号
    getGoodsCoded(){
      createGoodsCoded().then(res=>{
      let a= this.form.brandCoded
        if(a==undefined || a== null || a==""){
          this.$message({
            message: '警告! 请先选择品牌',
            type: 'warning'
          });
        }else{
          this.form.goodsCoded=this.form.brandCoded.toString()+res.msg;
        }
      })
    },
    /*品牌下拉框*/
    getBrandInfoList(){
      this.loading = true;
      listBrandManage({pageNum: 1,
        pageSize: 10000,brandEnabled:'0'}).then(res=>{
        this.brandManageList=res.rows
        this.loading = false;
      })
    },
    /*获取品牌信息的值*/
    getBrandInfo: function(event) {
      var aa=this.brandManageList.filter(t=> t.brandCoded == event);
      this.form.brandCoded=event;
      this.form.brandName=aa[0].brandName;
    },
    /** 查询商品信息列表 */
    getList() {
      this.loading = true;
      listGoodsInfo(this.queryParams).then(response => {
        this.goodsInfoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.ifEdit=true;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        goodsCoded: undefined,
        goodsName: undefined,
        brandName: undefined,
        brandCoded: undefined,
        smallBoxBarcode: undefined,
        barboxBarcode: undefined,
        goodsType: undefined,
        goodsSpecification: undefined,
        measureUnit: undefined,
        singleBarboxNumber: undefined,
        smallBoxNumber: undefined,
        singleBoxPrice: undefined,
        barboxPrice: undefined,
        barboxWholesalePrices: undefined,
        packagingForms: undefined,
        listingStatus: "0",
        tarContent: undefined,
        smokeNicotine: undefined,
        monoxideCarbon: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined,
        remark: undefined,
        createBy: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      let arr=[];
      let r=this.queryParams.betweenTime;
      if(r!=undefined&&r!=null&&r!=""){
        arr=this.queryParams.betweenTime.toString().split(",")
        this.queryParams.startTime=arr[0]
        this.queryParams.endTime=arr[1];
      }
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.ifEdit=false;
      this.open = true;
      this.title = "添加商品信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getGoodsInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.ifEdit=true;
        this.open = true;
        this.title = "修改商品信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateGoodsInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addGoodsInfo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除商品信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delGoodsInfo(ids);
      }).then(() => {
        this.loading = false;
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      }).finally(() => {
        this.loading = false;
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('base/goodsInfo/export', {
        ...this.queryParams
      }, `商品信息_${new Date().getTime()}.xlsx`)
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = '商品信息导入'
      this.upload.open = true
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download(
        'base/goodsInfo/importTemplate',
        {},
        `商品信息_${new Date().getTime()}.xlsx`
      )
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true
    },
    // upload- 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      if (response.code === 500) {
        this.$alert(
          "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
          response.msg +
          "</div>",
          "导入结果",
          {dangerouslyUseHTMLString: true}
        );
      } else if (response.code === 200) {
        const data1 = response.data;
        const errDataSum = data1.errDataSum;
        if (errDataSum > 0) {
          this.upload.errData = data1.errData;
          this.upload.openError = true;
          this.upload.msg = data1.msg;
        } else {
          this.$alert(
            "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
            data1.msg +
            "</div>",
            "导入结果",
            {dangerouslyUseHTMLString: true}
          );
        }
        this.getList();
      }
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit()
    },
  }
};
</script>
