import axios        from 'axios'
import {dlog, Info} from './lib/dlog.js'

function startLoading(req) {
  hGroupBegin('GROUP BEGIN /////////////////////////////////////////////////////////////////////////////////', `'req拦截器 BEGIN'`, 'http.js:5', 0)
  hNormalLog(req.url, `req.url`, 'http.js:66', 0)
  hNormalLog(req.method, `req.method 请求method`, 'http.js:67', 0)
  hNormalLog(req.headers, `req.headers 请求头信息`, 'http.js:68', 0)
  hNormalLog(req.transformRequest, `req.transformRequest`, 'http.js:69', 0)
  hNormalLog(req.transformResponse, `req.transformResponse`, 'http.js:70', 0)
  hNormalLog(req.timeout, `req.timeout`, 'http.js:71', 0)
  // hNormalLog(conf.adapter, `req.adapter`, 'http.js:72', 0)
  hNormalLog(req.xsrfCookieName, `req.xsrfCookieName`, 'http.js:73', 0)
  hNormalLog(req.xsrfHeaderName, `req.xsrfHeaderName`, 'http.js:74', 0)
  hNormalLog(req.maxContentLength, `req.maxContentLength`, 'http.js:75', 0)
  // hNormalLog(conf.validateStatus, `req.validateStatus`, 'http.js:76', 0)
  hGroupEnd('GROUP END \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\', `'req拦截器' END`, 'http.js:77', 0)
}

function endLoading(res) {
  hGroupBegin('GROUP BEGIN /////////////////////////////////////////////////////////////////////////////////', `'res拦截器 BEGIN'`, 'http.js:211', 0)
  hNormalLog(res.config.url, `res.config.url`, 'http.js:210', 0)
  hNormalLog(res.data, `res.data 响应内容`, 'http.js:222', 0)
  hNormalLog(res.status, `res.status 请求响应状态码`, 'http.js:212', 0)
  hNormalLog(res.statusText, `res.statusText 请求响应状态码文本`, 'http.js:213', 0)
  hNormalLog(res.headers, `res.headers 响应头信息`, 'http.js:214', 0)
  hNormalLog(res.config, `res.config 配置信息`, 'http.js:214', 0)
  hNormalLog(res.request, `res.request 请求对象`, 'http.js:216', 0)
  hGroupEnd('GROUP END \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\', `'res拦截信息' END`, 'http.js:217', 0)
}

function errorLoading(error) {
  hGroupBegin('GROUP BEGIN /////////////////////////////////////////////////////////////////////////////////', `'error拦截器 BEGIN'`, 'http.js:551', 1)
  hNormalLog(error.config.url, `error.config.url`, 'http.js:554', 1)
  // hNormalLog(error.stack, `error.stack`, 'http.js:552', 1)
  hNormalLog(error.message, `error.message`, 'http.js:553', 1)
  hNormalLog(error.config, `error.config`, 'http.js:554', 1)
  hNormalLog(error.request, `error.request`, 'http.js:555', 1)
  hNormalLog(error.response, `error.response`, 'http.js:556', 1)
  hNormalLog(error.isAxiosError, `error.isAxiosError`, 'http.js:557', 1)
  hNormalLog(error.toJSON, `error.toJSON`, 'http.js:558', 1)
  hGroupEnd('GROUP END \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\', `'error拦截器' END`, 'http.js:559', 1)
}

// 请求拦截
axios.interceptors.request.use(req => {
  startLoading(req)

  let propertyKeys = Reflect.ownKeys(req)

  for (let i = 0; i < propertyKeys.length; ++i) {
    let propertyKey = propertyKeys[i]
    dlog(req[propertyKey], new Info(`req.${propertyKey}`), 0)
  }

  return req
}, err => {
  errorLoading(err)

  let propertyKeys = Reflect.ownKeys(err)

  for (let i = 0; i < propertyKeys.length; ++i) {
    let propertyKey = propertyKeys[i]
    dlog(err[propertyKey], new Info(`请求request错误 err.${propertyKey}`), 0)
  }

  return Promise.reject(err)
})

// 响应拦截
axios.interceptors.response.use(res => {
  endLoading(res)

  let propertyKeys = Reflect.ownKeys(res)

  for (let i = 0; i < propertyKeys.length; ++i) {
    let propertyKey = propertyKeys[i]
    dlog(res[propertyKey], new Info(`res.${propertyKey}`), 0)
  }

  return res
}, err => {
  // endLoading()
  errorLoading(err)

  // 获取错误状态码
  // let data       = err.response.data
  // let { status } = err.response

  let propertyKeys = Reflect.ownKeys(err)

  for (let i = 0; i < propertyKeys.length; ++i) {
    let propertyKey = propertyKeys[i]
    dlog(err[propertyKey], new Info(`请求响应错误 err.${propertyKey}`), 0)
  }

  return Promise.reject(err)
})

export default axios
