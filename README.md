# OCTemplate

## 每次OCTemplate有改动 , 其他使用这个库的项目 都得 先删除 再重新install, 蛋疼...
## 如果使用 tag 管理, 只要切换版本就可以, 给力...
```ruby
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'SNTest' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!
  # pod 'SNFramework', :git => 'https://github.com/stone-info/OCTemplate.git'
  # Pods for SNTest
  pod 'OCTemplate', :git => 'https://github.com/stone-info/OCTemplate.git',:tag => '0.0.5'
end
```


## Push私有模块工程
## commit整个工程代码
## 打上tag 0.0.1（下节会使用到）
## push到远程私有仓库（Coding）

```bash
git add .
git commit -m "add repo"
git tag 0.0.1
git push --tags
```


## 库工程的版本更新
因为Framework在开发的过程中会不断的更新，从0.0.1到 0.0.2等。

- 此时我们先更新代码，并打上tag，推送到远程仓库
```bash
git add .
git commit -m "update repo"
git tag 0.0.2
git push --tags
```

- 然后修改podspec文件中的version字段
```bash
s.version      = "0.0.2"
```

- 本地验证podspec文件
```bash
pod lib lint
或
pod spec lint
```



- 更新podspec文件到远程仓库
```bash
git add PrivatePodTest.podspec
git commit -m "update podspec"
git push
```

- 删除tag

```bash
git tag -d <tagname>
git push origin :refs/tags/<tagname>
```

