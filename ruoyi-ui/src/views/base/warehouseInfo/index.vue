<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="仓库名称" prop="warehouseName">
        <el-input
          v-model="queryParams.warehouseName"
          placeholder="请输入仓库名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="仓库类型" prop="warehouseType">
        <el-select v-model="queryParams.warehouseType" placeholder="请选择仓库类型" clearable @keyup.enter.native="handleQuery" style="width:100%">
          <el-option
            v-for="dict in dict.type.warehouse_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="启用状态" prop="warehouseEnabled">
        <el-select v-model="queryParams.warehouseEnabled" placeholder="请选择启用状态 0-正常 ，1-停用 " clearable @keyup.enter.native="handleQuery" style="width:100%">
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
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
          v-hasPermi="['system:warehouseInfo:add']"
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
          v-hasPermi="['system:warehouseInfo:edit']"
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
          v-hasPermi="['system:warehouseInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:warehouseInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="warehouseInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="仓库编号" align="center" prop="warehouseCoded" />
      <el-table-column label="仓库名称" align="center" prop="warehouseName" />
      <el-table-column label="仓库类型" align="center" prop="warehouseType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.warehouse_type" :value="scope.row.warehouseType"/>
        </template>
      </el-table-column>
      <el-table-column label="仓库归属组织" align="center" prop="warehouseOrganization" />
      <el-table-column label="仓库地址" align="center" prop="warehouseAddress" />
      <el-table-column label="仓库负责人" align="center" prop="warehousePrincipal" />
      <el-table-column label="启用状态" align="center" prop="warehouseEnabled" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.warehouseEnabled"/>
        </template>
      </el-table-column>
      <el-table-column label="最后操作人" align="center" prop="updateBy" />
      <el-table-column label="最后操作时间" align="center" prop="updateTime" width="180">
<!--        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>-->
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:warehouseInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:warehouseInfo:remove']"
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

    <!-- 添加或修改仓库管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="仓库编号" prop="warehouseCoded" >
          <el-input v-model="form.warehouseCoded" placeholder="请输入仓库编号" :disabled="this.ifEdit" />
        </el-form-item>
        <el-form-item label="仓库名称" prop="warehouseName">
          <el-input v-model="form.warehouseName" placeholder="请输入仓库名称" />
        </el-form-item>

        <el-form-item label="仓库地址" prop="warehouseAddress">
          <el-input v-model="form.warehouseAddress" placeholder="请输入仓库地址" />
        </el-form-item>
        <el-form-item label="仓库类型" prop="warehouseType">
          <el-select v-model="form.warehouseType" placeholder="请选择仓库类型"  style="width: 100%">
            <el-option
              v-for="dict in dict.type.warehouse_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="仓库负责人" prop="warehousePrincipal">
          <el-input v-model="form.warehousePrincipal" placeholder="请输入仓库负责人" />
        </el-form-item>
        <el-form-item label="归属组织" prop="warehouseOrganization">
          <el-select v-model="form.warehouseOrganization" placeholder="请选择仓库归属组织" style="width: 100%" >
            <el-option
              v-for="dict in dict.unitList"
              :key="dict.unitCode"
              :label="dict.unitName"
              :value="dict.unitCode"
            ></el-option>
          </el-select>
        </el-form-item>
          <el-form-item label="启用状态" prop="warehouseEnabled">
            <el-select v-model="form.warehouseEnabled" placeholder="请选择启用状态"  style="width:100%">
              <el-option
                v-for="dict in dict.type.sys_normal_disable"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              ></el-option>
            </el-select>
          </el-form-item>

        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" type="textarea" />
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
import { listWarehouseInfo, getWarehouseInfo, delWarehouseInfo, addWarehouseInfo, updateWarehouseInfo,verifyWarehouseCoded } from "@/api/base/warehouseInfo";

export default {
  name: "WarehouseInfo",
  dicts: ['sys_normal_disable','warehouse_type'],
  data() {
    let warehouseCodedVerify=(rule, value, callback)=>{
      let id = this.form.id;
      if(value){
        let flag=/^([1-9][0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入非0开头的整数！'))
        }
        console.log(value+"1232323")
        verifyWarehouseCoded({warehouseCoded:parseInt(value),id:id}).then(res=>{
          this.verifyWarehouseInfoList=res.data
          if(this.verifyWarehouseInfoList.length>0){
            this.verifyWarehouseInfoList=[];
            callback(new Error('该仓库编号已存在'))
          }else{
            callback()
          }
        })
      }else{
        callback()
      }
    }
    return {
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
      // 按钮loading
      buttonLoading: false,
      unitList:undefined,
      //仓库编号是否可编辑
      ifEdit:true,
      //仓库编号校验集合
      verifyWarehouseInfoList:[],
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
      // 仓库管理表格数据
      warehouseInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        warehouseName: undefined,
        warehouseType: undefined,
        startTime:undefined,
        endTime:undefined,
        betweenTime:undefined,
        warehouseEnabled: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        warehouseCoded: [
          { required: true, message: "仓库编号不能为空", trigger: "blur" },
          { validator:warehouseCodedVerify, trigger: "blur"}
        ],
        warehouseName: [
          { required: true, message: "仓库名称不能为空", trigger: "blur" }
        ],
        warehouseType: [
          { required: true, message: "仓库类型不能为空", trigger: "change" }
        ],
        warehouseOrganization: [
          { required: true, message: "仓库归属组织不能为空", trigger: "blur" }
        ],
        warehouseAddress: [
          { required: true, message: "仓库地址不能为空", trigger: "blur" }
        ],
        warehousePrincipal: [
          { required: true, message: "仓库负责人不能为空", trigger: "blur" }
        ],
        warehouseEnabled: [
          { required: true, message: "启用状态不能为空", trigger: "change" }
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
    /** 查询仓库管理列表 */
    getList() {
      this.loading = true;
      listWarehouseInfo(this.queryParams).then(response => {
        this.warehouseInfoList = response.rows;
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
        warehouseCoded: undefined,
        warehouseName: undefined,
        warehouseType: undefined,
        warehouseOrganization: undefined,
        warehouseAddress: undefined,
        warehousePrincipal: undefined,
        warehouseEnabled: undefined,
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
      this.queryParams.pageNum = 1
      let arr=[];
      arr=this.queryParams.betweenTime.toString().split(",")
      this.queryParams.startTime=arr[0]
      this.queryParams.endTime=arr[1];
      this.getList()
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
      this.ifEdit=false;
      this.reset();
      this.open = true;
      this.title = "添加仓库管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.ifEdit=true
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getWarehouseInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改仓库管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateWarehouseInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addWarehouseInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除仓库管理编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delWarehouseInfo(ids);
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
      this.download('system/warehouseInfo/export', {
        ...this.queryParams
      }, `warehouseInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
