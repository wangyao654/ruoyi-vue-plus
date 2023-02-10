import request from '@/utils/request'

// 查询代管入库信息列表
export function listPutEscrow(query) {
  return request({
    url: '/wmPut/putEscrow/list',
    method: 'get',
    params: query
  })
}

// 查询代管入库信息详细
export function getPutEscrow(id) {
  return request({
    url: '/wmPut/putEscrow/' + id,
    method: 'get'
  })
}

// 新增代管入库信息
export function addPutEscrow(data) {
  return request({
    url: '/wmPut/putEscrow',
    method: 'post',
    data: data
  })
}

// 修改代管入库信息
export function updatePutEscrow(data) {
  return request({
    url: '/wmPut/putEscrow',
    method: 'put',
    data: data
  })
}

// 删除代管入库信息
export function delPutEscrow(id) {
  return request({
    url: '/wmPut/putEscrow/' + id,
    method: 'delete'
  })
}
