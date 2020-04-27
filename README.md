# F计划

### 状态管理框架fish-redux

简析两个框架
两个框架的作用是不一样的。

flutter_boost是用来做混合项目栈管理的，由于官方推荐的混合开发多引擎模式会因为创建更多Engine而带来内存激增的问题，所以才有了复用机制的flutter_boost。

fish-redux是用来分治的，旨在将页面模块化，使界面或者条例更加清晰，有一种MVVM那种感觉；

想了解flutter_boost的话，首先要了解一下flutter官方默认的混合方案；

flutter官方默认的混合方案是：多引擎模式，对于连续的Flutter页面（Widget）只需要在当前FlutterActivity打开即可，对于间隔的Flutter页面初始化新的引擎。
字面意思很好理解，如果flutter操作了一系列界面没有涉及到原生和flutter之间的切换，推荐你使用一个渲染引擎即可。如果涉及多层嵌套，推荐你每一个切换点都创建一个flutter engine用来做渲染；
这就会导致如果频繁切换会造成不必要的开销，所以比较考量软件结构涉及与页面路径层级涉及，具有了比较大的限制。
多引擎模式会造成以下几个问题：

1. 内存问题。多引擎下每个引擎之间的isolate是相互独立的。所以没一个引擎底层都维护了图片缓存等比较消耗内存的对象，造成不必要的内存消耗。
2. 资源冗余。每个Flutter实例在基础的platform task runner线程外，都会持有UI / GPU / IO这三个task runner 。多余的flutter实例会导致线程开销变得庞大。
3. 通讯复杂。flutter页面彼此间隔离在自己的isolate中，页面通讯复杂、
4. 插件注册问题。插件依赖Messager传递信息，而messager由flutterNativeView实现。多引擎会导致插件的注册和通信变得混乱且难以维护。

flutter_boost提供的方案：

所有的Flutter页面共享一个Flutter实例(FlutterView)，这种方式能够有效避免多引擎方式带来的各种问题，但是单例的实现也使页面的管理变得更加复杂。
关于flutter_boost的实现大概分为2部分：

1. Native部分
    1.1 Container：native容器，iOS是ViewController，Android是Fragment
    1.2 Container Manager：Native容器管理器
    1.3 Messaging：基于Message Channel的消息通道，负责通信功能
2. Dart部分
    2.1 Container：Flutter widget容器，Flutter navigator路由器
    2.2 Container Manager：Flutter 容器管理器
    2.3 Coordinator：协调器，接收Native Messaging消息，负责调用Container Manager的状态管理

fish-redux的理解首先要理解redux的概念，其实redux的概念并不是新兴的。

Redux最主要是用作应用状态的管理。简言之，Redux用一个单独的常量状态树（对象）保存这一整个应用的状态，这个对象不

能直接被改变。当一些数据变化了，一个新的对象就会被创建（使用actions和reducers）

Redux的核心概念有3个：action reducer store

action：用来传递操作state的信息到store，是store的唯一来源，以对象的形式存在。

reducer：用来处理action，通过传入旧的state和action来指明如何更新state。

store：store是将该类对应的操作聚合；维持应用的State，提供dispatch()更新、getState()获取方法，注册注销监听器等；Redux应用只有一个单一的store

介绍完了Redux，我们来了解一下flutter中fish-redux的一些基本概念。

Fish Redux 是闲鱼团队基于 Redux 做的一次量身改良，通过 Redux 做集中化的可观察的数据管理。

FR 是一个基于 Redux 数据管理的组装式 flutter 应用框架， 特别适用于构建中大型的复杂应用，对于传统 Redux 在使用层面上的两大缺点做了重大改良，

具体做法是：首先规定一个组件需要定义一个数据（Struct）和一个 Reducer，同时组件之间存在着父依赖子的关系。
通过这层依赖关系去解决了 集中 和 分治 之间的矛盾，而对 Reducer 的手动层层 Combine 变成由框架自动完成，使之简化了使用 Redux 的困难，同时也得到了理想的集中的效果和分治的代码。

即一个Page由几部分组成：State Action Reducer Store Middleware，分别做一下简单的介绍：

