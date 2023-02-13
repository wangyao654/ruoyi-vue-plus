import request from '@/utils/request'

// 查询抽检返还入库信息列表
export function listPutSampling(query) {
  return request({
    url: '/wmPut/putSampling/list',
    method: 'get',
    params: query
  })
}

// 查询抽检返还入库信息详细
export function getPutSampling(id) {
  return request({
    url: '/wmPut/putSampling/' + id,
    method: 'get'
  })
}

// 新增抽检返还入库信息
export function addPutSampling(data) {
  return request({
    url: '/wmPut/putSampling',
    method: 'post',
    data: data
  })
}

// 修改抽检返还入库信息
export function updatePutSampling(data) {
  return request({
    url: '/wmPut/putSampling',
    method: 'put',
    data: data
  })
}

// 删除抽检返还入库信息
export function delPutSampling(id) {
  return request({
    url: '/wmPut/putSampling/' + id,
    method: 'delete'
  })
}

export function getPutSamplingList(query) {
  return request({
    url: '/wmPut/putSampling/getPutSamplingList',
    method: 'get',
    params: query
  })
}
export function delSamplingByPutId(id) {
  return request({
    url: '/wmPut/putSampling/delSamplingByPutId/' + id,
    method: 'delete'
  })
}
