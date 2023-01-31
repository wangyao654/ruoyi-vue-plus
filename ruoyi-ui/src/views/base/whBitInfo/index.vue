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
      <el-form-item label="是否专属 " prop="isExclusive">
        <el-select v-model="queryParams.isExclusive" placeholder="请输入是否专属 " clearable @keyup.enter.native="handleQuery">
          <el-option
            v-for="dict in dict.type.is_exclusive"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="归属仓库" prop="warehouseInfo">
        <el-select v-model="queryParams.warehouseInfo" placeholder="请选择所属仓库"  filterable clearable @change="warehouseRules($event)" @keyup.enter.native="handleQuery" style="width:100%">
          <el-option
            v-for="dict in this.warehouseList"
            :key="dict.warehouseCoded"
            :label="dict.warehouseName"
            :value="dict.warehouseName+','+dict.warehouseCoded"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="归属库区" prop="whAreaInfo">
        <el-select v-model="queryParams.whAreaInfo" filterable placeholder="请输入所属库区编号" clearable @change="whAreaRules($event)" @keyup.enter.native="handleQuery" style="width:100%">
          <el-option
            v-for="dict in this.whAreaList"
            :key="dict.whAreaCoded"
            :label="dict.whAreaName"
            :value="dict.whAreaName+','+dict.whAreaCoded"
          ></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="启用状态" prop="whBitEnabled">
        <el-select v-model="queryParams.whBitEnabled" placeholder="请选择启用状态" clearable @keyup.enter.native="handleQuery" style="width:100%">
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
      <el-table-column label="是否专属 " align="center" prop="isExclusive" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.is_exclusive" :value="scope.row.isExclusive"/>
        </template>
      </el-table-column>
      <el-table-column label="专属类型" align="center" prop="exclusiveType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.exclusive_type" :value="scope.row.exclusiveType"/>
        </template>
      </el-table-column>
      <el-table-column label="所属库区编号" align="center" prop="whAreaCoded" />
      <el-table-column label="所属仓库编号" align="center" prop="warehouseCoded" />
      <el-table-column label="库位类型" align="center" prop="whBitType" />
      <el-table-column label="货架编号" align="center" prop="shelfCoded" />
      <el-table-column label="行号" align="center" prop="rowsNumber" />
      <el-table-column label="列号" align="center" prop="columnNumber" />
      <el-table-column label="启用状态" align="center" prop="whBitEnabled" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.whBitEnabled"/>
        </template>
      </el-table-column>
      <el-table-column label="对象编号" align="center" prop="objectCoded" />
      <el-table-column label="对象名称" align="center" prop="objectName" />
      <el-table-column label="最后操作人" align="center" prop="updateBy" />
      <el-table-column label="最后操作时间" align="center" prop="updateTime" width="180"></el-table-column>
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
    <el-dialog :title="title" :visible.sync="open" width="1100px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="8">
            <el-form-item label="库位编号" prop="whBitCoded">
              <el-input v-model="form.whBitCoded" placeholder="请输入库位编号" :disabled="this.ifEdit" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="库位名称" prop="whBitName">
              <el-input v-model="form.whBitName" placeholder="请输入库位名称" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="库位类型 " prop="whBitType">
              <el-select v-model="form.whBitType" placeholder="请选择专属类型 " >
                <el-option
                  v-for="dict in dict.type.wh_bit_type"
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
            <el-form-item label="所属仓库" prop="warehouseInfo">
              <el-select v-model="form.warehouseInfo" placeholder="请选择所属仓库" style="width: 100%" clearable  @change="addEditWarehouseRules($event)">
                <el-option
                  v-for="dict in this.warehouseList1"
                  :key="dict.warehouseCoded"
                  :label="dict.warehouseName"
                  :value="dict.warehouseName+','+dict.warehouseCoded"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="所属库区" prop="whAreaInfo">
              <el-select v-model="form.whAreaInfo" placeholder="请选择所属库区" style="width: 100%" clearable @change="addEditWhAreaRules($event)">
                <el-option
                  v-for="dict in this.whAreaList1"
                  :key="dict.whAreaCoded"
                  :label="dict.whAreaName"
                  :value="dict.whAreaName+','+dict.whAreaCoded"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>

          <el-col :span="8">
            <el-form-item label="是否专属 " prop="isExclusive">
              <el-select v-model="form.isExclusive" placeholder="请输入是否专属 " >
                <el-option
                  v-for="dict in dict.type.is_exclusive"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
          <el-col :span="8">
            <el-form-item label="专属类型 " prop="exclusiveType">
              <el-select v-model="form.exclusiveType" placeholder="请选择专属类型 " >
                <el-option
                  v-for="dict in dict.type.exclusive_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>


        <el-row>

          <el-col :span="8">
            <el-form-item label="库位容量" prop="whBitCapacity">
              <el-input v-model="form.whBitCapacity" placeholder="请输入库位容量" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="货架编号" prop="shelfCoded">
              <el-input v-model="form.shelfCoded" placeholder="请输入货架编号" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="行号" prop="rowsNumber">
              <el-input v-model="form.rowsNumber" placeholder="请输入行号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="列号" prop="columnNumber">
              <el-input v-model="form.columnNumber" placeholder="请输入列号" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="启用状态" prop="whBitEnabled">
              <el-select v-model="form.whBitEnabled" placeholder="请选择启用状态" style="width: 100%" >
                <el-option
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="对象编号" prop="objectCoded">
              <el-input v-model="form.objectCoded" placeholder="请输入对象编号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="对象名称" prop="objectName">
              <el-input v-model="form.objectName" placeholder="请输入对象名称" />
            </el-form-item>
          </el-col>

          </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" type="textarea" />
            </el-form-item>
          </el-col>

        </el-row>






