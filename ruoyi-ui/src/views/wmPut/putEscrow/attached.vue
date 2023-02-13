<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="入库单号" prop="wmPutCoded" v-if="true">
        <el-input
          v-model="queryParams.wmPutCoded"
          placeholder="请输入入库单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文书编号" prop="certificateCoded">
        <el-input
          v-model="queryParams.certificateCoded"
          placeholder="请输入文书编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库日期" prop="whPutDate">
        <el-date-picker clearable
          v-model="queryParams.whPutDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择入库日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="入库品种数" prop="varietyNumber">
        <el-input
          v-model="queryParams.varietyNumber"
          placeholder="请输入入库品种数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库数" prop="whPutNumber">
        <el-input
          v-model="queryParams.whPutNumber"
          placeholder="请输入入库数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="存放库位编码" prop="whBitCoded">
        <el-input
          v-model="queryParams.whBitCoded"
          placeholder="请输入存放库位编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="保管员" prop="storekeeper">
        <el-input
          v-model="queryParams.storekeeper"
          placeholder="请输入保管员"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="综合管理员" prop="synthesisKeeper">
        <el-input
          v-model="queryParams.synthesisKeeper"
          placeholder="请输入综合管理员"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
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
          v-hasPermi="['system:putInfo:add']"
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
          v-hasPermi="['system:putInfo:edit']"
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
          v-hasPermi="['system:putInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:putInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="putInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="true"/>
      <el-table-column label="入库单号" align="center" prop="wmPutCoded" />
      <el-table-column label="文书编号" align="center" prop="certificateCoded" />
      <el-table-column label="案件类型" align="center" prop="causeType" />
      <el-table-column label="入库日期" align="center" prop="whPutDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.whPutDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入库品种数" align="center" prop="varietyNumber" />
      <el-table-column label="入库数" align="center" prop="whPutNumber" />
      <el-table-column label="存放库位编码" align="center" prop="whBitCoded" />
      <el-table-column label="单据状态" align="center" prop="invoicesStatus" />
      <el-table-column label="保管员" align="center" prop="storekeeper" />
      <el-table-column label="综合管理员" align="center" prop="synthesisKeeper" />
      <el-table-column label="附件" align="center" prop="enclosure" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:putInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:putInfo:remove']"
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

    <!-- 添加或修改商品入库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="入库单号" prop="wmPutCoded">
          <el-input v-model="form.wmPutCoded" placeholder="请输入入库单号" />
        </el-form-item>
        <el-form-item label="文书编号" prop="certificateCoded">
          <el-input v-model="form.certificateCoded" placeholder="请输入文书编号" />
        </el-form-item>
        <el-form-item label="入库日期" prop="whPutDate">
          <el-date-picker clearable
            v-model="form.whPutDate"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择入库日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="入库品种数" prop="varietyNumber">
          <el-input v-model="form.varietyNumber" placeholder="请输入入库品种数" />
        </el-form-item>
        <el-form-item label="入库数" prop="whPutNumber">
          <el-input v-model="form.whPutNumber" placeholder="请输入入库数" />
        </el-form-item>
        <el-form-item label="存放库位编码" prop="whBitCoded">
          <el-input v-model="form.whBitCoded" placeholder="请输入存放库位编码" />
        </el-form-item>
        <el-form-item label="保管员" prop="storekeeper">
          <el-input v-model="form.storekeeper" placeholder="请输入保管员" />
        </el-form-item>
        <el-form-item label="综合管理员" prop="synthesisKeeper">
          <el-input v-model="form.synthesisKeeper" placeholder="请输入综合管理员" />
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
import { listPutInfo, getPutInfo, delPutInfo, addPutInfo, updatePutInfo } from "@/api/wmPut/putInfo";
import { listPutEscrow, getPutEscrow, delPutEscrow,delPutEscrowByPutId,addPutEscrow, updatePutEscrow,getEscrowList } from "@/api/wmPut/putEscrow";

export default {
  name: "AttachedInfo",
  data() {
    return {
      //入库编号
      wmPutCoded:undefined,
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
      // 商品入库信息表格数据
      putInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        client: undefined,
        cause: undefined,
        goodsCoded: undefined,
        goodsName:undefined,
        certificateCoded: undefined,
        invoicesStatus: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
/*        id: [
          { required: true, message: "主键不能为空", trigger: "blur" }
        ],*/
        wmPutCoded: [
          { required: true, message: "入库单号不能为空", trigger: "blur" }
        ],
        certificateCoded: [
          { required: true, message: "文书编号不能为空", trigger: "blur" }
        ],
        causeType: [
          { required: true, message: "案件类型不能为空", trigger: "change" }
        ],
        whPutDate: [
          { required: true, message: "入库日期不能为空", trigger: "blur" }
        ],
        varietyNumber: [
          { required: true, message: "入库品种数不能为空", trigger: "blur" }
        ],
        whPutNumber: [
          { required: true, message: "入库数不能为空", trigger: "blur" }
        ],
        whBitCoded: [
          { required: true, message: "存放库位编码不能为空", trigger: "blur" }
        ],
        invoicesStatus: [
          { required: true, message: "单据状态不能为空", trigger: "blur" }
        ],
        storekeeper: [
          { required: true, message: "保管员不能为空", trigger: "blur" }
        ],
        synthesisKeeper: [
          { required: true, message: "综合管理员不能为空", trigger: "blur" }
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
        enclosure: [
          { required: true, message: "附件不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    if(this.$route.params.wmPutCoded){
      this.wmPutCoded=this.$route.params.wmPutCoded
      this.queryParams.wmPutCoded=this.wmPutCoded;
    }
    this.getList();
  },
  methods: {
    /** 查询商品入库信息列表 */
    getList() {
      this.loading = true;
      getEscrowList(this.queryParams).then(response => {
        this.putInfoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        wmPutCoded: undefined,
        certificateCoded: undefined,
        causeType: undefined,
        whPutDate: undefined,
        varietyNumber: undefined,
        whPutNumber: undefined,
        whBitCoded: undefined,
        invoicesStatus: "0",
        storekeeper: undefined,
        synthesisKeeper: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined,
        enclosure: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
    /*  this.queryParams.wmPutCoded=undefined;*/
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
      this.open = true;
      this.title = "添加商品入库信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getPutInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改商品入库信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updatePutInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addPutInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除商品入库信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delPutInfo(ids);
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
      this.download('system/putInfo/export', {
        ...this.queryParams
      }, `putInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
