var colors = [1, 4, 7, 31, 32, 33, 34, 35, 36, 37, 40, 41, 42, 43, 44, 45, 46, 47, 91, 92, 93, 94, 95, 96, 97, 100, 101, 102, 103, 104, 105, 106, 107]

function purePickColor(content, color) {
  return `\x1b[${colors[color]}m${content}\x1b[0m`
}

function pickColor(content, color, pretty) {

  if (typeof content === 'function') {return content}
  if (typeof content === 'symbol') {return content}
  if (Object.prototype.toString.call(content) === '[object Array]') {
    for (var i = 0; i < content.length; ++i) {
      var contentElement = content[i]
      if (typeof contentElement === 'symbol') {
        return content
      }
    }
  }

  if (Object.prototype.toString.call(content) === '[object Object]') {
    var propertyKeys = Reflect.ownKeys(content)
    for (var i = 0; i < propertyKeys.length; ++i) {
      var propertyKey = propertyKeys[i]
      if (typeof propertyKey === 'symbol') {
        return content
      }
    }
  }

  if (typeof content === 'string') {
    return `\x1b[${colors[color]}m${content}\x1b[0m`
  }

  return content
}

export function hxlog(obj, key, info, color) {
  console.group(purePickColor(`${info}`, 6) + purePickColor(' :- ', 0) + purePickColor(key, 4) + purePickColor(' = ↓\n', 0), obj)
  console.groupEnd()
}
