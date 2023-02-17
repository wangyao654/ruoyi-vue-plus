<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
<!--      <el-form-item label="关联文书编号(入库且未结案的文书编号，有效数据筛选)" prop="certificateCodedAssaciation">
        <el-input
          v-model="queryParams.certificateCodedAssaciation"
          placeholder="请输入关联文书编号(入库且未结案的文书编号，有效数据筛选)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item label="出库单号" prop="wmOutCoded">
        <el-input
          v-model="queryParams.wmOutCoded"
          placeholder="请输入出库单号"
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
      <el-form-item label="入库日期" prop="whPutDate">
        <el-date-picker clearable
          v-model="queryParams.whPutDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择入库日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="入库单位" prop="measureUnit">
        <el-input
          v-model="queryParams.measureUnit"
          placeholder="请输入入库单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['outEscrow:outEscrow:add']"
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
          v-hasPermi="['outEscrow:outEscrow:edit']"
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
          v-hasPermi="['outEscrow:outEscrow:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['outEscrow:outEscrow:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="outEscrowList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="60" align="center" />
      <el-table-column label="主键" align="center" prop="id" v-if="false"/>
        <el-table-column label="出库单号" align="center" prop="wmOutCoded" />
        <el-table-column label="文书编号" align="center" prop="certificateCoded" />
        <el-table-column label="关联文书编号" align="center" prop="certificateCodedAssaciation" />
        <el-table-column label="所属单位编号" align="center" prop="unitCoded" />
        <el-table-column label="商品名称" align="center" prop="goodsName" />
        <el-table-column label="商品规格" align="center" prop="goodsSpecification" />
        <el-table-column label="出库数量" align="center" prop="wmOutNumber" />
        <el-table-column label="单据状态" align="center" prop="invoicesStatus" />
        <el-table-column label="出库日期" align="center" prop="wmOutDate" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.wmOutDate, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="入库单位" align="center" prop="measureUnit" />
        <el-table-column label="入库品种数" align="center" prop="varietyNumber" />
        <el-table-column label="入库数" align="center" prop="whPutNumber" />
        <el-table-column label="入库日期" align="center" prop="whPutDate" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.whPutDate, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="保管员" align="center" prop="storekeeper" />
        <el-table-column label="综合管理员" align="center" prop="synthesisKeeper" />
        <el-table-column label="接收人员" align="center" prop="receiver" />
        <el-table-column label="附件" align="center" prop="enclosure" />
        <el-table-column label="出库类型" align="center" prop="outType" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">

        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['outEscrow:outEscrow:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['outEscrow:outEscrow:remove']"
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

    <!-- 添加或修改代管出库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1300px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="8">
            <el-form-item label="出库单号" prop="wmOutCoded">
              <el-input v-model="form.wmOutCoded" placeholder="请输入出库单号" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="入库单位" prop="measureUnit">
              <el-input v-model="form.measureUnit" placeholder="请输入入库单位" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="入库日期" prop="whPutDate">
              <el-date-picker clearable
                              v-model="form.whPutDate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              style="width: 100%"
                              placeholder="请选择入库日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="8">
            <el-form-item label="文书编号" prop="certificateCoded">
              <el-input v-model="form.certificateCoded" placeholder="请输入文书编号" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="商品名称" prop="goodsId">
              <el-select v-model="form.goodsId" placeholder="请选择商品名称" filterable clearable style="width: 100%">
                <el-option
                  v-for="dict in goodsList"
                  :key="dict.id"
                  :label="dict.goodsName"
                  :value="dict.id"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="商品规格" prop="goodsSpecification">
              <el-select v-model="form.goodsSpecification" placeholder="请选择商品规格" clearable style="width: 100%" >
                <el-option
                  v-for="dict in dict.type.goods_specification"
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
              <el-form-item label="所属单位编号" prop="unitCoded">
                <el-input v-model="form.unitCoded" placeholder="请输入所属单位编号"  type="number"/>
              </el-form-item>
            </el-col>
          <el-col :span="8">
            <el-form-item label="入库数" prop="whPutNumber">
              <el-input v-model="form.whPutNumber" placeholder="请输入入库数" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="入库品种数" prop="varietyNumber">
              <el-input v-model="form.varietyNumber" placeholder="请输入入库品种数" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="关联文书编号" prop="certificateCodedAssaciation">
              <el-input v-model="form.certificateCodedAssaciation" placeholder="请输入关联文书编号" />
            </el-form-item>
          </el-col>
        </el-row>




        <el-row>
          <el-col :span="8">
            <el-form-item label="出库数量" prop="wmOutNumber">
              <el-input v-model="form.wmOutNumber" placeholder="请输入出库数量" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="出库日期" prop="wmOutDate">
              <el-date-picker clearable
                              v-model="form.wmOutDate"
                              type="date"
                              style="width: 100%"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择出库日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="接收人员" prop="receiver">
              <el-input v-model="form.receiver" placeholder="请输入接收人员" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="保管员" prop="storekeeper">
              <el-select v-model="storekeeperList" multiple  placeholder="请选择人员"  @change="getStorekeeper" style="width: 100%">
                <el-option
                  v-for="dict in this.keeperUser"
                  :key="dict.userId"
                  :label="dict.userName"
                  :value="dict.userId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="综合管理员" prop="synthesisKeeper">
              <el-select v-model="synthesisKeeperList" multiple placeholder="请选择人员"  @change="getSynthesisKeeper" style="width: 100%">
                <el-option
                  v-for="dict in this.synthesisKeeperUser"
                  :key="dict.userId"
                  :label="dict.userName"
                  :value="dict.userId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOutEscrow, getOutEscrow, delOutEscrow, addOutEscrow, updateOutEscrow } from "@/api/wmOut/outEscrow";
import { listOutInfo, getOutInfo,createWmOutCoded } from "@/api/wmOut/outInfo";
import { getKeeperUser} from "@/api/wmPut/putInfo";
import { getAllGoodsInfoList } from "@/api/base/goodsInfo";
import {listWhBitAll} from "@/api/base/whBitInfo";
import store from '@/store'
export default {
  name: "OutEscrow",
  dicts: ['cause','invoices_status','goods_specification','wm_out_reason','cigarette_quality','out_type'],
  data() {
    return {
      //库位集合
      whBitInfoList:[],
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
      // 代管出库信息表格数据
      outEscrowList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        certificateCodedAssaciation: undefined,
        unitCoded: undefined,
        whPutDate: undefined,
        varietyNumber: undefined,
        wmOutCoded:undefined,
        whPutNumber: undefined,
        measureUnit: undefined,
        betweenTime:undefined,
        startTime:undefined,
        endTime:undefined,
        outType: 2
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        wmOutId: [
          { required: true, message: "代管出库信息id不能为空", trigger: "blur" }
        ],
        certificateCodedAssaciation: [
          { required: true, message: "关联文书编号不能为空", trigger: "blur" }
        ],
        unitCoded: [
          { required: true, message: "所属单位编号不能为空", trigger: "blur" }
        ],
        whPutDate: [
          { required: true, message: "入库日期(代管出库)不能为空", trigger: "blur" }
        ],
        varietyNumber: [
          { required: true, message: "入库品种数(代管出库)不能为空", trigger: "blur" }
        ],
        whPutNumber: [
          { required: true, message: "入库数不能为空", trigger: "blur" }
        ],
        measureUnit: [
          { required: true, message: "入库单位不能为空", trigger: "blur" }
        ],
        wmOutCoded: [
          { required: true, message: "出库单号不能为空", trigger: "blur" }
        ],
        certificateCoded: [
          { required: true, message: "文书编号不能为空", trigger: "blur" }
        ],
        goodsId: [
          { required: true, message: "商品id不能为空", trigger: "blur" }
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
        synthesisKeeper: [
          { required: true, message: "综合管理员不能为空", trigger: "blur" }
        ],
        receiver: [
          { required: true, message: "接收人员不能为空", trigger: "blur" }
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
    this.getGoodsAll();
    this.getUnitRoleUser();
  },
  methods: {
    //获取组织下的角色人员
    getUnitRoleUser(){
      getKeeperUser().then(res=>{
        let obj=res.data;
        this.synthesisKeeperUser =obj[1];
        this.keeperUser=obj[2];
      });
    },
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
      getAllGoodsInfoList({}).then(response=>{
        this.goodsList=response.data;
      })
    },
    /** 查询代管出库信息列表 */
    getList() {
      this.loading = true;
      listOutEscrow(this.queryParams).then(response => {
        this.outEscrowList = response.rows;
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
      this.storekeeperList=[];
      this.synthesisKeeperList=[];
      var userId = this.$store.state.user.userId;
      this.storekeeperList.unshift(parseInt(userId))
    //  this.synthesisKeeperList.unshift(parseInt(userId))
      this.form = {
        id: undefined,
        wmOutId: undefined,
        certificateCodedAssaciation: undefined,
        unitCoded: undefined,
        whPutDate: undefined,
        varietyNumber: undefined,
        whPutNumber: undefined,
        measureUnit: undefined,
        wmOutCoded: undefined,
        certificateCoded: undefined,
        goodsName: undefined,
        goodsId: undefined,
        goodsSpecification: undefined,
        wmOutNumber: undefined,
        invoicesStatus: "0",
        wmOutDate: undefined,
        storekeeper: undefined,
        storekeeperId: undefined,
        synthesisKeeper: undefined,
        synthesisKeeperId: undefined,
        receiver: undefined,
        receiverId: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined,
        enclosure: undefined,
        createBy: undefined,
        outType: 1
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
    /*自动生成出库编号*/
    getWmOutCoded(){
      createWmOutCoded({type:"DO"}).then(res=>{
        this.form.wmOutCoded=res.msg;
      })
    },
    //获取所有库位
    getWhBitList(){
      listWhBitAll({}).then(res=>{
        this.whBitInfoList=res.data;
      })
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.getWmOutCoded();
      this.getWhBitList()
      this.open = true;
      this.title = "添加代管出库信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.reset();
      const id = row.id || this.ids
      getOutEscrow(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.storekeeperList= this.form.storekeeper.split(',')
        this.storekeeperList=this.storekeeperList.map(Number);
/*        this.synthesisKeeperList= this.form.synthesisKeeper.split(",")*/
        this.synthesisKeeperList= this.form.synthesisKeeper.split(",").map(Number);
        this.open = true;
        this.title = "修改代管出库信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updateOutEscrow(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          } else {
            addOutEscrow(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除代管出库信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delOutEscrow(ids);
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
      this.download('wmOut/outEscrow/export', {
        ...this.queryParams
      }, `代管出库_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
