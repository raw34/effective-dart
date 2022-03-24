<a name="top"></a>
## 🔥 Effective Dart: Style 🔥  
优秀的代码很重要的一部分就是有好的`代码风格`.一致的命名,代码顺序和格式化可以让我们的代码看起来风格统一.如果我们从始至终在Dart生态中使用一致的代码风格，可以让我们很容易的去学习别人的代码和为别人的代码做贡献.

1. **标识符命名**  
    - [要] [类型命名使用大写驼峰风格](#1-1)  
    - [要] [库个源文件命名使用小写加下划线风格](#1-2)  
    - [要] [import前缀命名使用小写加下划线风格](#1-3)  
    - [要] [其他命名使用小写驼峰风格](#1-4)  
    - [推荐] [常量命名使用小写驼峰风格](#1-5)  
    - [要]  [缩略词大写](#1-6)  
    - [不要] [不要使用前缀字符](#1-7)  
2. **代码顺序** 
    - [要] [将`dart:xx`导入代码放在其他导入之前](#2-1)
    - [要] [将`package:xx`导入代码放在相对文件导入之前](#2-2)  
    - [推荐] [将自己的包的引入代码放在其他三方包引入之后](#2-3)  
    - [要] [导出代码应该放在所有导入代码之后](#2-4) 
    - [要] [同一类导入代码顺序根据文件或者包名的首字母排序](#2-5) 
3. **格式化**      
    - [要] [使用`dartfmt`工具格式化你的代码](#3-1)  
    - [考虑] [修改你的代码使之变得对格式化工具友好](#3-2)  
    - [避免] [单行代码不超过80个字符](#3-3)  
    - [要] [使用大括号包裹你的控制流结构](#3-4)

### 标识符命名 💅 

#### 在dart中有三种命名方式
- 大写驼峰命名 `UpperCamelCase`
- 小写驼峰命名 `lowerCamelCase`
- 小写加下划线命名 `lower_case_width_underscores`

<a name="1-1"></a>
#### [要] 类型命名使用*大写驼峰命名*
> 类，枚举，typedef和类型参数应该将每个单词首字母大写（包括第一个单词）并且不使用任何分隔符
```dart
    class SliderMenu { ... }
    
    class HttpRequest { ... }
    
    typedef Predicate<T> = bool Function(T value);
```
> 当类被用来作为元数据注解时也使用*大写驼峰命名*
```dart
    class Foo {
        const Foo([arg]);
    }

    @Foo(anArg)
    class A { ... }
    
    @Foo()
    class B { ... }
```
> 当注解类的构造函数不需要参数时，可以使用*小写驼峰命名*的常量代替
```dart
const foo = Foo();

@foo
class C { ... }
```
<a name="1-2"></a>
#### [要] 对库和源文件命名时用下划线命名使用*下划线命名*
> 一些文件系统是大小写不敏感的，所以很多项目需要将文件名设置为小写，使用下划线将单词分割可以有效的提高可读性。使用下划线命名时应该确保名字是一个合法的dart命名。

```dart
    // good
    library peg_parser.source_scanner;

    import 'file_system.dart';
    import 'slider_menu.dart';

    // bad
    library pegparser.SourceScanner;

    import 'file-system.dart';
    import 'SliderMenu.dart';
```
<a name="1-3"></a>
#### [要] 当import包并取别名时使用*下划线命名*

```dart
    // good
    import 'dart:math' as math;
    import 'package:ng_component' as ng_component;
    import 'package:js/js.dart' as js;

    //bad
    import 'dart:math' as Math;
    import 'package:ng_component' as ngComponent;
    import 'package:js/js.dart' as JS;
```
<a name="1-4"></a>
#### [要] 在为下面标识符命名时使用*小写驼峰命名*
> 类成员，顶层(全局)定义，变量，参数，命名参数除了首单词其余单词首字母应该大写，并且不使用分隔符

```dart
    var item;

    HttpRequest httpRequest;

    void align(bool clearItems) {
        //...
    }
```
<a name="1-5"></a>
#### [推荐] 对常量命名时使用*小写驼峰命名*
>在dart2.x之前，dart对于常量命名使用的是SCREAMING_CAPS，详见dart sdk的changelog

```dart
    // good
    const pi = 3.14;
    const defaultTimeout = 4000;
    final urlScheme = RegExp('^([a-z]+):');

    class Dice {
        static final numberGenerator = Random();
    }

    // bad
    const PI = 3.14;
    const DefaultTimeout = 1000;
    final URL_SCHEME = RegExp('^([a-z]+):'); 

    class Dice {
        static final NUMBER_GENERATOR = Random();
    }
```
<a name="1-6"></a>
#### [要] 对于缩略词命名的一些建议
> 大写缩略词难于阅读理解，特别是多个缩略词组合时容易产生歧义，举个例子比如HTTPSFTP，没法说清楚这是指的HTTPS FTP还是HTTP SFTP。为了避免这种问题，缩略词应该和普通单词一样首字符大写，而特别的双单词缩写比如IO，DB不改变写法。

```dart
    // good
    HttpConnectionInfo
    uiHandler
    IOStream
    Id
    DB

    // bad
    HTTPConnection
    UiHandler
    IoStream
    ID
    Db
```
<a name="1-7"></a>
#### [不要] 不要使用前缀字符
> 这没有任何意义，因为dart会告诉你类型，作用域和其他你声明的属性，没有理由需要去标注前缀
```dart
    // good
    defaultTimeout
    // bad
    kDefaultTimeout
```
**[⬆ back to top](#top)**
## 代码顺序 💧 
> 为了你的代码文件内容整洁，我们对于代码顺序有一些规定，每一个区块应该用空白行分割开
<a name="2-1"></a>
#### [要] 'dart:' 的引入代码放在其他引入之前

```dart
    import 'dart:async';
    import 'dart:html';

    import 'package:bar/bar.dart';
```
<a name="2-2"></a>
#### [要] 'package:' 的引入代码放在相对路径引入之前

```dart
    import 'package:bar/bar.dart';

    import '../util.dart';
```
<a name="2-3"></a>
#### [推荐] 将自己的包的引入代码放在其他三方包引入之后

```dart
    import 'package:bar/bar.dart';

    import 'package:my_package/util.dart';
```
<a name="2-4"></a>
#### [要] 导出代码应该放在所有导入代码之后
```dart
    // good
    import 'src/error.dart';
    import 'src/foo.dart';

    export 'src/error.dart';

    // bad
    import 'src/error.dart';
    export 'src/error.dart';
    import 'src/foo.dart';
```
<a name="2-5"></a>
#### [要] 同一类导入代码顺序根据文件或者包名的首字母排序

```dart
    // good
    import 'package:bar/bar.dart';
    import 'package:foo/foo.dart';

    // bad
    import 'package:foo/foo.dart';  
    import 'package:bar/bar.dart';
```
**[⬆ back to top](#top)**
## 代码格式化 🔨 
> 和大多数语言一样，Dart会忽略空格,然而语言使用者不会。拥有统一的空白行风格可以让人民阅读代码时想编译器一样高效。
<a name="3-1"></a>
#### [要] 使用dartfmt工具格式化你的代码
> 格式化是很无聊的工作，在重构时特别耗费时间。幸运的是你现在不必为此担心，我们提供了一个复杂的自动化代码格式化工具叫做[dartfmt](https://github.com/dart-lang/dart_style) 🔗 。下面的一些格式化指导是为了解决一些dartfmt不能帮你解决的问题。
<a name="3-2"></a>
#### [考虑] 修改你的代码使之对于dartfmt处理变得亲和
>格式化工具会尽力而为的格式化你的代码，但是它无法创造奇迹。如果你的代码有很长的标识符，或者很深层的嵌套，不同类型的运算符号混合等等，格式化后的输出代码依然难以阅读。

>这种情况下，请重构或者简化你的代码。推荐你缩短变量名或者将表达式赋值给一个新的变量。换句话说，尽可能的提高你的代码的可读性。将dartfmt视为你的合作伙伴，合作产出漂亮的代码。
<a name="3-3"></a>
#### [避免] 单行代码不要超过80个字符
>可读性研究发现一行文字过长是难以阅读的，因为你的眼睛需要看一行文字从头看到位。这也是为什么报纸或者杂志使用多行文字来承载内容。

>如果你发现你的一行代码将要超过80个字符，我们的经验是你的代码可能过于冗长需要一点压缩。最主要的原因可能是你使用了超长的类名。这时候你应该问自己是否每个单词都有特殊的含义或者防止了冲突，如果不是请考虑省略它。

>请注意dartfmt会为你做99%的工作，但是最后1%的工作需要你来完成，字符限制这种工作需要你自己来做。我们对URL和文件路径做了处理，当这些出现在注释或者字符串（通常是importh和export）中即使超出限制我们也会保留成一行，这样方便搜索给定路径的源文件。
<a name="3-4"></a>
#### [要] 使用大括号包住所有控制流结构
> 这样做可以避免悬空else问题

```dart
    // good
    if (isWeekDay) {
        print('I am verhappy');
    } else {
        print('Holy shit');
    }

    // bad 
    if (overflowChars != other.overflowChars)
        return overflowChars < other.overflowChars;
```
>下面是对于控制流代码风格的建议

```dart
    // good
    if (arg == null) return defaultValue;

    // good
    if (overflowChars != other.overflowChars) {
        return overflowChars < other.overflowChars;
    }

    // bad 
    if (overflowChars != other.overflowChars)
        return overflowChars < other.overflowChars;
```
**[⬆ back to top](#top)**