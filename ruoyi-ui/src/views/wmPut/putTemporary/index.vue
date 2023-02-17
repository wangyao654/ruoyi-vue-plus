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
      <el-form-item label="当事人" prop="client">
        <el-input
          v-model="queryParams.client"
          placeholder="请输入当事人"
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
          v-hasPermi="['wmPut:putTemporary:add']"
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
          v-hasPermi="['wmPut:putTemporary:edit']"
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
          v-hasPermi="['wmPut:putTemporary:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['wmPut:putTemporary:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="putTemporaryList" @selection-change="handleSelectionChange">
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
      <el-table-column label="单据状态" align="center" prop="invoicesStatus" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.invoices_status" :value="scope.row.invoicesStatus"/>
        </template>
      </el-table-column>
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
            v-hasPermi="['wmPut:putTemporary:edit']"
          >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="temporaryInfo(scope.row)"
              v-hasPermi="['wmPut:putTemporary:edit']"
            >详细信息</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['wmPut:putTemporary:remove']"
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

    <!-- 添加或修改暂存入库信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1100px" append-to-body :show-close="false">
      <el-steps :active="buzhou">
        <el-step title="步骤 1" description="入库基本信息"></el-step>
        <el-step title="步骤 2" description="暂存扫描入库详细信息"></el-step>
        <el-step title="步骤 3" description="上传附件"></el-step>
      </el-steps>
      <div>
        <p></p>
        <el-form ref="putBaseForm" :model="putBaseForm" :rules="putBaseRules" label-width="110px" v-if="buzhou==1">
          <el-row>
            <el-col :span="8">
              <el-form-item label="入库单号" prop="wmPutCoded">
                <el-input v-model="putBaseForm.wmPutCoded" placeholder="请输入入库单号" :disabled="true" size="mini" />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="文书编号" prop="certificateCoded">
                <el-input v-model="putBaseForm.certificateCoded" placeholder="请输入文书编号" size="mini" />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="入库日期" prop="whPutDate">
                <el-date-picker clearable
                                v-model="putBaseForm.whPutDate"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="请选择入库日期"
                                size="mini"
                style="width: 100%">

                </el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
<!--            <el-col :span="8">
              <el-form-item label="入库品种数" prop="varietyNumber">
                <el-input v-model="putBaseForm.varietyNumber" placeholder="请输入入库品种数" type="number" size="mini"/>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="入库数" prop="whPutNumber">
                <el-input v-model="putBaseForm.whPutNumber" placeholder="请输入入库数" type="number" size="mini"/>
              </el-form-item>
            </el-col>-->
<!--            <el-col :span="8">
              <el-form-item label="存放库位编码" prop="whBitCoded">
                <el-select v-model="putBaseForm.whBitCoded" placeholder="请选择存放库位编码" clearable  @change="whouseAreaCode($event)" size="mini" style="width: 100%">
                  <el-option
                    v-for="dict in this.whBitInfoList"
                    :key="dict.whBitCoded"
                    :label="dict.whBitCoded"
                    :value="dict.whBitCoded"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>-->
            <el-col :span="8">
                <el-form-item label="扣查部门" prop="detainDeptName">
                  <el-input v-model="form.detainDeptName" placeholder="请输入扣查部门" size="mini"/>
                </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="案件类型" prop="causeType">
                <el-select v-model="putBaseForm.causeType" placeholder="请选择案件类型" clearable size="mini" style="width: 100%">
                  <el-option
                    v-for="dict in dict.type.cause_type"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="单据状态" prop="invoicesStatus">
                <el-select v-model="putBaseForm.invoicesStatus" placeholder="请选择单据状态" clearable size="mini" style="width: 100%">
                  <el-option
                    v-for="dict in dict.type.invoices_status"
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
              <el-form-item label="当事人" prop="client">
                <el-input v-model="form.client" placeholder="请输入当事人" size="mini" />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="案由" prop="cause">
                <el-select v-model="form.cause" placeholder="请选择案由"  clearable size="mini" style="width: 100%;">
                  <el-option
                    v-for="dict in dict.type.cause"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="查扣日期" prop="detainDate" size="mini" style="width: 100%;" >
                <el-date-picker clearable
                                v-model="form.detainDate"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="请选择查扣日期">
                </el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="8">
              <el-form-item label="归属单位" prop="unitCoded" size="mini" style="width: 100%;">
                <el-select v-model="form.unitCoded" placeholder="请输入归属单位" >
                  <el-option
                    v-for="dict in this.unitList"
                    :key="dict.unitCoded"
                    :label="dict.unitName"
                    :value="dict.unitCoded"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="查扣部门" prop="detainDeptName" size="mini" style="width: 100%;">
                <el-input v-model="form.detainDeptName" placeholder="请输入部门" size="mini" />
              </el-form-item>
            </el-col>
