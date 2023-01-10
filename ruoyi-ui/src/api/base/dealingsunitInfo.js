import request from '@/utils/request'

// 查询来往单位信息列表
export function listDealingsunitInfo(query) {
  return request({
    url: '/base/dealingsunitInfo/list',
    method: 'get',
    params: query
  })
}

// 查询来往单位信息详细
export function getDealingsunitInfo(id) {
  return request({
    url: '/base/dealingsunitInfo/' + id,
    method: 'get'
  })
}

// 新增来往单位信息
export function addDealingsunitInfo(data) {
  return request({
    url: '/base/dealingsunitInfo',
    method: 'post',
    data: data
  })
}

// 修改来往单位信息
export function updateDealingsunitInfo(data) {
  return request({
    url: '/base/dealingsunitInfo',
    method: 'put',
    data: data
  })
}

// 删除来往单位信息
export function delDealingsunitInfo(id) {
  return request({
    url: '/base/dealingsunitInfo/' + id,
    method: 'delete'
  })
}
// 校验编号
export function verifyDealingsUnitCoded(query) {
  return request({
    url: '/base/dealingsunitInfo/verifyDealingsUnitCoded',
    method: 'get',
    params: query
  })
}
