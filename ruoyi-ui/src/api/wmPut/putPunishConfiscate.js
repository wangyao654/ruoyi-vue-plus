import request from '@/utils/request'

// 查询罚没入库信息列表
export function listPutPunishConfiscate(query) {
  return request({
    url: '/wmPut/putPunishConfiscate/list',
    method: 'get',
    params: query
  })
}

// 查询罚没入库信息详细
export function getPutPunishConfiscate(id) {
  return request({
    url: '/wmPut/putPunishConfiscate/' + id,
    method: 'get'
  })
}

// 新增罚没入库信息
export function addPutPunishConfiscate(data) {
  return request({
    url: '/wmPut/putPunishConfiscate',
    method: 'post',
    data: data
  })
}

// 修改罚没入库信息
export function updatePutPunishConfiscate(data) {
  return request({
    url: '/wmPut/putPunishConfiscate',
    method: 'put',
    data: data
  })
}

// 删除罚没入库信息
export function delPutPunishConfiscate(id) {
  return request({
    url: '/wmPut/putPunishConfiscate/' + id,
    method: 'delete'
  })
}
// 删除罚没入库信息
export function getPunishConfiscateList(query) {
  return request({
    url: '/wmPut/putPunishConfiscate/getPunishConfiscateList',
    method: 'get',
    params: query
  })
}
// 删除罚没入库信息
export function delPutPunishConfiscateByPutId(id) {
  return request({
    url: '/wmPut/putPunishConfiscate/delPutPunishConfiscateByPutId/' + id,
    method: 'delete'
  })
}

