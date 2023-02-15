<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文书编号" prop="certificateCoded">
        <el-input
          v-model="queryParams.certificateCoded"
          placeholder="请输入文书编号"
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
      <el-form-item label="当事人" prop="client">
        <el-input
          v-model="queryParams.client"
          placeholder="请输入当事人"
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
          v-hasPermi="['system:outInfo:add']"
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
          v-hasPermi="['system:outInfo:edit']"
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
          v-hasPermi="['system:outInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:outInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="outInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="true"/>
      <el-table-column label="出库单号" align="center" prop="wmOutCoded" />
      <el-table-column label="文书编号" align="center" prop="certificateCoded" />
      <el-table-column label="商品名称" align="center" prop="goodsName" />
      <el-table-column label="商品规格" align="center" prop="goodsSpecification" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.goods_specification" :value="scope.row.goodsSpecification"/>
        </template>
      </el-table-column>
      <el-table-column label="出库数量" align="center" prop="wmOutNumber" />
      <el-table-column label="单据状态" align="center" prop="invoicesStatus" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.invoices_status" :value="scope.row.invoicesStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="出库日期" align="center" prop="wmOutDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.wmOutDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="保管员" align="center" prop="storekeeper" />
      <el-table-column label="综合管理员" align="center" prop="synthesisKeeper" />
      <el-table-column label="接收人员" align="center" prop="receiver" />
      <el-table-column label="附件" align="center" prop="enclosure" />
      <el-table-column label="出库类型" align="center" prop="outType" />

<!--      <el-table-column label="暂存出库信息id" align="center" prop="wmOutId" />
      <el-table-column label="当事人" align="center" prop="client" />
      <el-table-column label="案由" align="center" prop="cause" />
      <el-table-column label="关联文书编号(入库且未结案的文书编号，有效数据筛选)" align="center" prop="certificateCodedAssaciation" />
      <el-table-column label="出库原因(返还，移送，转罚没)" align="center" prop="wmOutReason" />
      <el-table-column label="烟卷质量" align="center" prop="cigaretteQuality" />
      <el-table-column label="所属单位编号" align="center" prop="unitCoded" />-->

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:outInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:outInfo:remove']"
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

    <!-- 添加或修改商品出库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="出库单号" prop="wmOutCoded">
          <el-input v-model="form.wmOutCoded" placeholder="请输入出库单号" />
        </el-form-item>
        <el-form-item label="文书编号" prop="certificateCoded">
          <el-input v-model="form.certificateCoded" placeholder="请输入文书编号" />
        </el-form-item>
        <el-form-item label="商品名称" prop="goodsName">
          <el-select v-model="form.goodsName" placeholder="请输入商品名称" >
            <el-option
              v-for="dict in dict.type.goods_specification"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
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
        <el-form-item label="出库数量" prop="wmOutNumber">
          <el-input v-model="form.wmOutNumber" placeholder="请输入出库数量" />
        </el-form-item>
        <el-form-item label="出库日期" prop="wmOutDate">
          <el-date-picker clearable
            v-model="form.wmOutDate"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择出库日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="保管员" prop="storekeeper">
          <el-select v-model="storekeeperList" multiple  placeholder="请选择人员" size="mini" @change="getStorekeeper" style="width: 100%">
            <el-option
              v-for="dict in this.keeperUser"
              :key="dict.userId"
              :label="dict.userName"
              :value="dict.userId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="综合管理员" prop="synthesisKeeper">
          <el-select v-model="synthesisKeeperList" multiple placeholder="请选择人员" size="mini" @change="getSynthesisKeeper" style="width: 100%">
            <el-option
              v-for="dict in this.synthesisKeeperUser"
              :key="dict.userId"
              :label="dict.userName"
              :value="dict.userId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="接收人员" prop="receiver">
          <el-input v-model="form.receiver" placeholder="请输入接收人员" />
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
import { listOutInfo, getOutInfo, delOutInfo, addOutInfo, updateOutInfo } from "@/api/wmOut/outInfo";
import { listOutTemporary, getOutTemporary, delOutTemporary, addOutTemporary, updateOutTemporary } from "@/api/wmOut/outTemporary";

