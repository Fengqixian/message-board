/**
 * Created by PanJiaChen on 16/11/18.
 */

/**
 * @param {string} path
 * @returns {Boolean}
 */
export function isExternal(path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

/**
 * 用户名验证 不可为空，只能使用字母和数字，长度在5~20之间
 * @param {string} str
 * @returns {Boolean}
 */
export function validUsername(str) {
  return /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{5,20}$/.test(str)
}

/**
 * 长度在8~20之间，至少包含一个大写、一个小写、一个数字、一个特殊符号
 * @param {String} str
 * @returns
 */
export function validPassword(str) {
  return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}/.test(str)
}

/**
 * 邮箱验证
 * @param {String} str
 * @returns
 */
export function validEmail(str) {
  return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(str)
}
