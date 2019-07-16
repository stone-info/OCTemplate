# OCTemplate

## publish
```bash
cd $HOME/git_repository/OCTemplate/OCTemplatePublish/src && node ./publish.js
```

---

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
  pod 'OCTemplate', :git => 'https://github.com/stone-info/OCTemplate.git',:tag => '0.0.6'
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

---

## 增加心新的类的时候 不要忘记到 BuildPhases Headers 中 把文件加入到 pulic中

---

## iOS 详细解释@property和@synthesize关键字 
https://www.cnblogs.com/QM80/p/3576282.html

## iOS 开发中的争议（一）

打算分享一些有争议的话题，并且表达一下我的看法。这是该系列的第一篇，我想讨论的是：类的成员变量应该如何定义？

在 Objective-C 的语言的早期，类的私有成员变量是只能定义在 .h 的头文件里面的。像如下这样：

```objectivec
@interface ViewController : UIViewController {
    @private
    NSInteger _value;
}
```
之后，苹果改进了 Objective-C，允许在 .m 里面添加一个特殊的匿名 Category，即没有名字的 Category，来实现增加类的成员变量。像如下这样：

```objectivec
@interface ViewController ()
@property (nonatomic) NSInteger value;
@end
```
这样的好处是，这些变量在头文件中被彻底隐藏起来了，不用暴露给使用者。

接着，在 2013 年的 WWDC 中，苹果进一步改进了 Objective-C，允许在 .m 的
@implementation 中直接添加类的私有成员变量。像如下这样：

```objectivec
@implementation ViewController {
    NSInteger _value;
}
```
于是，大家对于如何定义私有的成员变量上就产生的分歧。许多人喜欢用匿名的 Category 的方式来定义私有成员变量。但是，我个人更推荐在 @implementation 中直接添加类的私有成员变量。下面我做一些解释。


---

