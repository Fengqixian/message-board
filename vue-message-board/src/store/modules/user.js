import { login, logout, getInfo } from '@/api/user'
import { getToken, setCookiesToken, setSessionToken, removeToken } from '@/utils/auth'
import { resetRouter } from '@/router'

const getDefaultState = () => {
  return {
    token: getToken(),
    name: '',
    email: '',
    head: ''
  }
}

const state = getDefaultState()

const mutations = {
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_NAME: (state, name) => {
    state.name = name
  },
  SET_EMAIL: (state, email) => {
    state.email = email
  },
  SET_HEAD: (state, head) => {
    state.head = head
  }
}

const actions = {
  // user login
  login({ commit }, userInfo) {
    const { userName, password, rememberMe } = userInfo
    return new Promise((resolve, reject) => {
      login({ userName: userName, password: password, rememberMe: rememberMe }).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.tokenValue)
        if (rememberMe) {
          setCookiesToken(data.tokenValue)
        } else {
          setSessionToken(data.tokenValue)
        }
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // get user info
  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      getInfo(state.token).then(response => {
        const { data } = response
        if (!data) {
          return reject('Verification failed, please Login again.')
        }
        const { userName, email, headPortrait } = data
        commit('SET_NAME', userName)
        commit('SET_EMAIL', email)
        commit('SET_HEAD', headPortrait)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },

  // user logout
  logout({ commit, state }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        removeToken() // must remove  token  first
        resetRouter()
        commit('RESET_STATE')
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      // removeToken() // must remove  token  first
      commit('RESET_STATE')
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