<!--            <el-col :span="8">
              <el-form-item label="存放库区" prop="whAreaCoded" size="mini">
                <el-input v-model="form.whAreaCoded" placeholder="请输入存放库区" />
              </el-form-item>
            </el-col>-->
          </el-row>

          <el-row>
            <el-col :span="12">
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
            </el-col>
            <el-col :span="12">
              <el-form-item label="综合管理员" prop="synthesisKeeper">
                <el-select v-model="woi.out_type= 2" multiple placeholder="请选择人员" size="mini" @change="getSynthesisKeeper" style="width: 100%">
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
          <el-row>
            <el-col :span="24">
              <el-form-item label="备注" prop="remark" size="mini" style="width: 100%">
                <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>

<!--            <el-col :span="8">
                          <el-form-item label="上传" prop="files">
                            <el-upload
                              ref="uploads"
                              :auto-upload="false"
                            class="upload-demo"
                            action="http://101.205.19.108:8294/MCService/action/addmaterial"
                            :data="editForm"
                            :on-success="upFile"
                            multiple
                            :limit="2"
                            name="files"
                            :on-exceed="handleExceed"
                            :file-list="fileList"
                            >
                            <el-button size="mini" type="primary">点击上传</el-button>
                            </el-upload>
                          </el-form-item>
            </el-col>-->
          </el-row>
        </el-form>
        <!--     暂存入库详细信息 -->
        <el-form ref="form" :model="form" :rules="rules" label-width="110px" v-if="buzhou==2">
          <!--        <el-form-item label="入库信息id-暂存" prop="wmPutId">
                    <el-input v-model="form.wmPutId" placeholder="请输入入库信息id-暂存" />
                  </el-form-item>-->
          <el-row>

          </el-row>
          <el-row>
          <el-col :span="12">
            <el-form-item label="存放库位编码" prop="whBitCoded">
              <el-select v-model="form.whBitCoded" placeholder="请选择存放库位编码" clearable  @change="whouseAreaCode($event)" size="mini" style="width: 100%">
                <el-option
                  v-for="dict in this.whBitInfoList"
                  :key="dict.whBitCoded"
                  :label="dict.whBitName"
                  :value="dict.whBitCoded"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
            <el-col :span="12">
              <el-form-item label="商品条码" prop="barcode"  size="mini" >
                <el-input v-model="form.barcode" placeholder="请输入商品编码"   ref="getFocus" autofocus="autofocus" @change="selectAddInfo"  />
              </el-form-item>
            </el-col>
<!--            <el-col :span="8">
              <el-form-item label="归属单位" prop="unitCoded" size="mini">
                <el-select v-model="form.unitCoded" placeholder="请输入归属单位" >
                  <el-option
                    v-for="dict in this.unitList"
                    :key="dict.unitCoded"
                    :label="dict.unitName"
                    :value="dict.unitCoded"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>-->
          </el-row>
          <el-row>
<!--            <el-col :span="8">
              <el-form-item label="商品编码" prop="goodsCoded"  size="mini">
                <el-input v-model="form.goodsCoded" placeholder="请输入商品编码" :disabled="true" />
              </el-form-item>
            </el-col>-->

            <el-col :span="8">

            </el-col>
          </el-row>

<!--          <el-form-item label="扣查部门id" prop="detainDept">
            <el-input v-model="form.detainDept" placeholder="请输入扣查部门id" />
          </el-form-item>-->
