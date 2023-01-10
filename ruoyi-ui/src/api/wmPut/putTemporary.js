import request from '@/utils/request'

// 查询暂存入库信息列表
export function listPutTemporary(query) {
  return request({
    url: '/wmPut/putTemporary/list',
    method: 'get',
    params: query
  })
}

// 查询暂存入库信息详细
export function getPutTemporary(id) {
  return request({
    url: '/wmPut/putTemporary/' + id,
    method: 'get'
  })
}

// 新增暂存入库信息
export function addPutTemporary(data) {
  return request({
    url: '/wmPut/putTemporary',
    method: 'post',
    data: data
  })
}

// 修改暂存入库信息
export function updatePutTemporary(data) {
  return request({
    url: '/wmPut/putTemporary',
    method: 'put',
    data: data
  })
}

// 删除暂存入库信息
export function delPutTemporary(id) {
  return request({
    url: '/wmPut/putTemporary/' + id,
    method: 'delete'
  })
}
