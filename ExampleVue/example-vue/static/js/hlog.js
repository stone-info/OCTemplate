var colors = [1, 4, 7, 31, 32, 33, 34, 35, 36, 37, 40, 41, 42, 43, 44, 45, 46, 47, 91, 92, 93, 94, 95, 96, 97, 100, 101, 102, 103, 104, 105, 106, 107]

function purePickColor(content, color) {
  return `\x1b[${colors[color]}m${content}\x1b[0m`
}

function hxlog(obj, key, info, color, options = {}) {
  if (options.hasOwnProperty('begin') && options.begin === true) {
    console.group(`${info} :- ${key.replace(/\//g,'')} ${obj.replace(/\//g,'')} ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■`)
  } else if (options.hasOwnProperty('end') && options.end === true) {
    console.groupEnd()
  } else {
    console.log(`${info} :- ${key} = ↓\n'`, obj)
  }
}

function analysisType(type, obj) {
  var r = obj

  if (type === '[object Object]') {
    try {
      r = JSON.stringify(obj, null, 2)
    } catch (err) {
      r = '无法转换成json'
    }
  }

  if (type === '[object String]') {
    r = `"${obj.toString()}"`
  }

  if (type === '[object Array]') {
    // r = `[${obj.toString()}]`
    try {
      r = JSON.stringify(obj, null, 2)
    } catch (err) {
      // r = '无法转换成json'
      r = `[${obj.toString()}]`
    }
  }

  if (type === '[object Storage]') {
    try {
      r = JSON.stringify(obj, null, 2)
    } catch (err) {r = `${obj.toString()}`}
  }
  return r
}

function hlog(obj, key, info, color) {
  // console.log(Object.prototype.toString.call(obj))
  if (window.hasOwnProperty('h5log')) {
    // ctx[@"h5log"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color)
    var type = Object.prototype.toString.call(obj)

    // ■■■ type 判断 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    var r = analysisType(type, obj)
    // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

    var list = info.split(':')

    if (key.length === 0) {
      window.h5log(r, 'anonymous', list[0], list[1], color)
    } else {
      window.h5log(r, key, list[0], list[1], color)
    }
  } else {
    if (key.length === 0) {
      hxlog(obj, 'anonymous', info, color)
    } else {
      hxlog(obj, key, info, color)
    }
  }
}

function hGroupBegin(obj, key, info, color) {
  // console.log(Object.prototype.toString.call(obj))
  if (window.hasOwnProperty('h5GroupBegin')) {
    // ctx[@"h5log"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color)
    var type = Object.prototype.toString.call(obj)
    var r    = analysisType(type, obj)
    var list = info.split(':')

    if (key.length === 0) {
      window.h5GroupBegin(r, 'anonymous', list[0], list[1], color)
    } else {
      window.h5GroupBegin(r, key, list[0], list[1], color)
    }

  } else {
    if (key.length === 0) {
      hxlog(obj, 'anonymous', info, color, { 'begin': true })
    } else {
      hxlog(obj, key, info, color, { 'begin': true })
    }
  }
}

function hGroupEnd(obj, key, info, color) {
  // console.log(Object.prototype.toString.call(obj))
  if (window.hasOwnProperty('h5GroupEnd')) {
    // ctx[@"h5log"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color)
    var type   = Object.prototype.toString.call(obj)
    var result = analysisType(type, obj)
    var list   = info.split(':')

    if (key.length === 0) {
      window.h5GroupEnd(result, 'anonymous', list[0], list[1], color)
    } else {
      window.h5GroupEnd(result, key, list[0], list[1], color)
    }

  } else {
    if (key.length === 0) {
      hxlog(obj, 'anonymous', info, color, { 'end': true })
    } else {
      hxlog(obj, key, info, color, { 'end': true })
    }
  }
}

function hNormalLog(obj, key, info, color) {
  // console.log(Object.prototype.toString.call(obj))
  if (window.hasOwnProperty('h5NormalLog')) {
    var result = obj
    // ctx[@"h5log"] = ^(JSValue *obj, JSValue *key, JSValue *filename, JSValue *lineNumber, JSValue *color)
    var type   = Object.prototype.toString.call(obj)
    var result = analysisType(type, obj)
    var list   = info.split(':')
    if (key.length === 0) {
      window.h5NormalLog(result, 'anonymous', list[0], list[1], color)
    } else {
      window.h5NormalLog(result, key, list[0], list[1], color)
    }

  } else {
    if (key.length === 0) {
      hxlog(obj, 'anonymous', info, color)
    } else {
      hxlog(obj, key, info, color)
    }
  }
}

var oldSetItem = window.localStorage.setItem

window.localStorage.setItem = function (key, value) {
  // try {
  //   var a = {}
  //   a.debug()
  // } catch (ex) {
  //   hlog(ex.stack, `ex.stack`, 'hlog.js:178', 0)
  // }
  // if (k === '你要监听的key') {/* 执行你的逻辑*/}
  hlog(`${key} == ${value}`, `window.localStorage.setItem('${key}', '${value}')`, 'hlog.js:175', 0)
  // console.log(getStackTrace().join('\n'))
  console.trace()
  console.log('【hlog.js:157】-:', Reflect.ownKeys(console))
  oldSetItem.apply(window.localStorage, [key, value])
}

function getStackTrace() {
  var stack
  try {
    throw new Error('')
  } catch (error) {
    stack = error.stack || ''
  }
  stack = stack.split('\n').map(function (line) { return line.trim() })
  return stack.splice(stack[0] == 'Error' ? 2 : 1)
}
