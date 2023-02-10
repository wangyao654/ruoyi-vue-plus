<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="委托单位" prop="entrustUnit">
        <el-input
          v-model="queryParams.entrustUnit"
          placeholder="请输入委托单位"
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
      <el-form-item label="案由" prop="cause">
        <el-select v-model="queryParams.cause" placeholder="请选择案由" clearable @keyup.enter.native="handleQuery">
          <el-option
            v-for="dict in dict.type.cause"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="商品名称" prop="goodsName">
        <el-input
          v-model="queryParams.goodsName"
          placeholder="请输入商品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单据状态" prop="invoicesStatus">
        <el-select v-model="queryParams.invoicesStatus" placeholder="请选择单据状态" clearable @keyup.enter.native="handleQuery">
          <el-option
            v-for="dict in dict.type.invoices_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item  label="时间" prop="betweenTime">
        <el-date-picker
          v-model="queryParams.betweenTime"
          type="datetimerange"
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
          v-hasPermi="['putEscrow:putEscrow:add']"
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
          v-hasPermi="['putEscrow:putEscrow:edit']"
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
          v-hasPermi="['putEscrow:putEscrow:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['putEscrow:putEscrow:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="putEscrowList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="110" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="暂存入库信息" align="center" prop="wmPutId" v-if="false" />
      <el-table-column label="入库单号" align="center" prop="wmPutCoded" >
        <template slot-scope="scope">
          <a @click="attachedList(scope.row)">
            {{scope.row.wmPutCoded}}
          </a>
        </template>
      </el-table-column>
      <el-table-column label="文书编号" align="center" prop="certificateCoded" />
      <el-table-column label="当事人" align="center" prop="client" />
      <el-table-column label="案由" align="center" prop="cause" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.cause" :value="scope.row.cause"/>
        </template>
      </el-table-column>
      <el-table-column label="入库数" align="center" prop="whPutNumber" />
      <el-table-column label="案件类型" align="center" prop="causeType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.cause_type" :value="scope.row.causeType"/>
        </template>
      </el-table-column>
      <el-table-column label="查扣日期" align="center" prop="detainDate" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.detainDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入库日期" align="center" prop="whPutDate" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.whPutDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入库品种数" align="center" prop="varietyNumber" />
      <el-table-column label="库位编码" align="center" prop="whBitCoded" />
      <el-table-column label="单据状态" align="center" prop="invoicesStatus" />
      <el-table-column label="保管员" align="center" prop="storekeeper" />
      <el-table-column label="综合管理员" align="center" prop="synthesisKeeper" />
      <el-table-column label="最后操作时间" align="center" prop="updateTime" />
      <el-table-column label="附件" align="center" prop="enclosure" v-if="false" />
      <!--      <el-table-column label="扣查部门" align="center" prop="detainDeptName" />
            <el-table-column label="扣查部门id" align="center" prop="detainDept" />
            <el-table-column label="商品编码" align="center" prop="goodsCoded" />
            <el-table-column label="入库条数" align="center" prop="putNumber" />
            <el-table-column label="案件二维码" align="center" prop="causeQr" />
            <el-table-column label="存放库区" align="center" prop="whAreaCoded" />
            <el-table-column label="存放库位" align="center" prop="whBitCoded" />
            <el-table-column label="归属单位" align="center" prop="unitCoded" />
            <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['putEscrow:putEscrow:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['putEscrow:putEscrow:remove']"
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

    <!-- 添加或修改代管入库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="入库信息id-代管" prop="wmPutId">
          <el-input v-model="form.wmPutId" placeholder="请输入入库信息id-代管" />
        </el-form-item>
        <el-form-item label="委托单位" prop="entrustUnit">
          <el-input v-model="form.entrustUnit" placeholder="请输入委托单位" />
        </el-form-item>
        <el-form-item label="单位id" prop="entrustUnitId">
          <el-input v-model="form.entrustUnitId" placeholder="请输入单位id" />
        </el-form-item>
        <el-form-item label="委托日期" prop="entrustDate">
          <el-date-picker clearable
            v-model="form.entrustDate"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择委托日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="存放库位编码" prop="whBitCoded">
          <el-input v-model="form.whBitCoded" placeholder="请输入存放库位编码" />
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
import { listPutEscrow, getPutEscrow, delPutEscrow, addPutEscrow, updatePutEscrow } from "@/api/wmPut/putEscrow";

export default {
  name: "PutEscrow",
  dicts: ['cause','cause_type','invoices_status','position'],
  data() {
    return {
      //标志是否更改
      //保管员集合
      storekeeperList:[],
      //综合保管员集合
      synthesisKeeperList:[],
      //商品集合
      goodsList:[],
      //组织集合
      unitList:[],
      //职位人员
      keeperUser:[],
      synthesisKeeperUser:[],
      //库位集合
      whBitInfoList:[],
      verifyWmPutInfoList:[],
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
      // 代管入库信息表格数据
      putEscrowList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        entrustUnit: undefined,
        entrustUnitId: undefined,
        entrustDate: undefined,
        whBitCoded: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        id: [
          { required: true, message: "主键不能为空", trigger: "blur" }
        ],
        wmPutId: [
          { required: true, message: "入库信息id-代管不能为空", trigger: "blur" }
        ],
        entrustUnit: [
          { required: true, message: "委托单位不能为空", trigger: "blur" }
        ],
        entrustUnitId: [
          { required: true, message: "单位id不能为空", trigger: "blur" }
        ],
        entrustDate: [
          { required: true, message: "委托日期不能为空", trigger: "blur" }
        ],
        whBitCoded: [
          { required: true, message: "存放库位编码不能为空", trigger: "blur" }
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
    /** 查询代管入库信息列表 */
    getList() {
      this.loading = true;
      listPutEscrow(this.queryParams).then(response => {
        this.putEscrowList = response.rows;
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加代管入库信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getPutEscrow(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改代管入库信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updatePutEscrow(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addPutEscrow(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除代管入库信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delPutEscrow(ids);
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
      this.download('putEscrow/putEscrow/export', {
        ...this.queryParams
      }, `putEscrow_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
