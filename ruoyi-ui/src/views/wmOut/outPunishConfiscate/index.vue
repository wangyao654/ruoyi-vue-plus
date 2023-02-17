<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="出库信息id-罚没" prop="wmOutId">
        <el-input
          v-model="queryParams.wmOutId"
          placeholder="请输入出库信息id-罚没"
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
      <el-form-item label="案由" prop="cause">
        <el-input
          v-model="queryParams.cause"
          placeholder="请输入案由"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="出库原因(返还，移送，转罚没)" prop="wmOutReason">
        <el-input
          v-model="queryParams.wmOutReason"
          placeholder="请输入出库原因(返还，移送，转罚没)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="烟卷/商品 质量" prop="cigaretteQuality">
        <el-input
          v-model="queryParams.cigaretteQuality"
          placeholder="请输入烟卷/商品 质量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属单位编号" prop="unitCoded">
        <el-input
          v-model="queryParams.unitCoded"
          placeholder="请输入所属单位编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属单位" prop="unitName">
        <el-input
          v-model="queryParams.unitName"
          placeholder="请输入所属单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['wmOut:outPunishConfiscate:add']"
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
          v-hasPermi="['wmOut:outPunishConfiscate:edit']"
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
          v-hasPermi="['wmOut:outPunishConfiscate:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['wmOut:outPunishConfiscate:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="outPunishConfiscateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="true"/>
      <el-table-column label="出库信息id-罚没" align="center" prop="wmOutId" />
      <el-table-column label="当事人" align="center" prop="client" />
      <el-table-column label="案由" align="center" prop="cause" />
      <el-table-column label="出库原因(返还，移送，转罚没)" align="center" prop="wmOutReason" />
      <el-table-column label="烟卷/商品 质量" align="center" prop="cigaretteQuality" />
      <el-table-column label="所属单位编号" align="center" prop="unitCoded" />
      <el-table-column label="所属单位" align="center" prop="unitName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['wmOut:outPunishConfiscate:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['wmOut:outPunishConfiscate:remove']"
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

    <!-- 添加或修改罚没出库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="出库信息id-罚没" prop="wmOutId">
          <el-input v-model="form.wmOutId" placeholder="请输入出库信息id-罚没" />
        </el-form-item>
        <el-form-item label="当事人" prop="client">
          <el-input v-model="form.client" placeholder="请输入当事人" />
        </el-form-item>
        <el-form-item label="案由" prop="cause">
          <el-input v-model="form.cause" placeholder="请输入案由" />
        </el-form-item>
        <el-form-item label="出库原因(返还，移送，转罚没)" prop="wmOutReason">
          <el-input v-model="form.wmOutReason" placeholder="请输入出库原因(返还，移送，转罚没)" />
        </el-form-item>
        <el-form-item label="烟卷/商品 质量" prop="cigaretteQuality">
          <el-input v-model="form.cigaretteQuality" placeholder="请输入烟卷/商品 质量" />
        </el-form-item>
        <el-form-item label="所属单位编号" prop="unitCoded">
          <el-input v-model="form.unitCoded" placeholder="请输入所属单位编号" />
        </el-form-item>
        <el-form-item label="所属单位" prop="unitName">
          <el-input v-model="form.unitName" placeholder="请输入所属单位" />
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
import { listOutPunishConfiscate, getOutPunishConfiscate, delOutPunishConfiscate, addOutPunishConfiscate, updateOutPunishConfiscate } from "@/api/wmOut/outPunishConfiscate";

export default {
  name: "OutPunishConfiscate",
  data() {
    return {
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
      // 罚没出库信息表格数据
      outPunishConfiscateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        wmOutId: undefined,
        client: undefined,
        cause: undefined,
        wmOutReason: undefined,
        cigaretteQuality: undefined,
        unitCoded: undefined,
        unitName: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        client: [
          { required: true, message: "当事人不能为空", trigger: "blur" }
        ],
        cause: [
          { required: true, message: "案由不能为空", trigger: "blur" }
        ],
        wmOutReason: [
          { required: true, message: "出库原因(返还，移送，转罚没)不能为空", trigger: "blur" }
        ],
        cigaretteQuality: [
          { required: true, message: "烟卷/商品 质量不能为空", trigger: "blur" }
        ],
        unitCoded: [
          { required: true, message: "所属单位编号不能为空", trigger: "blur" }
        ],
        unitName: [
          { required: true, message: "所属单位不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询罚没出库信息列表 */
    getList() {
      this.loading = true;
      listOutPunishConfiscate(this.queryParams).then(response => {
        this.outPunishConfiscateList = response.rows;
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
        wmOutId: undefined,
        client: undefined,
        cause: undefined,
        wmOutReason: undefined,
        cigaretteQuality: undefined,
        unitCoded: undefined,
        unitName: undefined
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
      this.title = "添加罚没出库信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getOutPunishConfiscate(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改罚没出库信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateOutPunishConfiscate(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addOutPunishConfiscate(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除罚没出库信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delOutPunishConfiscate(ids);
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
      this.download('wmOut/outPunishConfiscate/export', {
        ...this.queryParams
      }, `outPunishConfiscate_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
