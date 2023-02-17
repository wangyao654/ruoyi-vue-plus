import request from '@/utils/request'

// 查询罚没出库信息列表
export function listOutPunishConfiscate(query) {
  return request({
    url: '/wmOut/outPunishConfiscate/list',
    method: 'get',
    params: query
  })
}

// 查询罚没出库信息详细
export function getOutPunishConfiscate(id) {
  return request({
    url: '/wmOut/outPunishConfiscate/' + id,
    method: 'get'
  })
}

// 新增罚没出库信息
export function addOutPunishConfiscate(data) {
  return request({
    url: '/wmOut/outPunishConfiscate',
    method: 'post',
    data: data
  })
}

// 修改罚没出库信息
export function updateOutPunishConfiscate(data) {
  return request({
    url: '/wmOut/outPunishConfiscate',
    method: 'put',
    data: data
  })
}

// 删除罚没出库信息
export function delOutPunishConfiscate(id) {
  return request({
    url: '/wmOut/outPunishConfiscate/' + id,
    method: 'delete'
  })
}