1. page代表一个页面，继承自 component。它由view（即展示ui的Widget）、state、reducer、effect等组成
2. state用来保存 page/component（页面/组件）的状态，即存放数据。
3. action是我们定义的意图。我们需要处理某些操作或事件时，通过发送（dispatch）特定的 action，让对应action的接收者进行处理。
4. reducer的作用是接收某个意图（action），然后对数据做出修改，即更新状态（state）。Reducer 接受处理的 Action，以 { verb } 命名
5. effect的用法跟 reducer 类似，但是责任不同。他负责处理“副作用”，这是函数式编程的概念。在这里简单地理解为，reducer是负责（state）的更新，effect 负责 state 更新之外的事情。Effect 接受处理的 Action，以 on{ Verb } 命名
6. store维持全局的状态（state），应用只有一个单一的 store 。

### 使用flutter_boost（iOS）

1. 在Dart工程，即Flutter项目中，编辑pubspec.yml。增加flutter_boost的使用，具体install方式，可以去pub.dev的Install拷贝。然后点击pub-get，即可完成插件的下载。
   
```
flutter_boost:
    git:
        url: 'https://github.com/alibaba/flutter_boost.git'
        ref: 'task/task_v1.12.13_support_hotfixes'
```

1. 在创建的有状态的State的class中，重写initState()方法。并在里面注册你的flutter_boost路由，并实现路由跳转方法等。

```
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // 注册页面，每个页面的名称在native端和flutter端需要一致 
    FlutterBoost.singleton.registerPageBuilders({
      'embeded': (pageName, params, _)=>EmbededFirstRouteWidget(),
      'first': (pageName, params, _) => FirstRouteWidget(),
      'firstFirst': (pageName, params, _) => FirstFirstRouteWidget(),
      'second': (pageName, params, _) => SecondRouteWidget(),
      'secondStateful': (pageName, params, _) => SecondStatefulRouteWidget(),
      'tab': (pageName, params, _) => TabRouteWidget(),
      'platformView': (pageName, params, _) => PlatformRouteWidget(),
      'flutterFragment': (pageName, params, _) => FragmentRouteWidget(params),
      ///可以在native层通过 getContainerParams 来传递参数
      'flutterPage': (pageName, params, _) {
        print("flutterPage params:$params");

        return FlutterRouteWidget(params:params);
      },
    });
    FlutterBoost.singleton.addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container(
            color:Colors.white
        ));
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
  }
}

```

1. 使用原生项目混合flutter的官方的混合方式即可，使用源码混合方式，修改podfile如下：可以很轻松的引入Flutter相应的framework

```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# 引入flutter链接
flutter_application_path = '../my_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'iosflutter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iosflutter 将flutter工程产物导入该位置；这种方式就需要在本地有flutter那个项目，每次运行都需要git pull && pod install保证最新
  install_all_flutter_pods(flutter_application_path)
  
  # Basic pods 
end

```

4. 新建一个类，实现flutter_boost的<FLBPlatform>协议，提供一些原生页面与native界面的push、pop和present、dismiss操作；这个类我们可以在flutter_boost的example中看见并根据项目需求加以修改即可。
使用原生的push或present进行界面间跳转操作，如：

```
[self.navigationController presentViewController:vc animated:animated completion:^{
if(completion) completion(YES);
}];
```

使用如下方式获取flutter渲染的界面：

```
FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
[vc setName:name params:params];
```

5. 在AppDelegate中为flutter_boost提供一个跳转路由。其它如原生处理即可。

```
PlatformRouterImp *router = [PlatformRouterImp new];
[FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
onStart:^(FlutterEngine *engine) {
}];
 ```

6. 可以愉快的编写dart代码了。并且可以再原生种进行测试：比如我想进行页面的跳转。就是这么简单。

```
[FlutterBoostPlugin open:@"second" urlParams:@{@"present":@(YES),kPageCallBackId:@"MycallbackId#2"} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary *result) {
    NSLog(@"call me when page finished, and your result is:%@", result);
} completion:^(BOOL f) {
    NSLog(@"page is presented");
}];
```

### 使用fish-redux

 
使用Android Studio可以再plugin下载一个fish-redux插件，可以快速创建dart-redux模板，我们只需要按照需求编辑模板即可。创建模板的方式简单快捷。只需要输入一个Module Name即可。
 
模板创建出来最简单的模块如下：
action.dart
effect.dart
page.dart
reducer.dart
view.dart

