import Cookies from 'js-cookie'

const TokenKey = 'message_board_token'
const session = window.sessionStorage

export function getToken() {
  const token = session.getItem(TokenKey)
  if (token !== null) {
    return token
  }
  return Cookies.get(TokenKey)
}

export function setCookiesToken(token) {
  return Cookies.set(TokenKey, token, { expires: 30 })
}

export function removeToken() {
  session.removeItem(TokenKey)
  return Cookies.remove(TokenKey)
}

export function setSessionToken(token) {
  return session.setItem(TokenKey, token)
}
