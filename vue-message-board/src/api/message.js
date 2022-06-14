import request from '@/utils/request'

export function messageList() {
  return request({
    url: '/api/message/list',
    method: 'get'
  })
}
export function addMessage(data) {
  return request({
    url: '/api/message/add',
    method: 'post',
    data
  })
}

