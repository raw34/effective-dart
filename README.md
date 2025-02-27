<p align="center">
                <img src="https://jaywcjlove.github.io/sb/lang/chinese.svg" />
		<img src="https://img.shields.io/badge/ComputerLanguage-dartlang-green.svg?style=flat-square"/>
		<img src="https://img.shields.io/badge/status-WIP-red.svg?style=flat-square"/>
		<a href="www.chenleiblogs.com"><img src="https://img.shields.io/badge/author-@iChenLei-green.svg?style=flat-square"/></a>
		<img src="https://img.shields.io/badge/welcome-contributing-blue.svg?style=flat-square"/>
</p>

| Ⅰ | Ⅱ | Ⅲ | Ⅳ | 
| :--------: | :---------: | :---------: | :---------: |
| [Style Guide](style.md):nail_care: | [Usage Guide](usage.md):bookmark:|[Documentation Guide](documentation.md):page_with_curl: | [Design Guide](design.md):gem: |

### What is the project ?
```dart
	// dart language 
	void main() {
		Map repo = new Map()
		  ..addAll({'name':'Effective Dart 中文版'})
		  ..addAll({'author':'雷仔'})
                  ..allAll({'lang':'中文'})
		  ..adddAll({'status':'work in progress'});
		print(repo);
	}
```
## Table of contents
## 🔥 Effective Dart: Style 🔥  

