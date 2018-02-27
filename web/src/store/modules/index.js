const files = require.context('.', false, /\.js$/)
const modules = {}

files.keys().forEach(key => {
  if (key === './index.js') return
  let namespace = key.replace(/(^\.\/|\.js$)/g, '')
  modules[namespace] = files(key)
})

export default modules
