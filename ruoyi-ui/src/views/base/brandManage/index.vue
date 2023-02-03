<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="品牌编号" prop="brandCoded">
        <el-input
          v-model="queryParams.brandCoded"
          placeholder="请输入品牌编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="品牌名称" prop="brandName">
        <el-input
          v-model="queryParams.brandName"
          placeholder="请输入品牌名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="品牌所在地" prop="brandLocality">
        <el-input
          v-model="queryParams.brandLocality"
          placeholder="请输入品牌所在地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="启用状态" prop="brandEnabled">
        <el-select v-model="queryParams.brandEnabled" placeholder="请选择启用状态" clearable @keyup.enter.native="handleQuery" style="width:100%">
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
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
          v-hasPermi="['system:brandManage:add']"
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
          v-hasPermi="['system:brandManage:edit']"
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
          v-hasPermi="['system:brandManage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:brandManage:export']"
        >导出</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="brandManageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="品牌编号" align="center" prop="brandCoded" />
      <el-table-column label="品牌名称" align="center" prop="brandName" />
      <el-table-column label="品牌所在地" align="center" prop="brandLocality" />
      <el-table-column label="启用状态" align="center" prop="brandEnabled" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.brandEnabled"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime),'{y}-{m}-{d}' }}</span>
        </template>
      </el-table-column>-->
      <el-table-column label="最后操作人" align="center" prop="updateBy" />
      <el-table-column label="最后操作时间" align="center" prop="updateTime" width="180">
<!--        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime) }}</span>
        </template>-->
      </el-table-column>
<!--      <el-table-column label="创建者" align="center" prop="createBy" />-->
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:brandManage:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:brandManage:remove']"
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


    <!-- 添加或修改品牌管理/品牌详细信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="品牌编号" prop="brandCoded">
          <el-input v-model="form.brandCoded" placeholder="请输入品牌编号" :disabled="ifEdit" >
          </el-input>
          <el-button size="mini" @click="getBrandCoded" v-if="!ifEdit">生成品牌编码</el-button>
        </el-form-item>
        <el-form-item label="品牌名称" prop="brandName">
          <el-input v-model="form.brandName" placeholder="请输入品牌名称" />
        </el-form-item>
        <el-form-item label="品牌所在地" prop="brandLocality">
          <el-input v-model="form.brandLocality" placeholder="请输入品牌所在地" />
        </el-form-item>
        <el-form-item label="启用状态" prop="brandEnabled">
          <el-select v-model="form.brandEnabled" placeholder="请选择启用状态" @change="ifGoodsUse"  style="width:100%">
            <el-option
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" type="textarea"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">

        <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listBrandManage, getBrandManage, delBrandManage, addBrandManage, updateBrandManage,verifyBrandCode,createBrandCoded } from "@/api/base/brandManage";
import { listGoodsInfo, getGoodsInfo } from "@/api/base/goodsInfo";

export default {
  name: "BrandManage",
  dicts: ['sys_normal_disable'],
  data() {
    let verifyBrandCodeByCode=(rule, value, callback)=>{
      let id = this.form.id;
      if(value){
        let flag=/^([0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入非0开头的整数'))
        }
        verifyBrandCode({brandCoded:value,id:id}).then(res=>{
          this.verifyBrandManageList=res.data;
          if(this.verifyBrandManageList.length>0){
            this.verifyBrandManageList=[];
            callback(new Error('该品牌编号已存在'))
          }else{
            callback()
          }
        })
      }else{
        callback()
      }
    }
    return {
      goodsList:[],
      //禁用
      ifEdit:false,
      // 按钮loading
      buttonLoading: false,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      codes: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 品牌管理/品牌详细信息表格数据
      brandManageList: [],
      verifyBrandManageList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        brandCoded: undefined,
        brandName: undefined,
        brandLocality: undefined,
        brandEnabled: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        brandCoded: [
          { required: true, message: "品牌编号不能为空", trigger: "blur" },
          { validator:verifyBrandCodeByCode, trigger:'blur'}
        ],
        brandName: [
          { required: true, message: "品牌名称不能为空", trigger: "blur" }
        ],
        brandLocality: [
          { required: true, message: "品牌所在地不能为空", trigger: "blur" }
        ],
        brandEnabled: [
          { required: true, message: "启用状态 0-正常 ，1-停用 不能为空", trigger: "blur" }
        ],
        updateBy: [
          { required: true, message: "最后操作人不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "最后操作时间YYYY-MM-DD HH:MM:SS.000不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "备注不能为空", trigger: "blur" }
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
  },
  methods: {
    //是否已有商品归属
    ifGoodsUse() {
      if(this.form.brandEnabled!='0'){
        listGoodsInfo({
          pageNum: 1, pageSize: 10000, brandCoded: this.form.brandCoded,listingStatus:'0' }).then(res => {
          this.goodsList = res.rows;
          if (this.goodsList.length > 0) {
            this.form.brandEnabled='0';
            this.$message({
              message: '该品牌下已有商品上市',
              type: 'warning'
            });
          }
        })
      }
    },
    getBrandCoded() {
      createBrandCoded().then(res => {
        this.form.brandCoded = res.msg;
      })
    },
    /** 查询品牌管理/品牌详细信息列表 */
    getList() {
      this.loading = true;
      listBrandManage(this.queryParams).then(response => {
        this.brandManageList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.ifEdit = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        brandCoded: undefined,
        brandName: undefined,
        brandLocality: undefined,
        brandEnabled: undefined,
        updateBy: undefined,
        updateTime: undefined,
        remark: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      let arr = [];
      let r = this.queryParams.betweenTime;
      if (r != undefined && r != null && r != "") {
        arr = this.queryParams.betweenTime.toString().split(",")
        this.queryParams.startTime = arr[0]
        this.queryParams.endTime = arr[1];
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
      this.codes = selection.map(item => item.brand_coded)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.ifEdit = false;
      this.title = "添加品牌管理/品牌详细信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.ifEdit = true;
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getBrandManage(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改品牌管理/品牌详细信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateBrandManage(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addBrandManage(this.form).then(response => {
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
      let codes = row.brandCoded || this.codes;
      if (codes == null || codes == "" || codes == undefined) {
        codes = ids;
      }
      this.$modal.confirm('是否确认删除品牌详细信息编号为"' + codes + '"的数据项？').then(() => {
        this.loading = true;
        return delBrandManage(ids);
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
      this.download('base/brandManage/export', {
        ...this.queryParams
      }, `品牌信息_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
