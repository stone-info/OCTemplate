import {hxlog} from './hxlog.js'

export function hlog(obj, key, info, color) {

  console.log(Object.prototype.toString.call(obj))

  if (window.hasOwnProperty('h5log')) {
    let result = obj
    // ctx[@"h5log"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color)
    let type   = Object.prototype.toString.call(obj)
    if (type === '[object Object]') {
      try {
        result = JSON.stringify(obj, null, 2)
      } catch (err) {
        result = '无法转换成json'
      }
    }
    if (type === '[object String]') {result = obj}
    let list = info.split(':')
    window.h5log(result, key, list[0], list[1], color)
  } else {
    hxlog(obj, key, info, color)
  }
}



