import request from '@/utils/request'

// 查询商品入库信息列表
export function listPutInfo(query) {
  return request({
    url: '/wmPut/putInfo/list',
    method: 'get',
    params: query
  })
}

// 查询商品入库信息详细
export function getPutInfo(id) {
  return request({
    url: '/wmPut/putInfo/' + id,
    method: 'get'
  })
}

// 新增商品入库信息
export function addPutInfo(data) {
  return request({
    url: '/wmPut/putInfo',
    method: 'post',
    data: data
  })
}

// 修改商品入库信息
export function updatePutInfo(data) {
  return request({
    url: '/wmPut/putInfo',
    method: 'put',
    data: data
  })
}

// 删除商品入库信息
export function delPutInfo(id) {
  return request({
    url: '/wmPut/putInfo/' + id,
    method: 'delete'
  })
}
