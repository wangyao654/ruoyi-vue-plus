import request from '@/utils/request'

// 查询商品出库信息列表
export function listOutInfo(query) {
  return request({
    url: '/wmOut/outInfo/list',
    method: 'get',
    params: query
  })
}

// 查询商品出库信息详细
export function getOutInfo(id) {
  return request({
    url: '/wmOut/outInfo/' + id,
    method: 'get'
  })
}

// 新增商品出库信息
export function addOutInfo(data) {
  return request({
    url: '/wmOut/outInfo',
    method: 'post',
    data: data
  })
}

// 修改商品出库信息
export function updateOutInfo(data) {
  return request({
    url: '/wmOut/outInfo',
    method: 'put',
    data: data
  })
}

// 删除商品出库信息
export function delOutInfo(id) {
  return request({
    url: '/wmOut/outInfo/' + id,
    method: 'delete'
  })
}
export function createWmOutCoded(query) {
  return request({
    url: '/wmOut/outInfo/createWmOutCoded',
    method: 'get',
    params: query
  })
}