<!--
          <el-form-item label="入库条数" prop="putNumber">
            <el-input v-model="form.putNumber" placeholder="请输入入库条数" />
          </el-form-item>
          </el-form-item>

          <el-form-item label="备注" prop="remark">
            <el-input v-model="form.remark" placeholder="请输入备注" />
          </el-form-item>-->
        </el-form>
        <div v-if="this.buzhou==3">
          <el-upload
            class="upload-demo"
          action="none"
          multiple
          accept=".h5ad"
          :file-list="formOptions.data.addFileList"
          :auto-upload="false"
          >
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          </el-upload>
        </div>
        <div v-if="buzhou==2">
          <el-table v-loading="loading" :data="putTemporaryListZR">
            <el-table-column label="主键" align="center" prop="id" v-if="false"/>
            <el-table-column label="暂存入库信息" align="center" prop="wmPutId" v-if="false" />
            <el-table-column label="入库单号" align="center" prop="wmPutCoded" />
            <el-table-column label="文书编号" align="center" prop="certificateCoded" />
            <el-table-column label="当事人" align="center" prop="client" />
            <el-table-column label="案由" align="center" prop="cause" >
              <template slot-scope="scope">
                <dict-tag :options="dict.type.cause" :value="scope.row.singleBarboxNumber"/>
              </template>
            </el-table-column>
            <el-table-column label="入库数" align="center" prop="whPutNumber" />
            <el-table-column label="案件类型" align="center" prop="causeType" >
              <template slot-scope="scope">
                <dict-tag :options="dict.type.cause_type" :value="scope.row.singleBarboxNumber"/>
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
            <el-table-column label="单据状态" align="center" prop="invoicesStatus" >
              <template slot-scope="scope">
                <dict-tag :options="dict.type.invoices_status" :value="scope.row.invoicesStatus"/>
              </template>
            </el-table-column>
            <el-table-column label="保管员" align="center" prop="storekeeper" />
            <el-table-column label="综合管理员" align="center" prop="synthesisKeeper" />
          </el-table>
        </div>
        <div style="width: 100%; align-content: center" >
          <el-button type="primary" @click="putBaseInfoSubmit" v-if="buzhou!=3" plain><span >下一步</span></el-button>
          <el-button  type="warning" @click="stepSubmit" v-if="buzhou<=3&&buzhou>1" plain><span >上一步</span></el-button>
          <el-button  type="warning" @click="delPutBaseInfo"  plain><span >取消</span></el-button>
          <el-button  type="success" @click="submit" v-if="buzhou==3" plain><span>完成</span></el-button>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPutTemporary, getPutTemporary, delPutTemporary, addPutTemporary, updatePutTemporary,delPutTemporaryByPutId,getPutTemporaryList } from "@/api/wmPut/putTemporary";
import { createWmPutCoded, getKeeperUser, addPutInfo, updatePutInfo,delPutInfo,getPutInfo } from "@/api/wmPut/putInfo";
import {listWhBitAll} from "@/api/base/whBitInfo";
import { listDealingsunitInfo} from "@/api/base/dealingsunitInfo";
import { selectByBarcode } from "@/api/base/goodsInfo";

