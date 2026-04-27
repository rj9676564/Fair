![social preview](resources/social-dark.png)

<p align="center">
  <a href="https://pub.dev/packages/fair"><img src="https://img.shields.io/badge/pub-3.2.1-orange" alt="pub"></a>
  <a href="https://github.com/wuba/fair"><img src="https://img.shields.io/badge/platform-flutter-blue.svg" alt="github"></a>
  <a href="https://fair.58.com/"><img src="https://img.shields.io/badge/doc-fair.58.com-green.svg" alt="doc"></a>
  <a href="https://github.com/wuba/fair/LICENSE"><img src="https://img.shields.io/badge/license-BSD-green.svg" alt="license"></a>
  <a href="https://github.com/wuba/fair/actions"><img src="https://github.com/wuba/fair/workflows/build/badge.svg" alt="build"></a>
  <a href="https://gitter.im/flutter_fair/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge"><img src="https://badges.gitter.im/flutter_fair/community.svg" alt="Gitter"></a>
</p>

[简体中文](README-zh.md)|[English](README.md)

---

Fair是为Flutter设计的动态化框架，通过Fair Compiler工具对原生Dart源文件的自动转化，使项目获得动态更新Widget的能力。

**Fair 的接入和使用，建议大家阅读在线文档:**

> 在线文档：[https://fair.58.com/](https://fair.58.com/)  

**如果您需要热更新平台，可关注Fair Pushy**
> 热更新平台：[FAIR PUSHY](https://github.com/wuba/FairPushy)

![](resources/what-is-fair.png)

Fair的UI渲染是无损的，可以做到像素级别的还原，看一张转义Best Flutter UI Templates部分页面后的效果：

![best-ui-template](resources/best-ui-template.png)

> 使用的工程来自 https://github.com/mitesh77/Best-Flutter-UI-Templates </br>
> 项目位置：/example/lib/best_flutter_ui


## 🏛 架构

![fair architecture](resources/fair.png)

## 🚀 快速接入


简单几步，接入Fair.

**step1：同步fair工程代码**

推荐同步 [fair](https://github.com/wuba/fair) 相关代码，并且进行本地依赖：

同步方式:

```
git clone https://github.com/wuba/fair.git
```

**step2：在 `pubspec.yaml` 添加依赖**

将Fair工程和对应的业务工程放在同一个目录中，并添加依赖:

```yaml
# add Fair dependency
dependencies:
  fair: 3.2.1

# add build_runner and compiler dependency
dev_dependencies:
  build_runner: ^2.0.0
  fair_compiler: ^1.7.0

# switch "fair_version" according to the local Flutter SDK version
# Flutter SDK 3.41.x -> flutter_3_41_0
# Flutter SDK 3.7.x(3.7.0、3.7.1、3.7.2、3.7.3、3.7.4、3.7.5、3.7.6、3.7.7、3.7.8、3.7.9、3.7.10) -> flutter_3_7_0
# Flutter SDK 3.3.x(3.3.0、3.3.1、3.3.2、3.3.3、3.3.4、3.3.5、3.3.6、3.3.7、3.3.8、3.3.9、3.3.10) -> flutter_3_3_0
# Flutter SDK 3.0.x(3.0.0、3.0.1、3.0.2、3.0.3、3.0.4、3.0.5) -> flutter_3_0_0
# Flutter SDK 2.10.x(2.10.0、2.10.1、2.10.2、2.10.3) -> flutter_2_10_0
# Flutter SDK 2.8.x(2.8.0、2.8.1) -> flutter_2_8_0
# Flutter SDK 2.5.x(2.5.0、2.5.1、2.5.2、2.5.3) -> flutter_2_5_0
# Flutter SDK 2.0.6 -> flutter_2_0_6
# Flutter SDK 1.22.6 -> flutter_1_22_6
dependency_overrides:
  fair_version:
    path: ../fair/flutter_version/flutter_3_41_0
```

**step3：将App替换为FairApp**

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FairApp.runApplication(
    _getApp(),
    plugins: {
    },
  );
}

dynamic _getApp() => FairApp(
  modules: {
  },
  delegate: {
  },
  child: MaterialApp(
    home: FairWidget(
            name: 'DynamicWidget',
            path: 'assets/bundle/lib_src_page_dynamic_widget.fair.json',
            data: {"fairProps": json.encode({})}),
  ),
);
```

**step4：添加FairWidget作为动态Widget**

```dart
FairWidget(
name: 'DynamicWidget',
path: 'assets/bundle/lib_src_page_dynamic_widget.fair.json',
data: {"fairProps": json.encode({})}),
```

## 🧰配套工具
fair 开发提效工具
### Dart命令行工具 [faircli](https://pub.dev/packages/faircli)

一键创建fair工程

**faircli安装**
```dart
dart pub global activate faircli
```

**创建动态化工程**
```dart
faircli create -n dynamic_project_name
```
**创建载体工程**
```dart
faircli create -k carrier -n carrier_project_name
```

### IDEA插件 [FairTemplate](https://plugins.jetbrains.com/plugin/20323-fairtemplate)

提供常用页面/组件模板代码

<html>
<img src="resources/fair_template.png" width="80%">
</html>

### 配套工具使用流程
![fair tools](resources/fair_tools.png)

### 配套工具使用效果
使用faircli配置好本地的热更服务后，在移动设备上打开开发者选项，选择本地模式，输入开发机ip，预览fair动态化效果

<html>
<div align="center">
<img src="resources/fair_tools.gif" width="30%">
</div>
</html>

更多介绍请查看 [文档](fair_tools.md)  

## ⚙️fair-online云开发平台
Fair-Online 是面向Flutter 开发者，提供从Flutter 在线开发，到实时编译预览，打包发布、动态下发端侧更新，实现Flutter 线上动态化的一体化云开发平台。

开发者无需配置Flutter 开发环境，在线开发调试代码，即时编译预览，所见即所得，结合58开源团队打造的Flutter 动态化框架 Fair 及热更新平台 FairPushy ，实现Flutter 线上动态化。

<html>
<div align="center">
<img src="./fair_online/fair_online.gif" width="90%">
</div>
</html>


在线体验地址：
[Fair-Online Platform](https://fair-online.58.com/)

更多介绍请查看 [文档](./fair_online/README.md)

## 🔨最近版本

### 3.41.0
更新时间：2026.04.27

- 适配 Flutter 3.41.0，发布 Fair Version 3.41 版本
- 全面支持 Dart 3.x 以及现代 Analyzer 6.x
- 修复了针对已弃用的 Flutter 组件和参数的映射层问题

### 3.10.0
更新时间：2023.08.15

- 适配Flutter 3.10.0，发布 Fair Version 3.10版本
- 修复已知BUG，修复DSL解析器问题

### 3.2.1
更新时间：2023.04.13

- 修复了一些bug.

### 3.2.0
更新时间：2023.04.12

- 调整 dispose 的调用顺序，不在树上面，后续操作停止
- 增加通用FairPlugin的js和dart代码，复用相同的交互逻辑，增加例子注释
- Json解析兼容
- Android中使用V8引擎调用executeFunction时添加异常捕获及日志打印
- 修复 SliverGridDelegateWithFixedCrossAxisCount 转换报错
- SugarMap 和 SugarMapEach 的输入支持其他 Sugar 表达
- 优化 ifEqual  ifEqualBool switchCase 的性能
- 修复 Domain 不识别 sugar 中的 index 和 item
- 让 AOT 也遵循条件达成才执行代码
- 修复 SugarMap 和 SugarMapEach 集合入参不支持其他 Sugar 语法
- 抽象 Domain,增加 IndexDomain、MapEachDomain，支持嵌套 Domain
- 新增 FunctionDomain 通用 Domain，为回调function 生成对应的参数供 FunctionDomain 使用
- 新增 NullableIndexedWidgetBuilder，IndexedWidgetBuilder，WidgetBuilder，TransitionBuilder 常用的 Sugar 支持
- 一些已知问题修复


### 3.1.0
更新时间：2023.03.14

- 升级 analyzer 库到 5.5.0 版本；
- Dart 函数转 JS 支持参数传递；
- JS Object 取值兼容；
- 删除 fair/android 中 kotlin 依赖；
- 添加 IconData 的自定义解析；
- 可选位置参数的生成修改为 pa 获取；
- 修复 OptionalPositional 参数默认值丢失问题；
- 去除 generated.fair.dart 注释中的生成时间；
- 增加 ignore unnecessary_import 操作；
- 修复 Sugar.switchCase key 和 defaultValue 赋值错误问题；
- binding 修改为 SplayTreeMap，增加搜索效率，特别是对于列表，短时间会搜索重复 tag；
- 暴露出 specialBinding 以便用户能重载某个值；
- provider 添加到 _binding 中的时候以用户设置的为准，方便用户快速修正；
- 修复 loadCoreJs package 拼接问题；
- 降低 minSdkVersion 版本到 16；
- runApplication 支持指定 JS 所在的 package；
- 修复 _reload 方法中调用 context 报错问题。

### 3.0.0
更新时间：2022.11.17

- 修复class 构造函数解析异常；
- Fair 兼容 Web 端；
- bindmap 逻辑优化。

### 2.8.1
更新时间：2022.11.01

- 修复 bug：CustomScrollView 引用外部函数构建 builder 报错。

### 2.8.0
更新时间：2022.10.21

- 适配 Flutter SDK 3.3.0+；
- 新增语法糖：Sugar.isNestedScrollViewHeaderSliversBuilder、Sugar.isButtonStyle、Sugar.isDuration、Sugar.popMenuButton、Sugar.sliverChildBuilderDelegate、Sugar.sliverGridDelegateWithFixedCrossAxisCount；
- 修复了一些bug。

### 2.7.0
更新时间：2022.08.10

#### Fair
- 适配 Flutter SDK 3.0.0、3.0.1、3.0.2、3.0.3、3.0.4、3.0.5版本；
- 修复部分已知BUG

### 2.6.0
更新时间：2022.07.05

#### Fair
- 1.Fair 支持加载手机磁盘路径上的 bundle 文件；
- 2.适配 Flutter SDK 2.10.0、2.10.1、2.10.2、2.10.3 版本；
- 3.Dart2JS 支持解析 static 方法；
- 4.运行时，页面错误信息提示优化；
- 5.语法糖支持解析 Model 数据。

### 2.5.0
更新时间：2022.05.31

##### Fair
- 适配 Flutter SDK 2.8.0、2.8.1
- Dart2JS 支持解析单例
- 新增语法糖Sugar.switchCase、Sugar.colorsWithOpacity、Sugar.convertToString等

##### example
全面优化example结构,升级example体验，更适合新手入门。  
在源码中，新增 example 工程，用于提供 Fair API 的标准用法。

example 工程位置：`fair/example`

### 2.4.1
更新时间：2022.05.12

##### Fair
- 修复 FairLogger 文件导包问题
- 升级 analyzer 到 2.3.0

### 2.4.0
更新时间：2022.04.26

##### Fair
- FlatBuffers 支持在 null safe 环境下生成 bin 文件

### 2.3.0
更新时间：2022.04.22

#### Fair
- 支持空安全 null-safe
- 适配Flutter SDK 2.5.0、2.5.1、2.5.2、2.5.3等版本

#### demo
- 升级 sample 工程里过时的demo
- 补充 sample 工程里 iOS 的运行环境

## 🕰2022 规划

* 主版本计划
  * null-safe 版本支持，预计4月22日上线      ✅
  * Flutter 2.8.0版本适配，预计5月中旬上线   ✅
  * Flutter 2.10.0版本适配，预计6月初上线    ✅
  * Flutter 3.0版本适配                   ✅
  * IDE 语法检测和提示插件                  ✅
  * 丰富语法糖                             ✅
* 热更新平台
  * Dart Server工程搭建   ✅
  * Flutter Web工程搭建   ✅
  * 补丁/资源管理          ✅
  * 项目管理               ✅
  * 移动端 Update&Download ✅
* 线上动态化
  * Flutter Web工程搭建   ✅
  * Dart Server工程搭建   ✅
  * Action编辑           ✅
  * 代码编辑              ✅
  * 组件编辑              ✅
  * 页面编辑              ✅
  * 工程编辑              ✅
  * Flutter效果预览       ✅
  * Fair DSL预览         ✅
* IDE插件
  * Fair工程生成          ✅
  * Fair模板生成          ✅
  * Fair语法检测          ✅
  
## 📱接入APP
<table>
  <tr>
    <td align="center"><img src="https://pic3.58cdn.com.cn/nowater/frs/n_v303052b2c3f3b4ea5a5989f5e52d71481.jpg" width="100px;" alt=""/><br /><sub><b>58阿姨</b></sub><br /></td>
    <td align="center"><img src="https://pic5.58cdn.com.cn/nowater/frs/n_v3ba05182f1dc9460dab8e02d22914f700.jpg" width="100px;" alt=""/><br /><sub><b>移动经纪人</b></sub><br /></td>
    <td align="center"><img src="https://pic7.58cdn.com.cn/nowater/frs/n_v35eecf738ac6c4ec992bfc0d1b8d910d4.jpg" width="100px;" alt=""/><br /><sub><b>安居拍房</b></sub><br /></td>
    <td align="center"><img src="https://pic1.58cdn.com.cn/nowater/frs/n_v3b4fd1abf1e484d3da864a177a12a28e2.jpg" width="100px;" alt=""/><br /><sub><b>神奇保</b></sub><br /></td>
    <td align="center"><img src="https://pic6.58cdn.com.cn/nowater/frs/n_v36e650b70b7834204959547bf616869ef.jpg" width="100px;" alt=""/><br /><sub><b>58商办通</b></sub><br /></td>
    <td align="center"><img src="https://pic1.58cdn.com.cn/nowater/frs/n_v378fdb523858b4475b05fb04f66f105ae.jpg" width="100px;" alt=""/><br /><sub><b>58商家版</b></sub><br /></td>
    <td align="center"><img src="https://pic6.58cdn.com.cn/nowater/frs/n_v31394c57d6c234aecad820c94dd1c8dc6.png" width="100px;" alt=""/><br /><sub><b>中华英才网</b></sub><br /></td>
  </tr>
</table>

## ✨️ 贡献者

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="http://blog.hacktons.cn/"><img src="https://avatars.githubusercontent.com/u/1622234?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Wu</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=avenwu" title="Code">💻</a> <a href="https://github.com/wuba/fair/commits?author=avenwu" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/LinLeyang"><img src="https://avatars.githubusercontent.com/u/13174498?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Penta</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=LinLeyang" title="Code">💻</a> <a href="https://github.com/wuba/fair/commits?author=LinLeyang" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/153493932"><img src="https://avatars.githubusercontent.com/u/10431131?v=4?s=100" width="100px;" alt=""/><br /><sub><b>haijun</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=153493932" title="Code">💻</a> <a href="https://github.com/wuba/fair/commits?author=153493932" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/yancechen"><img src="https://avatars.githubusercontent.com/u/19757728?v=4?s=100" width="100px;" alt=""/><br /><sub><b>陈有余</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=yancechen" title="Code">💻</a> <a href="https://github.com/wuba/fair/commits?author=yancechen" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/yyzl0418"><img src="https://avatars.githubusercontent.com/u/14289945?v=4?s=100" width="100px;" alt=""/><br /><sub><b>yangyang</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=yyzl0418" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/wanbing"><img src="https://avatars.githubusercontent.com/u/7804234?v=4?s=100" width="100px;" alt=""/><br /><sub><b>wan</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=wanbing" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/bujiee"><img src="https://avatars.githubusercontent.com/u/16713978?v=4?s=100" width="100px;" alt=""/><br /><sub><b>bujie</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=bujiee" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/windkc"><img src="https://avatars.githubusercontent.com/u/59242966?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kc</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=windkc" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/gongpengyang"><img src="https://avatars.githubusercontent.com/u/11691321?v=4?s=100" width="100px;" alt=""/><br /><sub><b>gongpengyang</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=gongpengyang" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/XIAOYUAOQISHI"><img src="https://avatars.githubusercontent.com/u/25222933?v=4?s=100" width="100px;" alt=""/><br /><sub><b>qixu</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=XIAOYUAOQISHI" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/waynesonic"><img src="https://avatars.githubusercontent.com/u/5502794?v=4?s=100" width="100px;" alt=""/><br /><sub><b>waynesonic</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=waynesonic" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/paozhuanyinyu"><img src="https://avatars.githubusercontent.com/u/16041238?v=4?s=100" width="100px;" alt=""/><br /><sub><b>paozhuanyinyu</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=paozhuanyinyu" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/Alzzzz"><img src="https://avatars.githubusercontent.com/u/19664495?v=4?s=100" width="100px;" alt=""/><br /><sub><b>alzzzz</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=Alzzzz" title="Code">💻</a> <a href="https://github.com/wuba/fair/commits?author=Alzzzz" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/xiangwc"><img src="https://avatars.githubusercontent.com/u/22017021?v=4?s=100" width="100px;" alt=""/><br /><sub><b>xiangwc</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=xiangwc" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/KKProject"><img src="https://avatars.githubusercontent.com/u/14860258?v=4?s=100" width="100px;" alt=""/><br /><sub><b>WangYk</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=KKProject" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/JunZiJianYi"><img src="https://avatars.githubusercontent.com/u/34125737?v=4?s=100" width="100px;" alt=""/><br /><sub><b>SunWei</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=JunZiJianYi" title="Code">💻</a></td>  
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/shanpengtao"><img src="https://avatars.githubusercontent.com/u/7127463?v=4?s=100" width="100px;" alt=""/><br /><sub><b>单鹏涛</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=shanpengtao" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/lswc225"><img src="https://avatars.githubusercontent.com/u/16609338?v=4?s=100" width="100px;" alt=""/><br /><sub><b>lswc225</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=lswc225" title="Code">💻</a></td>
    <td align="center"><a href="http://www.gaofeiyu.com/"><img src="https://avatars.githubusercontent.com/u/6150536?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Goofy</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=gaofeiyu" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/itzhaoqian"><img src="https://avatars.githubusercontent.com/u/23277488?v=4?s=100" width="100px;" alt=""/><br /><sub><b>itzhaoqian</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=itzhaoqian" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/xxliang"><img src="https://avatars.githubusercontent.com/u/5005255?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Sunlight Xie</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=xxliang" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/a303268287"><img src="https://avatars.githubusercontent.com/u/19368353?v=4?s=100" width="100px;" alt=""/><br /><sub><b>lhdycxgghb</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=a303268287" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/hlwhl"><img src="https://avatars.githubusercontent.com/u/7610615?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Prome</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=hlwhl" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/zmtzawqlp"><img src="https://avatars.githubusercontent.com/u/16477333?v=4" width="100px;" alt=""/><br /><sub><b>zmtzawqlp</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=zmtzawqlp" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/hc2088"><img src="https://avatars.githubusercontent.com/u/6659505?v=4?s=100" width="100px;" alt=""/><br /><sub><b>woshixiaohuhu</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=hc2088" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/yukixut"><img src="https://avatars.githubusercontent.com/u/45286155?v=4?s=100" width="100px;" alt=""/><br /><sub><b>yukixut</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=yukixut" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/pearone"><img src="https://avatars.githubusercontent.com/u/23350428?v=4?s=100" width="100px;" alt=""/><br /><sub><b>pearone</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=pearone" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/JOYINF1189"><img src="https://avatars.githubusercontent.com/u/46019591?v=4?s=100" width="100px;" alt=""/><br /><sub><b>JOYINF1189</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=JOYINF1189" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/Blues9527"><img src="https://avatars.githubusercontent.com/u/35455720?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Blues9527</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=Blues9527" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/miserydx"><img src="https://avatars.githubusercontent.com/u/17892391?v=4?s=100" width="100px;" alt=""/><br /><sub><b>miserydx</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=miserydx" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/CindyMini"><img src="https://avatars.githubusercontent.com/u/16411182?v=4?s=100" width="100px;" alt=""/><br /><sub><b>CICI Chan</b></sub></a><br /><a href="https://github.com/wuba/fair/commits?author=CindyMini" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## 👏🏻 支持
Star&Fork 是对我们最大的支持~

[![Stargazers repo roster for @wuba/fair](https://reporoster.com/stars/wuba/fair)](https://github.com/wuba/fair/stargazers)

[![Forkers repo roster for @wuba/fair](https://reporoster.com/forks/wuba/fair)](https://github.com/wuba/fair/network/members)

## 📎相关介绍
* [Flutter动态化框架Fair文档上线&开源倒计时](https://juejin.cn/post/6901600898603024391)
* [Flutter动态化框架Fair的设计与思考](https://juejin.cn/post/6896655572910014478)
* [Fair 2.0 逻辑动态化开源了！](https://mp.weixin.qq.com/s/HtrA2DExSeY9VvtDlTch3w)
* [Fair逻辑动态化架构设计与实现](https://mp.weixin.qq.com/s/Xq5BAa6G8vtgP2SePbj-OQ)
* [Fair逻辑动态化通信实现](https://mp.weixin.qq.com/s/8G5rEXc0ZatBGSXrZXc-4A)
* [Fair下发产物-布局DSL生成原理](https://mp.weixin.qq.com/s/oSsSlYPTATZGzYpX7S9o5Q)
* [Fair 逻辑语法糖设计与实现](https://mp.weixin.qq.com/s/dlQ7Uv7u7VI-xSstmJXcwQ)
* [Fair热更新设计与实现](https://mp.weixin.qq.com/s/X3JBDNnqrsejxEwxSQ9-wg)
* [Fair在安居拍房App中的实践](https://mp.weixin.qq.com/s/0J3nJTuoJrWxjy2p0ks0JQ)
* [Flutter 动态化项目评测](https://mp.weixin.qq.com/s/Vc6YJfLgV93PyB8u_dry2A)
* [Fair 在 58 同城拍客 App 中的实践](https://mp.weixin.qq.com/s/_m6qN2OjbCK8ibBAyb2LYw)


## 🔧一起共建
通过[Issue](https://github.com/wuba/fair/issues)提交问题，贡献代码走Pull Request，管理员将对代码进行审核。

对Fair感兴趣的小伙伴，可以加入交流群。技术咨询、讨论，请移步至

| 微信小秘书                       | 微信群                 |
|--------------------------|--------------------------|
| ![wechat](resources/weixin.jpeg) | ![wechat_group](resources/wechat-group-02.png) |

> 微信入群：请先添加58技术小秘书为好友，备注fair，小秘书邀请进群。


## ⚠️暂不支持功能
由于dart语法解析工作量奇大，会有部分语法和特殊使用方式的限制。
下面是一些，不支持特性&已知问题：
* 链式点语法，如：Colors.black.withOpacity(0.59)，Colors.xxx本身是支持的，但是再次转换透明的则不支持
* 类的继承不支持
  查阅更多不支持内容，请移步至[![Gitter](https://badges.gitter.im/flutter_fair/community.svg)](https://gitter.im/flutter_fair/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)


## 🧯FAQ
**自查步骤（新手必读）**
1. 核对flutter版本与readme说明，确认该版本已被Fair支持
2. 核查version分支版本于flutter一致，且等同于第一步版本号
2. 如果尚未看过[文档](https://fair.58.com)，请先运行自带的sample，能跑起来再接入app
3. 遇到编译错误，请查看终端日志，过滤fair关键词
4. 使用动态化组件的过程中，不建议格式化生成的Javascript文件，格式化工具可能会修改文件内容，导致执行报错
5. 到github提issue，或gitter。留档/解决，并提供flutter环境信息`flutter doctor --verbose`
---

* 为什么没有bin产物？

bin为可选的flatbuffer产物，fair 2期开源了 fairc和dart2js编译转换工具。

* 执行flutter pub run build_runner build后没有产物？

请根据适配要求，核查flutter，dart版本

* 执行flutter pub run build_runner build后，提示编译错误信息？

根据错误日志，有几种情况：1.原代码中存在逻辑表达式，语法解析不通过，尝试剥离逻辑为module；2.`.dart_tool`文件权限问题，请删除后重试

## LICENSE
Fair项目基于[BSD协议](LICENSE)开源。我们使用的更多依赖库详见pubspec.yaml

> 感谢UXD的**Kaibin**老师提供设计支持

