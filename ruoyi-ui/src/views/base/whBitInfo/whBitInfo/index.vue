<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="库位编号" prop="whBitCoded">
        <el-input
          v-model="queryParams.whBitCoded"
          placeholder="请输入库位编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库位名称" prop="whBitName">
        <el-input
          v-model="queryParams.whBitName"
          placeholder="请输入库位名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库位容量" prop="whBitCapacity">
        <el-input
          v-model="queryParams.whBitCapacity"
          placeholder="请输入库位容量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否专属 " prop="isExclusive">
        <el-input
          v-model="queryParams.isExclusive"
          placeholder="请输入是否专属 "
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属库区编号" prop="whAreaCoded">
        <el-input
          v-model="queryParams.whAreaCoded"
          placeholder="请输入所属库区编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属库区id" prop="whAreaName">
        <el-input
          v-model="queryParams.whAreaName"
          placeholder="请输入所属库区id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属仓库编号" prop="warehouseCoded">
        <el-input
          v-model="queryParams.warehouseCoded"
          placeholder="请输入所属仓库编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属仓库id" prop="warehouseName">
        <el-input
          v-model="queryParams.warehouseName"
          placeholder="请输入所属仓库id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="货架编号" prop="shelfCoded">
        <el-input
          v-model="queryParams.shelfCoded"
          placeholder="请输入货架编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="行号" prop="rowNumber">
        <el-input
          v-model="queryParams.rowNumber"
          placeholder="请输入行号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="列号" prop="columnNumber">
        <el-input
          v-model="queryParams.columnNumber"
          placeholder="请输入列号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库位启用状态" prop="whBitEnabled">
        <el-input
          v-model="queryParams.whBitEnabled"
          placeholder="请输入库位启用状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="对象编号" prop="objectCoded">
        <el-input
          v-model="queryParams.objectCoded"
          placeholder="请输入对象编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="对象名称" prop="objectName">
        <el-input
          v-model="queryParams.objectName"
          placeholder="请输入对象名称"
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
          v-hasPermi="['whBitInfo:whBitInfo:add']"
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
          v-hasPermi="['whBitInfo:whBitInfo:edit']"
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
          v-hasPermi="['whBitInfo:whBitInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['whBitInfo:whBitInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="whBitInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="库位编号" align="center" prop="whBitCoded" />
      <el-table-column label="库位名称" align="center" prop="whBitName" />
      <el-table-column label="库位容量" align="center" prop="whBitCapacity" />
      <el-table-column label="是否专属 " align="center" prop="isExclusive" />
      <el-table-column label="专属类型" align="center" prop="exclusiveType" />
      <el-table-column label="所属库区编号" align="center" prop="whAreaCoded" />
      <el-table-column label="所属库区id" align="center" prop="whAreaName" />
      <el-table-column label="所属仓库编号" align="center" prop="warehouseCoded" />
      <el-table-column label="所属仓库id" align="center" prop="warehouseName" />
      <el-table-column label="库位类型" align="center" prop="whBitType" />
      <el-table-column label="货架编号" align="center" prop="shelfCoded" />
      <el-table-column label="行号" align="center" prop="rowNumber" />
      <el-table-column label="列号" align="center" prop="columnNumber" />
      <el-table-column label="库位启用状态" align="center" prop="whBitEnabled" />
      <el-table-column label="对象编号" align="center" prop="objectCoded" />
      <el-table-column label="对象名称" align="center" prop="objectName" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['whBitInfo:whBitInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['whBitInfo:whBitInfo:remove']"
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

    <!-- 添加或修改库位信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库位编号" prop="whBitCoded">
          <el-input v-model="form.whBitCoded" placeholder="请输入库位编号" />
        </el-form-item>
        <el-form-item label="库位名称" prop="whBitName">
          <el-input v-model="form.whBitName" placeholder="请输入库位名称" />
        </el-form-item>
        <el-form-item label="库位容量" prop="whBitCapacity">
          <el-input v-model="form.whBitCapacity" placeholder="请输入库位容量" />
        </el-form-item>
        <el-form-item label="是否专属 " prop="isExclusive">
          <el-input v-model="form.isExclusive" placeholder="请输入是否专属 " />
        </el-form-item>
        <el-form-item label="所属库区编号" prop="whAreaCoded">
          <el-input v-model="form.whAreaCoded" placeholder="请输入所属库区编号" />
        </el-form-item>
        <el-form-item label="所属库区id" prop="whAreaName">
          <el-input v-model="form.whAreaName" placeholder="请输入所属库区id" />
        </el-form-item>
        <el-form-item label="所属仓库编号" prop="warehouseCoded">
          <el-input v-model="form.warehouseCoded" placeholder="请输入所属仓库编号" />
        </el-form-item>
        <el-form-item label="所属仓库id" prop="warehouseName">
          <el-input v-model="form.warehouseName" placeholder="请输入所属仓库id" />
        </el-form-item>
        <el-form-item label="货架编号" prop="shelfCoded">
          <el-input v-model="form.shelfCoded" placeholder="请输入货架编号" />
        </el-form-item>
        <el-form-item label="行号" prop="rowNumber">
          <el-input v-model="form.rowNumber" placeholder="请输入行号" />
        </el-form-item>
        <el-form-item label="列号" prop="columnNumber">
          <el-input v-model="form.columnNumber" placeholder="请输入列号" />
        </el-form-item>
        <el-form-item label="库位启用状态" prop="whBitEnabled">
          <el-input v-model="form.whBitEnabled" placeholder="请输入库位启用状态" />
        </el-form-item>
        <el-form-item label="对象编号" prop="objectCoded">
          <el-input v-model="form.objectCoded" placeholder="请输入对象编号" />
        </el-form-item>
        <el-form-item label="对象名称" prop="objectName">
          <el-input v-model="form.objectName" placeholder="请输入对象名称" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
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
import { listWhBitInfo, getWhBitInfo, delWhBitInfo, addWhBitInfo, updateWhBitInfo } from "@/api/whBitInfo/whBitInfo";

export default {
  name: "WhBitInfo",
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
      // 库位信息表格数据
      whBitInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        whBitCoded: undefined,
        whBitName: undefined,
        whBitCapacity: undefined,
        isExclusive: undefined,
        exclusiveType: undefined,
        whAreaCoded: undefined,
        whAreaName: undefined,
        warehouseCoded: undefined,
        warehouseName: undefined,
        whBitType: undefined,
        shelfCoded: undefined,
        rowNumber: undefined,
        columnNumber: undefined,
        whBitEnabled: undefined,
        objectCoded: undefined,
        objectName: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        id: [
          { required: true, message: "主键不能为空", trigger: "blur" }
        ],
        whBitCoded: [
          { required: true, message: "库位编号不能为空", trigger: "blur" }
        ],
        whBitName: [
          { required: true, message: "库位名称不能为空", trigger: "blur" }
        ],
        whBitCapacity: [
          { required: true, message: "库位容量不能为空", trigger: "blur" }
        ],
        isExclusive: [
          { required: true, message: "是否专属 不能为空", trigger: "blur" }
        ],
        whAreaCoded: [
          { required: true, message: "所属库区编号不能为空", trigger: "blur" }
        ],
        whAreaName: [
          { required: true, message: "所属库区id不能为空", trigger: "blur" }
        ],
        warehouseCoded: [
          { required: true, message: "所属仓库编号不能为空", trigger: "blur" }
        ],
        warehouseName: [
          { required: true, message: "所属仓库id不能为空", trigger: "blur" }
        ],
        whBitType: [
          { required: true, message: "库位类型不能为空", trigger: "change" }
        ],
        whBitEnabled: [
          { required: true, message: "库位启用状态不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更改时间不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "备注不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询库位信息列表 */
    getList() {
      this.loading = true;
      listWhBitInfo(this.queryParams).then(response => {
        this.whBitInfoList = response.rows;
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
        whBitCoded: undefined,
        whBitName: undefined,
        whBitCapacity: undefined,
        isExclusive: undefined,
        exclusiveType: undefined,
        whAreaCoded: undefined,
        whAreaName: undefined,
        warehouseCoded: undefined,
        warehouseName: undefined,
        whBitType: undefined,
        shelfCoded: undefined,
        rowNumber: undefined,
        columnNumber: undefined,
        whBitEnabled: undefined,
        objectCoded: undefined,
        objectName: undefined,
        updateBy: undefined,
        updateTime: undefined,
        remark: undefined,
        createTime: undefined,
        createBy: undefined
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
      this.title = "添加库位信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getWhBitInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改库位信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateWhBitInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addWhBitInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除库位信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delWhBitInfo(ids);
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
      this.download('whBitInfo/whBitInfo/export', {
        ...this.queryParams
      }, `whBitInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
