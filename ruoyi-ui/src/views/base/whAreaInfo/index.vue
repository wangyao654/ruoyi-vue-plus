<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
<!--      <el-form-item label="库区编号" prop="whAreaCoded">
        <el-input
          v-model="queryParams.whAreaCoded"
          placeholder="请输入库区编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item label="库区名称" prop="whAreaName">
        <el-input
          v-model="queryParams.whAreaName"
          placeholder="请输入库区名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="仓库名称" prop="whAreaName">
        <el-input
          v-model="queryParams.whAreaName"
          placeholder="请输入仓库名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="启用状态" prop="whAreaEnabled">
        <el-select v-model="queryParams.whAreaEnabled" placeholder="请选择启用状态" clearable @keyup.enter.native="handleQuery" style="width:100%">
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="时间" prop="betweenTime">
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
          v-hasPermi="['base:whAreaInfo:add']"
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
          v-hasPermi="['base:whAreaInfo:edit']"
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
          v-hasPermi="['base:whAreaInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['base:whAreaInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="whAreaInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
      <el-table-column label="库区编号" align="center" prop="whAreaCoded" />
      <el-table-column label="库区名称" align="center" prop="whAreaName" />
      <el-table-column label="库区类型" align="center" prop="whAreaType" />
      <el-table-column label="所属仓库编号" align="center" prop="warehouseCoded" />
      <el-table-column label="所属仓库名称" align="center" prop="warehouseName" />
      <el-table-column label="库区启用状态" align="center" prop="whAreaEnabled" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.whAreaEnabled"/>
        </template>
      </el-table-column>
      <el-table-column label="操作人" align="center" prop="updateBy" />
      <el-table-column label="更改时间" align="center" prop="updateTime" width="180">
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
            v-hasPermi="['base:whAreaInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['base:whAreaInfo:remove']"
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

    <!-- 添加或修改库区信息对话框 -->
<!--    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库区编号" prop="whAreaCoded">
          <el-input v-model="form.whAreaCoded" placeholder="请输入库区编号" />
        </el-form-item>
        <el-form-item label="库区名称" prop="whAreaName">
          <el-input v-model="form.whAreaName" placeholder="请输入库区名称" />
        </el-form-item>
        <el-form-item label="仓库编号" prop="warehousCoded">
          <el-input v-model="form.warehousCoded" placeholder="请输入归属仓库编号" />
        </el-form-item>
        <el-form-item label="库区启用状态" prop="whAreaEnabled">
          <el-input v-model="form.whAreaEnabled" placeholder="请输入库区启用状态" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>-->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库区编号" prop="whAreaCoded">
          <el-input v-model="form.whAreaCoded" placeholder="请输入库区编号" :disabled="this.ifEdit" />
        </el-form-item>
        <el-form-item label="库区名称" prop="whAreaName">
          <el-input v-model="form.whAreaName" placeholder="请输入库区名称" />
        </el-form-item>
        <el-form-item label="库区类型" prop="whAreaType">
          <el-select v-model="form.whAreaType" placeholder="请选择库区类型" style="width: 100%;"  >
            <el-option
              v-for="dict in dict.type.libraryarea_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属仓库" prop="warehouseName">
          <el-select v-model="form.warehouseName" placeholder="请输入所属仓库" filterable @change="getWarehouseInfo($event)" style="width: 100%;" >
            <el-option
              v-for="dict in this.warehouseList"
              :key="dict.warehouseCoded"
              :label="dict.warehouseName"
              :value="dict.warehouseCoded"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="启用状态" prop="whAreaEnabled">
          <el-select v-model="form.whAreaEnabled" placeholder="请选择库区启用状态"  style="width: 100%">
            <el-option
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
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
import { listWhAreaInfo, getWhAreaInfo, delWhAreaInfo, addWhAreaInfo, updateWhAreaInfo,verifyWhAreaCoded } from "@/api/base/whAreaInfo";
import { listWarehouseInfo} from "@/api/base/warehouseInfo";


export default {
  name: "WhAreaInfo",
  dicts: ['sys_normal_disable','libraryarea_type'],
  data() {
    let whAreaCodedVerify=(rule, value, callback)=>{
      let id = this.form.id;
      if(value){
                let flag=/^([0-9]*)$/
                if(!flag.test(value)){
                  callback(new Error('请输入非0开头的整数！'))
                }
        console.log(value+"1232323")
        verifyWhAreaCoded({whAreaCoded:parseInt(value),id:id}).then(res=>{
          this.verifyWhAreaInfoList=res.data
          if(this.verifyWhAreaInfoList.length>0){
            this.verifyWhAreaInfoList=[];
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
      //校验
      verifyWhAreaInfoList:[],
      // 按钮loading
      buttonLoading: false,
      //修改禁止编号
      ifEdit:false,
      //仓库集合
      warehouseList:[],
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
      // 库区信息表格数据
      whAreaInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        whAreaCoded: undefined,
        whAreaName: undefined,
        whAreaType: undefined,
        warehousCoded: undefined,
        warehouseId: undefined,
        whAreaEnabled: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        whAreaCoded: [
          { required: true, message: "库区编号不能为空", trigger: "blur" },
          { validator:whAreaCodedVerify, trigger: "blur"}
        ],
        whAreaName: [
          { required: true, message: "库区名称不能为空", trigger: "blur" }
        ],
        whAreaType: [
          { required: true, message: "库区类型不能为空", trigger: "change" }
        ],
        warehouseCoded: [
          { required: true, message: "所属仓库编号不能为空", trigger: "blur" }
        ],
        warehouseName: [
          { required: true, message: "所属仓库不能为空", trigger: "blur" }
        ],
        warehouseId: [
          { required: true, message: "归属仓库id不能为空", trigger: "blur" }
        ],
        whAreaEnabled: [
          { required: true, message: "库区启用状态不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "备注不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getWarehouseList();
  },
  methods: {
    /*所属仓库下拉框*/
    getWarehouseList(){
      this.loading = true;
      listWarehouseInfo({pageNum: 1,
        pageSize: 1000}).then(res=>{
        this.warehouseList=res.rows
        this.loading = false;
      })
    },
    /*获取所属仓库信息*/
    getWarehouseInfo: function(event){
     var aa= this.warehouseList.filter(t=>t.warehouseCoded==event);
     this.form.warehouseCoded=event;
     this.form.warehouseName=aa[0].warehouseName;
     this.form.warehouseId=aa[0].id;
     console.log(this.form.warehouseName+"---------------------"+this.form.warehouseCoded);
    },
    /** 查询库区信息列表 */
    getList() {
      this.loading = true;
      listWhAreaInfo(this.queryParams).then(response => {
        this.whAreaInfoList = response.rows;
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
          whAreaCoded: undefined,
          whAreaName: undefined,
          whAreaType: undefined,
          warehouseCoded: undefined,
          warehouseName: undefined,
          warehouseId: undefined,
          whAreaEnabled: undefined,
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
      this.title = "添加库区信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.ifEdit=true;
      this.reset();
      const id = row.id || this.ids
      getWhAreaInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改库区信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateWhAreaInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addWhAreaInfo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除库区信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delWhAreaInfo(ids);
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
      this.download('base/whAreaInfo/export', {
        ...this.queryParams
      }, `whAreaInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
