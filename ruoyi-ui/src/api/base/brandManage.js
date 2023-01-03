import request from '@/utils/request'

// 查询品牌管理/品牌详细信息列表
export function listBrandManage(query) {
  return request({
    url: '/base/brandManage/list',
    method: 'get',
    params: query
  })
}

// 查询品牌管理/品牌详细信息详细
export function getBrandManage(id) {
  return request({
    url: '/base/brandManage/' + id,
    method: 'get'
  })
}

// 新增品牌管理/品牌详细信息
export function addBrandManage(data) {
  return request({
    url: '/base/brandManage',
    method: 'post',
    data: data
  })
}

// 修改品牌管理/品牌详细信息
export function updateBrandManage(data) {
  return request({
    url: '/base/brandManage',
    method: 'put',
    data: data
  })
}

// 删除品牌管理/品牌详细信息
export function delBrandManage(id) {
  return request({
    url: '/base/brandManage/' + id,
    method: 'delete'
  })
}

//校验品牌编号
export function verifyBrandCode(query) {
  return request({
    url: '/base/brandManage/verifyBrandCode',
    method: 'get',
    params: query
  })
}

