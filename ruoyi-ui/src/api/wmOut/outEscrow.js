import request from '@/utils/request'

// 查询代管出库信息列表
export function listOutEscrow(query) {
  return request({
    url: '/outEscrow/outEscrow/list',
    method: 'get',
    params: query
  })
}

// 查询代管出库信息详细
export function getOutEscrow(id) {
  return request({
    url: '/outEscrow/outEscrow/' + id,
    method: 'get'
  })
}

// 新增代管出库信息
export function addOutEscrow(data) {
  return request({
    url: '/outEscrow/outEscrow',
    method: 'post',
    data: data
  })
}

// 修改代管出库信息
export function updateOutEscrow(data) {
  return request({
    url: '/outEscrow/outEscrow',
    method: 'put',
    data: data
  })
}

// 删除代管出库信息
export function delOutEscrow(id) {
  return request({
    url: '/outEscrow/outEscrow/' + id,
    method: 'delete'
  })
}
