const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  email: state => state.user.email,
  name: state => state.user.name,
  head: state => state.user.head
}
export default getters
