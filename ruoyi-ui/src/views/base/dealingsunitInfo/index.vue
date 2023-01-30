<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="单位编号" prop="unitCoded">
        <el-input
          v-model="queryParams.unitCoded"
          placeholder="请输入单位编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位名称" prop="unitName">
        <el-input
          v-model="queryParams.unitName"
          placeholder="请输入单位名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="启用状态" prop="unitEnabled">
        <el-select v-model="queryParams.unitEnabled" placeholder="请选择启用状态" clearable @keyup.enter.native="handleQuery" style="width: 100%">
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="操作日期" prop="betweenTime">
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
          v-hasPermi="['dealingsunitInfo:dealingsunitInfo:add']"
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
          v-hasPermi="['dealingsunitInfo:dealingsunitInfo:edit']"
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
          v-hasPermi="['dealingsunitInfo:dealingsunitInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['dealingsunitInfo:dealingsunitInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dealingsunitInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="单位编号" align="center" prop="unitCoded" />
      <el-table-column label="单位名称" align="center" prop="unitName" />
      <el-table-column label="单位类型" align="center" prop="unitType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.unit_type" :value="scope.row.unitType"/>
        </template>
      </el-table-column>
      <el-table-column label="联系人" align="center" prop="contactPerson" />
      <el-table-column label="座机号码" align="center" prop="landlineNumber" />
      <el-table-column label="手机号" align="center" prop="phone" />
      <el-table-column label="邮箱" align="center" prop="email" />
      <el-table-column label="单位地址" align="center" prop="unitAddress" />
      <el-table-column label="启用状态" align="center" prop="unitEnabled" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.unitEnabled"/>
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
            v-hasPermi="['dealingsunitInfo:dealingsunitInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['dealingsunitInfo:dealingsunitInfo:remove']"
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

    <!-- 添加或修改来往单位信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="单位编号" prop="unitCoded">
          <el-input v-model="form.unitCoded" placeholder="请输入单位编号" :disabled="this.ifEdit" />
        </el-form-item>
        <el-form-item label="单位名称" prop="unitName">
          <el-input v-model="form.unitName" placeholder="请输入单位名称" />
        </el-form-item>
        <el-form-item label="单位类型" prop="unitType">
          <el-select v-model="form.unitType" placeholder="请选择单位名称" style="width: 100%" >
            <el-option
              v-for="dict in dict.type.unit_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="联系人" prop="contactPerson">
          <el-input v-model="form.contactPerson" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="座机号码" prop="landlineNumber">
          <el-input v-model="form.landlineNumber" placeholder="请输入座机号码" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="单位地址" prop="unitAddress">
          <el-input v-model="form.unitAddress" placeholder="请输入单位地址" />
        </el-form-item>
        <el-form-item label="启用状态" prop="unitEnabled">
          <el-select v-model="form.unitEnabled" placeholder="请选择启用状态" style="width: 100%">
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
import { listDealingsunitInfo, getDealingsunitInfo, delDealingsunitInfo, addDealingsunitInfo, updateDealingsunitInfo,verifyDealingsUnitCoded} from "@/api/base/dealingsunitInfo";

export default {
  name: "DealingsunitInfo",
  dicts: ['sys_normal_disable','unit_type'],
  data() {
    let DealingsUnitCodedVerify=(rule, value, callback)=>{
      let id = this.form.id;
      if(value){
        let flag=/^([0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入数字！'))
        }
        console.log(value+"1232323")
        verifyDealingsUnitCoded({unitCoded:parseInt(value),id:id}).then(res=>{
          this.verifyDealingsUnitList=res.data
          if(this.verifyDealingsUnitList.length>0){
            this.verifyDealingsUnitList=[];
            callback(new Error('该单位编号已存在'))
          }else{
            callback()
          }
        })
      }else{
        callback()
      }
    }
    let phoneVerify=(rule, value, callback)=>{
      let reg = /^1[0-9]{10}$/
      if(value){
        if (!reg.test(value)) {
          callback(new Error('手机号格式错误'))
        } else {
          callback();
        }
      }else {
        callback();
      }

    }
    let landlineNumberVerify=(rule, value, callback)=>{
      let reg = /^\d{3,4}[-]\d{8}$/
        if(value){
          if (!reg.test(value)) {
            callback(new Error('座机格式错误'))
          } else {
            callback();
          }
        }else {
          callback();
        }

    }
    let emailVerify=(rule, value, callback)=>{
      let reg = /^[a-zA-Z0-9][a-zA-Z0-9_]+\@[a-zA-Z0-9]+\.[a-zA-Z]{2,5}(\.[a-zA-Z]{2,5})*$/i
      if(value){
        if (!reg.test(value)) {
          callback(new Error('邮箱格式错误'))
        } else {
          callback();
        }
      }else {
        callback();
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
      //校验
      verifyDealingsUnitList:[],
      //修改禁止编号
      ifEdit:false,
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
      // 来往单位信息表格数据
      dealingsunitInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        unitCoded: undefined,
        unitName: undefined,
        unitType: undefined,
        unitEnabled: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        unitCoded: [
          { required: true, message: "单位编号不能为空", trigger: "blur" },
          { validator:DealingsUnitCodedVerify, trigger: "blur"}
        ],
        unitName: [
          { required: true, message: "单位名称不能为空", trigger: "blur" }
        ],
        unitType: [
          { required: true, message: "单位类型不能为空", trigger: "change" }
        ],
/*        landlineNumber: [
          { validator:landlineNumberVerify, trigger: "blur"}
        ],*/
        phone: [
          { validator:phoneVerify, trigger: "blur"}
        ],
/*        email: [
          { validator:emailVerify, trigger: "blur"}
        ],*/
        unitEnabled: [
          { required: true, message: "启用状态不能为空", trigger: "blur" }
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
    /** 查询来往单位信息列表 */
    getList() {
      this.loading = true;
      listDealingsunitInfo(this.queryParams).then(response => {
        this.dealingsunitInfoList = response.rows;
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
        unitCoded: undefined,
        unitName: undefined,
        unitType: undefined,
        contactPerson: undefined,
        landlineNumber: undefined,
        phone: undefined,
        email: undefined,
        unitAddress: undefined,
        unitEnabled: undefined,
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
      this.title = "添加来往单位信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.ifEdit=true;
      this.reset();
      const id = row.id || this.ids
      getDealingsunitInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改来往单位信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateDealingsunitInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addDealingsunitInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除来往单位信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delDealingsunitInfo(ids);
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
      this.download('dealingsunitInfo/dealingsunitInfo/export', {
        ...this.queryParams
      }, `dealingsunitInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
