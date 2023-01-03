import request from '@/utils/request'

// 查询库区信息列表
export function listWhAreaInfo(query) {
  return request({
    url: '/base/whAreaInfo/list',
    method: 'get',
    params: query
  })
}

// 查询库区信息详细
export function getWhAreaInfo(id) {
  return request({
    url: '/base/whAreaInfo/' + id,
    method: 'get'
  })
}
// 查询库区信息详细
export function getWhAreaInfoByWhAreaCoded(query) {
  return request({
    url: '/base/whAreaInfo/getWhAreaInfoByWhAreaCoded',
    method: 'get',
    params: query
  })
}
// 新增库区信息
export function addWhAreaInfo(data) {
  return request({
    url: '/base/whAreaInfo',
    method: 'post',
    data: data
  })
}

// 修改库区信息
export function updateWhAreaInfo(data) {
  return request({
    url: '/base/whAreaInfo',
    method: 'put',
    data: data
  })
}

// 删除库区信息
export function delWhAreaInfo(id) {
  return request({
    url: '/base/whAreaInfo/' + id,
    method: 'delete'
  })
}