1. **标识符命名**  
    - [要] [类型命名使用大写驼峰风格](style.md#1-1)  
    - [要] [库个源文件命名使用小写加下划线风格](style.md#1-2)  
    - [要] [import前缀命名使用小写加下划线风格](style.md#1-3)  
    - [要] [其他命名使用小写驼峰风格](style.md#1-4)  
    - [推荐] [常量命名使用小写驼峰风格](style.md#1-5)  
    - [要]  [缩略词大写](style.md#1-6)  
    - [不要] [不要使用前缀字符](style.md#1-7)  
2. **代码顺序** 
    - [要] [将`dart:xx`导入代码放在其他导入之前](style.md#2-1)
    - [要] [将`package:xx`导入代码放在相对文件导入之前](style.md#2-2)  
    - [推荐] [将自己的包的引入代码放在其他三方包引入之后](style.md#2-3)  
    - [要] [导出代码应该放在所有导入代码之后](style.md#2-4) 
    - [要] [同一类导入代码顺序根据文件或者包名的首字母排序](style.md#2-5) 
3. **格式化**      
    - [要] [使用`dartfmt`工具格式化你的代码](style.md#3-1)  
    - [考虑] [修改你的代码使之变得对格式化工具友好](style.md#3-2)  
    - [避免] [单行代码不超过80个字符](style.md#3-3)  
    - [要] [使用大括号包裹你的控制流结构](style.md#3-4)

### Effective Dart: Usage

- 库
    - [要] [`part of`指令之后使用字符串](usage.md#1-1)
    - [不要] [不要在你的库的src目录下引入其他库](usage.md#1-2)
    - [推荐] [库lib目录下的引入请使用相对路径](usage.md#1-3)
- 字符串
    - [要] [使用`adjacent strings`串联字符串而不是使用`+`号](usage.md#2-1)
    - [推荐] [使用模板字符串来拼接值和字符而不是用`+`拼接](usage.md#2-2)
    - [避免]  [在不需要使用大括号时省略大括号](usage.md#2-3)
- 集合
    - [要] [尽量使用字面量定义集合](usage.md#3-1)
    - [不要] [不要使用`.length`去判断集合是否为空](usage.md#3-2)
    - [考虑] [使用高阶函数对集合进行转换处理](usage.md#3-3)
    - [避免] [避免在`Iterable.forEach()`里写函数](usage.md#3-4)
    - [不要] [不要使用`List.from()`除非你想转换集合类型](usage.md#3-5)
    - [要] [使用`whereType()`去过滤集合类型](usage.md#3-6)
    - [不要] [当其他操作符可以转换类型时不要使用`cast()`](usage.md#3-7)
    - [避免] [避免使用`cast()`](usage.md#3-8)
- 函数
    - [要] [直接声明函数而不是将lambda函数赋值给一个变量](usage.md#4-1)
    - [不要] [`lambda`表达式尽量简洁](usage.md#4-2)
- 参数
    - [要] [使用`=`为吗命名参数设置默认值](usage.md#5-1)
    - [不要] [不要将默认值显式设置为`null`](usage.md#5-2)
- 变量
    - [不要] [不要将初始化变量显式设置为`null`](usage.md#6-1)
    - [避免] [避免存储你可以计算的值](usage.md#6-2)
- 成员
    - [不要] [不要在不必要的时候设置`getter`和`setter`](usage.md#7-1)
    - [推荐] [使用`final`声明一个只读属性](usage.md#7-2)
    - [考虑] [对于一个简单属性的获取使用`=>`](usage.md#7-3)
    - [不要] [不要在不必要的时候使用`this`](usage.md#7-4)
    - [要] [尽量在初始值声明时赋值初始值](usage.md#7-5)
- 构造函数
    - [要] [尽量使用简洁的构造函数声明方式](usage.md#8-1)
    - [不要] [不要为构造函数参数声明类型](usage.md#8-2)
    - [要] [构造函数body为空时使用`;`而不是`{}`](usage.md#8-3)
    - [不要] [不要使用`new`关键字声明实例](usage.md#8-4)
    - [不要] [不要重复冗余的声明`const`](usage.md#8-5)
- 错误处理
    - [避免] [避免在没有条件控制下捕捉错误](usage.md#9-1)
    - [不要] [不要忽略错误](usage.md#9-2)
    - [要] [仅仅在语法错误的情况下抛出实现`Error`的类](usage.md#9-3)
    - [不要] [开发时不要对错误做处理，let's crash](usage.md#9-4)
    - [要] [使用`rethrow`关键词重新抛出无法处理的异常](usage.md#9-5)
- 异步
    - [推荐] [使用`async/await`优于传统的`Future`](usage.md#10-1)
    - [不要] [不要在`async`没有任何作用时使用它](usage.md#10-2)
    - [考虑] [使用高阶函数处理转换流`stream`](usage.md#10-3)
    - [避免] [避免直接使用`Completer`类](usage.md#10-4)
    - [要] [当参数声明类型为`Future<T>`时候，参数可能为`Object`的情况下请用`Future<T>`做类型判断](usage.md#10-5)

## Effective Dart: Documentation 

- 注释
    - [要] [用描述性的语句写注释](documentation.md#1-1)
    - [不要] [使用块注释作为文档](documentation.md#1-2)
- 文档注释
    - [要] [使用`\\\`文档注释去注释成员和类型](documentation.md#2-1)
    - [推荐] [为公共API写文档注释](documentation.md#2-2)
    - [考虑] [编写库级别的文档注释](documentation.md#2-3)
    - [考虑] [为私有API编写文档注释](documentation.md#2-4)
    - [要] [使用一句话完成文档总结](documentation.md#2-5)
    - [要] [将文档注释段落的第一句话分离出来](documentation.md#2-6)
    - [避免] [注释避免冗余](documentation.md#2-7)
    - [推荐] [注释函数或者方法时使用第三人称动词](documentation.md#2-8)
    - [推荐] [注释变量，getter/setter时使用名词短语](documentation.md#2-9)
    - [推荐] [注释库或者类型时使用名词短语](documentation.md#2-10)
    - [考虑] [在注释中提供代码例子](documentation.md#2-11)
    - [要] [在文档注释中使用方括号突出作用域內标识符](documentation.md#2-12)
    - [要] [使用简介的描述来注释参数，返回值和抛出的异常](documentation.md#2-13)
    - [要] [将文档注释放在元数据注解`@`之前](documentation.md#2-14)
- Markdown
    - [避免] [避免过度使用Markdown](documentation.md#3-1)
    - [避免] [避免使用HTML作为注释](documentation.md#3-2)
    - [推荐] [使用反引号来区分代码块](documentation.md#3-3)
- 如何写注释
    - [推荐] [尽量简短](documentation.md#4-1)
    - [避免] [尽量避免使用缩略词除非它们很常见](documentation.md#4-2)
    - [推荐] [使用`this`而不是`the`去指代实例本身](documentation.md#4-3)

## Effective Dart: Design
> WIP (work in progress) 

- 命名
    - [要] [使用统一的命名策略](design.md#1-1)
    - [避免] [使用缩写](design.md#1-2)
    - [推荐] [将最有意义的描述名词放在最后](design.md#1-3)
    - [考虑] [增加代码可读性，使之语义化](design.md#1-4)
    - [推荐] [非布尔值的属性或者变量命名使用名词短语](design.md#1-5)
    - [推荐] [布尔值属性或者变量命名使用非命令性动词](design.md#1-6)
    - [考虑] [布尔值命名参数请省略动词](design.md#1-7)
    - [推荐] [布尔值属性或者变量命名时使用正面词汇命名](design.md#1-8)
    - [推荐] [当函数或者方法会产生副作用时用动词短语命名](design.md#1-9)
    - [推荐] [当函数或者方法有返回值时用名词短语命名](design.md#1-10)
    - [考虑] [如果你想强调函数工作内容请用动词短语命名](design.md#1-11)
    - [避免] [避免使用get作为函数方法名字的开头](design.md#1-12)
    - [推荐] [如果是将一个对象状态复制到另一个对象的方法请使用`to_()`格式命名](design.md#1-13)
    - [推荐] [改变对象类型使用`as_()`格式命名](design.md#1-14)
    - [避免] [不要在函数方法名中出现参数名](design.md#1-15)
    - [要] [当给类型参数命名时请遵循如下的助记符约定](design.md#1-16)
- 库
    - [推荐] [声明为私有](design.md#2-1)
    - [考虑] [可以在同一个库里声明多个类](design.md#2-2)
- 类
  - [避免] [避免为了使用一个简单的函数而去定义一个单一成员的抽象类](design.md#3-1)
  - [避免] [定义仅包含静态成员的类。](design.md#3-2)
  - [避免] [集成一个不期望被集成的类。](design.md#3-3)
  - [要] [把能够继承的说明添加到文档中，如果这个类可以继承。](design.md#3-4)
  - [避免] [去实现一个不期望成为接口的类（该类不想作为接口被实现）。](design.md#3-5)
  - [要] [对支持接口的类在文档注明](design.md#3-6)
  - [要] [对支持 `mixin` 的类在文档注明](design.md#3-7)
  - [避免] [去 `mixin` 一个不期望被 `mixin` 的类](design.md#3-8)
- 构造函数
  - [考虑] [如果类支持请将构造函数声明为`const`](design.md#4-1)
- 成员
  - [推荐] [指定字段或顶级变量为 `final`。](design.md#5-1)
  - [要] [对概念上是访问的属性使用 `getter` 方法。](design.md#5-2)
  - [要] [对概念上是修改的属性使用 `setter` 方法。](design.md#5-3)
  - [不要] [在没有对应的 `getter` 的情况下定义 `setter`。](design.md#5-4)
  - [AVOID] [using runtime type tests to fake overloading.](design.md#5-5)
  - [AVOID] [public late final fields without initializers.](design.md#5-6)
  - [AVOID] [returning nullable Future, Stream, and collection types.](design.md#5-7)
  - [避免] [为了书写流畅，而从方法中返回 `this` 。](design.md#5-8)
- 类型
  - [DO] [type annotate variables without initializers.](design.md#6-1)
  - [推荐] [为类型不明显的公共字段和公共顶级变量指定类型注解。](design.md#6-2)
  - [避免] [为初始化的局部变量添加冗余地类型注解。](design.md#6-3)
  - [DO] [annotate return types on function declarations.](design.md#6-4)
  - [DO] [annotate parameter types on function declarations.](design.md#6-5)
  - [避免] [在函数表达式上注解推断的参数类型。](design.md#6-6)
  - [DON’T] [type annotate initializing formals.](design.md#6-7)
  - [DO] [write type arguments on generic invocations that aren’t inferred.](design.md#6-8)
  - [DON’T] [write type arguments on generic invocations that are inferred.](design.md#6-9)
  - [AVOID] [writing incomplete generic types.](design.md#6-10)
  - [推荐] [使用 `dynamic` 注解替换推断失败的情况。](design.md#6-11)
  - [推荐] [使 `function` 类型注解的特征更明显](design.md#6-12)
  - [不要] [为 `setter` 方法指定返回类型。](design.md#6-13)
  - [不要] [使用弃用的 `typedef` 语法。](design.md#6-14)
  - [推荐] [优先使用内联函数类型，而后是 `typedef`。](design.md#6-15)
  - [考虑] [在参数上使用函数类型语法。](design.md#6-16)
  - [避免] [使用 `dynamic` 除非你希望禁用静态检查](design.md#6-17)
  - [要] [使用 `Future<void>` 作为无法回值异步成员的返回类型。](design.md#6-18)
  - [避免] [使用 `FutureOr<T>` 作为返回类型。](design.md#6-19)
- 参数
  - [避免] [避免布尔值类型位置参数](design.md#7-1)
  - [避免] [如果你想省略一些参数请请避免使用位置参数](design.md#7-2)
  - [避免] [避免强制性参数,当参数可以省略时](design.md#7-3)
  - [要] [获取范围时将参数设置为左闭右开](design.md#7-4)
- 相等判断
  - [要] [如果你重载`==`请一并重载`hashcode`](design.md#8-1)
  - [要] [请让你的`==`运算符遵守数学上的相等](design.md#8-2)
  - [避免] [避免为可变类定义常规意义上的相等](design.md#8-3)
  - [不要] [不需要在重载`==`运算符时判断类型是否为`null`](design.md#8-4)

#### Find a job?（:office: : Shanghai,China）:point_down:
> 上海寻梦科技（[拼多多](http://www.pinduoduo.com/social.html)） 高速上升期，招聘算法-前端-客户端-Java开发-Python开发-Golang开发等
> 如果你正在寻找合适的工作，内推请联系我投递简历（E-Mail: eXVubGVpQHBpbmR1b2R1by5jb20=）


###  License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2018-present, @iChenLei
