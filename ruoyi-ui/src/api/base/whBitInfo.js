import request from '@/utils/request'

// 查询库位信息列表
export function listWhBitInfo(query) {
  return request({
    url: '/whBitInfo/whBitInfo/list',
    method: 'get',
    params: query
  })
}

// 查询库位信息详细
export function getWhBitInfo(id) {
  return request({
    url: '/whBitInfo/whBitInfo/' + id,
    method: 'get'
  })
}

// 新增库位信息
export function addWhBitInfo(data) {
  return request({
    url: '/whBitInfo/whBitInfo',
    method: 'post',
    data: data
  })
}

// 修改库位信息
export function updateWhBitInfo(data) {
  return request({
    url: '/whBitInfo/whBitInfo',
    method: 'put',
    data: data
  })
}

// 删除库位信息
export function delWhBitInfo(id) {
  return request({
    url: '/whBitInfo/whBitInfo/' + id,
    method: 'delete'
  })
}
// 查询库位编码
export function verifyWhBitCoded(query) {
  return request({
    url: '/whBitInfo/whBitInfo/verifyWhBitCoded',
    method: 'get',
    params: query
  })
}
