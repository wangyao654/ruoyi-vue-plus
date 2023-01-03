import request from '@/utils/request'

// 查询仓库管理列表
export function listWarehouseInfo(query) {
  return request({
    url: '/base/warehouseInfo/list',
    method: 'get',
    params: query
  })
}

// 查询仓库管理详细
export function getWarehouseInfo(id) {
  return request({
    url: '/base/warehouseInfo/' + id,
    method: 'get'
  })
}

// 新增仓库管理
export function addWarehouseInfo(data) {
  return request({
    url: '/base/warehouseInfo',
    method: 'post',
    data: data
  })
}

// 修改仓库管理
export function updateWarehouseInfo(data) {
  return request({
    url: '/base/warehouseInfo',
    method: 'put',
    data: data
  })
}

// 删除仓库管理
export function delWarehouseInfo(id) {
  return request({
    url: '/base/warehouseInfo/' + id,
    method: 'delete'
  })
}
// 校验仓库编号
export function verifyWarehouseCoded(query) {
  return request({
    url: '/base/warehouseInfo/verifyWarehouseCoded',
    method: 'get',
    params: query
  })
}