export default {
  name: "outTemporary",
  dicts: ['cause','invoices_status','goods_specification'],
  data() {
    return {
      //保管员集合
      storekeeperList:[],
      //综合保管员集合
      synthesisKeeperList:[],
      //组织集合
      unitList:[],
      //职位人员
      keeperUser:[],
      synthesisKeeperUser:[],
      //商品集合
      goodsList:[],
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
      // 商品出库信息表格数据
      outInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        client:undefined,
        wmOutCoded: undefined,
        certificateCoded: undefined,
        goodsName: undefined,
        goodsSpecification: undefined,
        invoicesStatus: undefined,
        storekeeper: undefined,
        synthesisKeeper: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined,
        outType: 2
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        id: [
          { required: true, message: "主键不能为空", trigger: "blur" }
        ],
        wmOutCoded: [
          { required: true, message: "出库单号不能为空", trigger: "blur" }
        ],
        certificateCoded: [
          { required: true, message: "文书编号不能为空", trigger: "blur" }
        ],
        goodsName: [
          { required: true, message: "商品名称不能为空", trigger: "blur" }
        ],
        goodsId: [
          { required: true, message: "商品id不能为空", trigger: "blur" }
        ],
        goodsSpecification: [
          { required: true, message: "商品规格不能为空", trigger: "blur" }
        ],
        wmOutNumber: [
          { required: true, message: "出库数量不能为空", trigger: "blur" }
        ],
        invoicesStatus: [
          { required: true, message: "单据状态不能为空", trigger: "blur" }
        ],
        wmOutDate: [
          { required: true, message: "出库日期不能为空", trigger: "blur" }
        ],
        storekeeper: [
          { required: true, message: "保管员不能为空", trigger: "blur" }
        ],
        storekeeperId: [
          { required: true, message: "保管员-用户id不能为空", trigger: "blur" }
        ],
        synthesisKeeper: [
          { required: true, message: "综合管理员不能为空", trigger: "blur" }
        ],
        synthesisKeeperId: [
          { required: true, message: "综合管理员-用户id不能为空", trigger: "blur" }
        ],
        receiver: [
          { required: true, message: "接收人员不能为空", trigger: "blur" }
        ],
        receiverId: [
          { required: true, message: "接收人员-用户id不能为空", trigger: "blur" }
        ],
        enclosure: [
          { required: true, message: "附件不能为空", trigger: "blur" }
        ],
        outType: [
          { required: true, message: "出库类型不能为空", trigger: "change" }
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
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getStorekeeper(value){
      console.log(value)
      this.storekeeperList=value;
      this.form.storekeeper=this.storekeeperList.join(",");
    },
    getSynthesisKeeper(value){
      this.synthesisKeeperList=value;
      this.form.synthesisKeeper=this.synthesisKeeperList.join(",");
    },
    /*查询所有商品*/
    getGoodsAll(){

    },
    /** 查询商品出库信息列表 */
    getList() {
      this.loading = true;
      listOutTemporary(this.queryParams).then(response => {
        this.outInfoList = response.rows;
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
        wmOutCoded: undefined,
        certificateCoded: undefined,
        goodsName: undefined,
        goodsId: undefined,
        goodsSpecification: undefined,
        wmOutNumber: undefined,
        invoicesStatus: "0",
        wmOutDate: undefined,
        storekeeper: undefined,
        synthesisKeeper: undefined,
        receiver: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined,
        enclosure: undefined,
        createBy: undefined,
        outType: 2
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
      this.title = "添加商品出库信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getOutInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改商品出库信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateOutInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addOutInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除商品出库信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delOutTemporary(ids);
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
      this.download('system/outInfo/export', {
        ...this.queryParams
      }, `outInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
