import request from '@/utils/request'

// 查询商品信息列表
export function listGoodsInfo(query) {
  return request({
    url: '/base/goodsInfo/list',
    method: 'get',
    params: query
  })
}

// 查询商品信息详细
export function getGoodsInfo(id) {
  return request({
    url: '/base/goodsInfo/' + id,
    method: 'get'
  })
}

// 新增商品信息
export function addGoodsInfo(data) {
  return request({
    url: '/base/goodsInfo',
    method: 'post',
    data: data
  })
}

// 修改商品信息
export function updateGoodsInfo(data) {
  return request({
    url: '/base/goodsInfo',
    method: 'put',
    data: data
  })
}

// 删除商品信息
export function delGoodsInfo(id) {
  return request({
    url: '/base/goodsInfo/' + id,
    method: 'delete'
  })
}
//校验商品编号
export function verifyGoodsCoded(query) {
  return request({
    url: '/base/goodsInfo/verifyGoodsCoded',
    method: 'get',
    params: query
  })
}
//生成商品编号
export function createGoodsCoded() {
  return request({
    url: '/base/goodsInfo/createGoodsCoded',
    method: 'get'
  })
}
//根据商品编号查询
export function selectByBarcode(query){
  return request({
    url: '/base/goodsInfo/selectBybarcode',
    method: 'get',
    params:query
  })
}