<!--        <el-form-item label="所属库区编号" prop="whAreaCoded">
          <el-input v-model="form.whAreaCoded" placeholder="请输入所属库区编号" />
        </el-form-item>-->
<!--        <el-form-item label="所属仓库编号" prop="warehouseCoded">
          <el-input v-model="form.warehouseCoded" placeholder="请输入所属仓库编号" />
        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listWhBitInfo, getWhBitInfo, delWhBitInfo, addWhBitInfo, updateWhBitInfo,verifyWhBitCoded } from "@/api/base/whBitInfo";
import { listWhAreaInfo,getWhAreaInfoByWhAreaCoded} from "@/api/base/whAreaInfo";
import { listWarehouseInfo} from "@/api/base/warehouseInfo";

export default {
  name: "WhBitInfo",
  dicts: ['sys_normal_disable','is_exclusive','exclusive_type','wh_bit_type'],
  data() {
    let whBitCodedVerify=(rule, value, callback)=>{
      let id = this.form.id;
      if(value){
        let flag=/^([0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入数字！'))
        }
        console.log(value+"1232323")
        verifyWhBitCoded({whBitCoded:parseInt(value),id:id}).then(res=>{
          this.verifyWhBitInfoList=res.data
          if(this.verifyWhBitInfoList.length>0){
            this.verifyWhBitInfoList=[];
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
      verifyWhBitInfoList:[],
      //修改禁止编号
      ifEdit:false,
      //仓库集合
      warehouseList:[],
      warehouseList1:[],
      //库区集合
      whAreaList:[],
      whAreaList1:[],
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
        isExclusive: undefined,
        exclusiveType: undefined,
        whAreaName: undefined,
        warehouseName: undefined,
        whBitType: undefined,
        whBitEnabled: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined,
        warehouseInfo:undefined,
        whAreaInfo:undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
/*        id: [
          { required: true, message: "主键不能为空", trigger: "blur" }
        ],*/
        whBitCoded: [
          { required: true, message: "库位编号不能为空", trigger: "blur" },
          { validator:whBitCodedVerify, trigger: "blur"}
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
        whAreaInfo: [
          { required: true, message: "所属库区 不能为空", trigger: "change" }
        ],
        warehouseInfo: [
          { required: true, message: "所属仓库 不能为空", trigger: "change" }
        ],
/*        whAreaCoded: [
          { required: true, message: "所属库区编号不能为空", trigger: "blur" }
        ],*/
/*        whAreaName: [
          { required: true, message: "所属库区id不能为空", trigger: "blur" }
        ],*/
/*        warehouseCoded: [
          { required: true, message: "所属仓库编号不能为空", trigger: "blur" }
        ],*/
/*        warehouseName: [
          { required: true, message: "所属仓库不能为空", trigger: "blur" }
        ],*/
        whBitType: [
          { required: true, message: "库位类型不能为空", trigger: "change" }
        ],
        whBitEnabled: [
          { required: true, message: "库位启用状态不能为空", trigger: "blur" }
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
    this.getWhAreaList();
  },
  methods: {
    addEditWarehouseRules(event){
      let aa=[];
      aa=event.toString().split(',');
      this.loading = true;
      listWhAreaInfo({pageNum: 1,
        pageSize: 1000,warehouseCoded:aa[1],warehouseName:aa[0]}).then(res=>{
        this.whAreaList1=res.rows
        if(this.form.whAreaInfo){
          if(this.whAreaList1.length>0){
            let s=this.form.whAreaInfo.toString().split(',')
            let b=this.whAreaList1.filter(t=>t.whAreaName==s[0])
            if(b.length<=0){
              this.form.whAreaInfo=undefined;
            }
          }else{
            this.form.whAreaInfo=undefined;
          }
        }
        this.loading = false;
      })
    },
    addEditWhAreaRules(event){
      let aa=[];
      aa=event.toString().split(',');
      this.loading = true;
      debugger
      if(this.warehouseList1){
        getWhAreaInfoByWhAreaCoded({whAreaCoded: aa[1]}).then(response => {
          var d=response.data
            this.form.warehouseInfo = d.warehouseName+","+d.warehouseCoded;
          this.loading = false;
        });
      }
      this.loading = false;
    },
    warehouseRules(event){
      let aa=[];
      aa=event.toString().split(',');
      this.loading = true;
      listWhAreaInfo({pageNum: 1,
        pageSize: 1000,warehouseCoded:aa[1],warehouseName:aa[0]}).then(res=>{
        this.whAreaList=res.rows
        if(this.queryParams.whAreaInfo){
          if(this.whAreaList.length>0){
            let s=this.queryParams.whAreaInfo.toString().split(',')
            let b=this.whAreaList.filter(t=>t.whAreaName==s[0]);
            if(b.length<=0){
              this.queryParams.whAreaInfo=undefined;
            }
          }else{
            this.queryParams.whAreaInfo=undefined;
          }
        }
        this.loading = false;
      })

    },
    whAreaRules(event){
      let aa=[];
      aa=event.toString().split(',');
      this.loading = true;
      if(this.warehouseList){
        getWhAreaInfoByWhAreaCoded({whAreaCoded: aa[1]}).then(response => {
          var d=response.data;
           // let whList=res.rows
            this.queryParams.warehouseInfo = d.warehouseName+","+d.warehouseCoded;
          this.loading = false;
        });
      }
      this.loading = false;

    },
    //获取所有仓库
    getWarehouseList(){
      this.loading = true;
      listWarehouseInfo({pageNum: 1,
        pageSize: 10000,warehouseEnabled:'0'}).then(res=>{
        this.warehouseList=res.rows
        this.warehouseList1=res.rows
        this.loading = false;
      })
    },

    //获取所有库区
    getWhAreaList(){
      this.loading = true;
      listWhAreaInfo({pageNum: 1,
        pageSize: 10000,whAreaEnabled:'0'}).then(res=>{
        this.whAreaList=res.rows
        this.whAreaList1=res.rows
        this.loading = false;
      })
    },
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
        rowsNumber: undefined,
        columnNumber: undefined,
        whBitEnabled: undefined,
        objectCoded: undefined,
        objectName: undefined,
        warehouseInfo:undefined,
        whAreaInfo:undefined,
        remark: undefined,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      let aa=[];
      let a=this.queryParams.warehouseInfo
      if(a!=undefined&&a!=null&&a!=""){
        aa=this.queryParams.warehouseInfo.toString().split(',')
        this.queryParams.warehouseName=aa[0]
      }
      let bb=[];
      let b=this.queryParams.whAreaInfo;
      if(b!=undefined&&b!=null&&b!=""){
        bb=this.queryParams.whAreaInfo.toString().split(',');
        this.queryParams.whAreaName=bb[0]
      }
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
      this.title = "添加库位信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.ifEdit=true;
      this.reset();
      const id = row.id || this.ids
      getWhBitInfo(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.form.warehouseInfo=this.form.warehouseName+","+this.form.warehouseCoded;
        this.form.whAreaInfo=this.form.whAreaName+","+this.form.whAreaCoded;
        this.open = true;
        this.title = "修改库位信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          let aa=this.form.warehouseInfo.toString().split(',');
          this.form.warehouseName=aa[0];
          this.form.warehouseCoded=aa[1];
          let bb=this.form.whAreaInfo.toString().split(',');
          this.form.whAreaName=bb[0];
          this.form.whAreaCoded=bb[1];
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
      this.download('base/whBitInfo/export', {
        ...this.queryParams
      }, `库位信息_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