export default {
  name: "PutTemporary",
  dicts: ['cause','cause_type','invoices_status'],
  data() {
/*    let wmPutCodedVerify=(rule, value, callback)=>{
      let id = this.putBaseForm.id;
      if(value){
        let flag=/^([0-9]*)$/
        if(!flag.test(value)){
          callback(new Error('请输入数字！'))
        }
        console.log(value+"1232323")
        verifyWmPutCoded({wmPutCoded:parseInt(value),id:id}).then(res=>{
          this.verifyWmPutInfoList=res.data
          if(this.verifyWmPutInfoList.length>0){
            this.verifyWmPutInfoList=[];
            callback(new Error('该仓库编号已存在'))
          }else{
            callback()
          }
        })
      }else{
        callback()
      }
    }*/
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
      // 总条数
      totalF: 0,
      // 暂存入库信息表格数据
      putTemporaryList: [],
      putTemporaryListZR:[],
      // 弹出层标题
      title: "",
      //步骤
      buzhou:1,
      // 是否显示弹出层
      open: false,
      infoOpen:false,
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
      //入库基本数据
      putBaseForm: {},
      // 表单参数
      form: {},
      //基础信息校验
      putBaseRules: {
        wmPutCoded: [
          { required: true, message: "入库单号不能为空", trigger: "blur" },
        /*  { validator:wmPutCodedVerify, trigger: "blur"}*/
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
        invoicesStatus: [
          { required: true, message: "单据状态不能为空", trigger: "blur" }
        ],
        storekeeper: [
          { required: true, message: "保管员不能为空", trigger: "blur" }
        ],
        synthesisKeeper: [
          { required: true, message: "综合管理员不能为空", trigger: "blur" }
        ],
        enclosure: [
          { required: true, message: "附件不能为空", trigger: "blur" }
        ],
        wmPutId: [
          { required: true, message: "入库信息id-暂存不能为空", trigger: "blur" }
        ],
        client: [
          { required: true, message: "当事人不能为空", trigger: "blur" }
        ],
        cause: [
          { required: true, message: "案由不能为空", trigger: "blur" }
        ],
        detainDate: [
          { required: true, message: "查扣日期不能为空", trigger: "blur" }
        ],
        detainDeptName: [
          { required: true, message: "扣查部门不能为空", trigger: "blur" }
        ],
/*        detainDept: [
          { required: true, message: "扣查部门id不能为空", trigger: "blur" }
        ],*/
   /*     goodsCoded: [
          { required: true, message: "商品编码不能为空", trigger: "blur" }
        ],*/
        putNumber: [
          { required: true, message: "入库条数不能为空", trigger: "blur" }
        ],
        causeQr: [
          { required: true, message: "案件二维码不能为空", trigger: "blur" }
        ],
        whAreaCoded: [
          { required: true, message: "存放库区不能为空", trigger: "blur" }
        ],
        whBitCoded: [
          { required: true, message: "存放库位不能为空", trigger: "blur" }
        ],
        unitCoded: [
          { required: true, message: "归属单位不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "备注不能为空", trigger: "blur" }
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
    this.getUnitRoleUser();
    this.getUnit();
  },

  methods: {
    //附表路由
    attachedList(row){
      this.$router.push('/putInfo/putTemporary/'+row.wmPutCoded);
    },
    getStorekeeper(value){
      console.log(value)
      this.storekeeperList=value;
      this.putBaseForm.storekeeper=this.storekeeperList.join(",");
    },
    getSynthesisKeeper(value){
      this.synthesisKeeperList=value;
      this.putBaseForm.synthesisKeeper=this.synthesisKeeperList.join(",");
    },
    selectAddInfo(){
      this.buttonLoading = true;
      //查询商品
      selectByBarcode({barcode: this.form.barcode}).then(res=>{
        if(res.code!=200){
          this.$message({
            message: '请扫描商品信息内的商品',
            type: 'warning'
          });
        }else{
          //this.putBaseForm.varietyNumber=this.putBaseForm.varietyNumber+parseInt(res.data.varietyNumber);
          this.putBaseForm.whPutNumber= this.putBaseForm.whPutNumber + parseInt(res.data.whPutNumber);
          //this.form.goodsName=res.data.goodsName
          this.form.goodscoded=res.data.goodsCoded
          //新增入库
          addPutTemporary(this.form).then(response => {
            this.$modal.msgSuccess("新增成功");
          }).finally(() => {
            this.buttonLoading = false;
            this.buzhou=3;
            this.reset();
            //查询最新
            getPutTemporaryList({pageNum: 1, pageSize: 5,}).then(res=>{
              this.putTemporaryListZR = res.rows;
              this.totalF = res.total;
              this.loading = false;
            })
          });
        }
      })
    },
    //获取组织
    getUnit(){
      listDealingsunitInfo({pageNum: 1,
        pageSize: 10000,unitEnabled:'0'}).then(response => {
        this.unitList = response.rows;
      });
    },
    //获取组织下的角色人员
    getUnitRoleUser(){
      getKeeperUser().then(res=>{
        let obj=res.data;
        this.synthesisKeeperUser =obj[1];
        this.keeperUser=obj[2];
      });
    },
    //自动生成入库编号
    getWmPutCoded(){
      createWmPutCoded({type:"ZR"}).then(res=>{
        this.putBaseForm.wmPutCoded=res.msg;
      })
    },
    submit(){
      this.open=false;
    },
    /*取消*/
    delPutBaseInfo(){
      if(this.form.wmPutId!=null&& this.form.wmPutId!=undefined ){
        delPutTemporaryByPutId(parseInt(this.form.wmPutId));
          this.$modal.msgSuccess("删除成功");

      }
    this.open=false;
    this.buzhou=1;
    },
    /*改变仓库 库区信息 */
    whouseAreaCode(event){
      console.log(event)
      this.putBaseForm.whBitCoded=event;
      let valueWhBitInfo= this.whBitInfoList.filter(t=>t.whBitCoded==event);
      this.form.whAreaCoded=valueWhBitInfo[0].whAreaCoded;
      this.form.whBitCoded=event;
    },
    /* 上传文件操作 */
    upFile(res, file) {
      console.log(res);
      if (res.status == 200) {
        // 文件上传成功后的回调，比如一些提示信息或者页面跳转都写在这里
        this.$message.success(res.info);
      } else {
        this.$message.error(res.info);
        let _this = this;
        setTimeout(function() {
          _this.$refs.uploads.clearFiles();
        }, 1000);
      }
    },
    //获取所有库位
    getWhBitList(){
      listWhBitAll({}).then(res=>{
      this.whBitInfoList=res.data;
      })
    },
    getFormData(){
  // 要用FormData来承载文件！这是重点
  const formData = new FormData();
  // 向formData中添加数据
  formData.append('wmPutCoded', String(this.putBaseForm.wmPutCoded));
  formData.append('projectId', String(this.putBaseForm.certificateCoded));
  formData.append('taskName', formOptions.data.taskName);
  formData.append('taskMessage', formOptions.data.taskMessage);
  formData.append('taskType', formOptions.data.taskType);
  formData.append('creationMethod', formOptions.data.creationMethod);

  // formData可以添加同名数据，在获取的时候可根据名称获得所有key为该名称的数据。
  formOptions.data.addFileList.forEach(v => {
    formData.append('addFiles', v.raw)
  })
  return formData;
},
    /*添加入库基本信息*/
    putBaseInfoSubmit(){
      if(this.buzhou==1){
        this.$refs["putBaseForm"].validate(valid => {
          if (valid) {
            this.buttonLoading = true;
            if (this.putBaseForm.id != null) {
              updatePutInfo(this.putBaseForm).then(response => {
                this.$modal.msgSuccess("修改成功");
                // this.open = false;
                this.getList();
              }).finally(() => {
                this.buttonLoading = false;
                this.whBitInfo={};
         /*       this.$nextTick(function () {
                  this.$refs.getFocus.focus();
                });*/
                this.buzhou=2;
               // refs!:mainInput:HTMLInputElementthis.refs.mainInput.focus()
                this.$refs.getFocus[0].focus();
              });
            } else {
              addPutInfo(this.putBaseForm).then(response => {
                this.$modal.msgSuccess("新增成功");
                let id= parseInt(response.data)
                this.form.wmPutId = id ;
                this.putBaseForm.id= id;
                console.log(response.data+"ididididididi")
                //   this.open = false;
                this.getList();
              }).finally(() => {
                this.buttonLoading = false;
                this.$nextTick(function () {
                  this.$refs.getFocus.focus();
                });
                this.buzhou=2;
                //this.$refs.getFocus.focus();
    /*            setTimeout(function() {
                }, 1)*/
                this.whBitInfo={};
              });
            }

          }
        });
      } else if (this.buzhou==2){
        this.submitForm();
      }

    },
    /*返回上一步*/
    stepSubmit(){
      this.buzhou=this.buzhou-1;
    },
    //关闭详细信息
    infoCancel(){
      this.infoOpen=false;
    },
    //展示详细信息
    temporaryInfo(){
    this.infoOpen=true;
    },
    /** 查询暂存入库信息列表 */
    getList() {
      this.loading = true;
      listPutTemporary(this.queryParams).then(response => {
        this.putTemporaryList = response.rows;
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
        this.putBaseForm = {
          id: undefined,
          wmPutCoded: undefined,
          certificateCoded: undefined,
          causeType: undefined,
          whPutDate: undefined,
          varietyNumber: 0,
          whPutNumber: undefined,
          invoicesStatus: undefined,
          storekeeper: undefined,
          synthesisKeeper: undefined,
          createTime: undefined,
          updateBy: undefined,
          updateTime: undefined,
          enclosure: undefined,
          putType:1
        };
        this.resetForm("putBaseForm");
      this.form = {
        id: undefined,
        wmPutId: undefined,
        client: undefined,
        cause: undefined,
        detainDate: undefined,
        detainDeptName: undefined,
        detainDept: undefined,
        goodsCoded: undefined,
        barcode:undefined,
        putNumber: undefined,
        causeQr: undefined,
        whAreaCoded: undefined,
        whBitCoded: undefined,
        unitCoded: undefined,
        remark: undefined
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
      this.getWhBitList()
      this.open = true;
      this.title = "添加暂存入库信息";
      this.getWmPutCoded();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.loading = true;
      this.getWhBitList()
      this.reset();
      const id = row.id || this.ids
      getPutInfo(id).then(response => {
        this.loading = false;
        this.putBaseForm = response.data;
        this.open = true;
        this.title = "修改暂存入库信息";
        /*      getPutTemporary(id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改暂存入库信息";
      });*/
    });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.buttonLoading = true;
          if (this.form.id != null) {
            updatePutTemporary(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
              this.buzhou=3;
              this.whBitInfo={};
            });
          } else {
    /*        addPutTemporary(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
              this.buzhou=3;
              this.whBitInfo={};
            });*/
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除暂存入库信息编号为"' + ids + '"的数据项？').then(() => {
        this.loading = true;
        return delPutTemporaryByPutId(ids);
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
      this.download('wmPut/putTemporary/export', {
        ...this.queryParams
      }, `暂存入库_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
