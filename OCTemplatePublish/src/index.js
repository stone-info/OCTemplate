const execa          = require('execa')
const path           = require('path')
const fs             = require('fs')
const util           = require('util')
const stat           = util.promisify(fs.stat)
const readFile       = util.promisify(fs.readFile)
const { dlog, Info } = require('../lib/dlog')

;(async function () {

  let filePath = path.resolve(__dirname, '../../OCTemplate.podspec')
  let data     = await readFile(filePath, 'utf-8')

  let lastVersion
  {
    let { stdout } = await execa('sed', [
      '-E', '-n', '-e',
      '/^ *spec.version/p',
      filePath,
    ])
    let rList      = stdout.split(/ +/)
    let [r]        = rList.filter(item => /".*"/.test(item))
    let s          = r.replace(/"/g, '')
    let strings    = s.split('.')
    let s1         = strings.pop()
    strings.push(String(parseInt(s1) + 1))
    let s2 = strings.join('.')

    lastVersion = s2
  }

  // 版本 +1
  {
    let { stdout } = await execa('sed', [
      '-i', '',
      '-E', '-e',
      '/^ *spec.version/s/.*/spec.version = "' + lastVersion + '"/g',
      filePath,
    ])
  }

  // 上传 github
  {
    // git add .
    // git commit -m "add repo"
    // git tag 0.0.1
    // git push --tags

    // let stream = execa('bash', [
    //   path.resolve(__dirname, './index.sh'),
    //   lastVersion
    // ]).stdout
    //
    // stream.pipe(process.stdout)
    //
    // stream.on('end', function () {
    //   // 先执行end
    //   dlog(`这么快?`, new Info)
    // })
    //
    // stream.on('close', function () {
    //   // 后执行close
    //   dlog(`结束了?`, new Info)
    // })

    let {stdout} = await execa('bash', [
      path.resolve(__dirname, './index.sh'),
      lastVersion
    ])
    dlog(stdout, new Info(`stdout`), 0)
  }
})()
