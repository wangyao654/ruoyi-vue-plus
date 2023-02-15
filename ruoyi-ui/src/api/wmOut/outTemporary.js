import request from '@/utils/request'

// 查询暂存出库信息列表
export function listOutTemporary(query) {
  return request({
    url: '/wmOut/outTemporary/list',
    method: 'get',
    params: query
  })
}

// 查询暂存出库信息详细
export function getOutTemporary(id) {
  return request({
    url: '/wmOut/outTemporary/' + id,
    method: 'get'
  })
}

// 新增暂存出库信息
export function addOutTemporary(data) {
  return request({
    url: '/wmOut/outTemporary',
    method: 'post',
    data: data
  })
}

// 修改暂存出库信息
export function updateOutTemporary(data) {
  return request({
    url: '/wmOut/outTemporary',
    method: 'put',
    data: data
  })
}

// 删除暂存出库信息
export function delOutTemporary(id) {
  return request({
    url: '/wmOut/outTemporary/' + id,
    method: 'delete'
  })
}