1. 通常我们创建一个模板，第一步是实现它的UI，我们在上面介绍过，UI对应的事view.dart

```
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(EntranceState state, Dispatch dispatch, ViewService viewService) {
// return Container();
 return Scaffold(
    appBar: AppBar(
      title: Text('Fish redux'),
      backgroundColor: state.themeColor,
    ),
    body: Container(
      child: Center(
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          color: Colors.green,
          child: Text(
            state.showLabel,
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            // todo 点击事件
// dispatch(EntranceActionCreator.onChangeShowLabel());
 dispatch(EntranceActionCreator.onOpenGrid());
          },
        ),
      ),
    ),
  );
}
```

2. 在state中添加你自己需要的属性及是否继承全局属性等。

```
import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/store/state.dart';

// clone方法，用来获取state,在reducer用会用到来merge state合并状态
class EntranceState implements Cloneable<EntranceState>, GlobalBaseState {

  // 定义一些用到的数据
 String showLabel = '跳转';
  int counter = 10;

  @override
 Color themeColor;

  @override
 EntranceState clone() {
    return EntranceState()
      ..showLabel = showLabel
 ..counter = counter;
  }
}

EntranceState initState(Map<String, dynamic> args) {
  final EntranceState state = EntranceState();
  return state;
}
```

3. 在page中做状态、视图、事件、list驱动器的初始化和绑定操作

```
import 'package:fish_redux/fish_redux.dart';

// 代表一个界面
// 继承自component
// 使用FlutterRedexPlugin可以快速常见redux开发模板

import 'effect.dart'; // 处理副作用，负责state更新之外的事情
import 'reducer.dart'; // 接收action， 然后对数据做出修改，即更新状态(state)
import 'state.dart'; // 保存页面的状态，即存放数据；
import 'view.dart'; // 绘制的基本组件

//
class EntrancePage extends Page<EntranceState, Map<String, dynamic>> {
  EntrancePage()
      : super(
            // 这是三要素
 initState: initState, // 初始化数据存储位置
 effect: buildEffect(), // 初始化除state更新之外的其它事情
 view: buildView, // 基础页面
// reducer: buildReducer(), // 更新state
// dependencies: Dependencies<EntranceState>( // 未知
// adapter: null,
// slots: <String, Dependent<EntranceState>>{
// }),
// middleware: <Middleware<EntranceState>>[ // 页面私有AOP。如果需要
// ],
 );

}
```

4. 在action中使用enum定义时间，并且在ActionCreator中创建对应的action映射方法

```
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum EntranceAction { changeShowLabel, openGrid}

class EntranceActionCreator {
  // 改变showLabel文案的方法，根据我的理解会映射到effect中
 static Action onChangeShowLabel() {
    print('调用修改文本方法onChangeShowLabel');
    return const Action(EntranceAction.changeShowLabel);
  }

  static Action onOpenGrid() {
    return const Action(EntranceAction.openGrid);
  }
}
```

5. 在effect和reducer中对功能进行实现

```
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

// 页面初始化或异步请求这样的事件
// 接收并处理事件
Effect<EntranceState> buildEffect() {
  return combineEffects(<Object, Effect<EntranceState>>{
    EntranceAction.changeShowLabel: _onChangeShowLabel,
    EntranceAction.openGrid: _onOpenGrid,
  });
}

// 接收事件
void _onOpenGrid(Action action, Context<EntranceState> ctx) {
  Navigator.of(ctx.context).pushNamed('grid_page', arguments: null);
}

// 修改方法
void _onChangeShowLabel(Action action, Context<EntranceState> ctx) {
  ctx.state.showLabel = '你好';
}

====== reducer ======
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

// 页面点击修改主题等
Reducer<EntranceState> buildReducer() {
  return asReducer(
    <Object, Reducer<EntranceState>>{
// EntranceAction.changeShowLabel: _onChangeShowLabel
 },
  );
}
```

### 在flutter_boost中使用fish-redux；

```
FlutterBoost.singleton.registerPageBuilders({
        // 在flutter_boost的注册中，将实例方法改为由fish-redux创建的page的buildPage(params)方法。将数据传进去即可在原生中继续使用这种路由映射。
　　'HomePage': (name, params, _) => HomePage().buildPage(params)
})

```
