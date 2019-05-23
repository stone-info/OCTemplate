# OCTemplate

## 每次OCTemplate有改动 , 其他使用这个库的项目 都得 先删除 再重新install, 蛋疼...
## 如果使用 tag 管理, 只要切换版本就可以, 给力...
```ruby
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'SNTest' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!
  # pod 'SNFramework', :git => 'https://github.com/stone0117/SNFramework.git'
  # Pods for SNTest
  pod 'OCTemplate', :git => 'https://github.com/stone0117/OCTemplate.git'
end
```