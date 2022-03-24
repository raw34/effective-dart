<a name="top"></a>
## 🔥 Effective Dart: Design 🔥
> WIP (work in progress)

- 命名
    - [要] [使用一致的术语](#1-1)
    - [避免] [使用缩写](#1-2)
    - [推荐] [将最有意义的描述名词放在最后](#1-3)
    - [考虑] [增加代码可读性，使之语义化](#1-4)
    - [推荐] [非布尔值的属性或者变量命名使用名词短语](#1-5)
    - [推荐] [布尔值属性或者变量命名使用非命令性动词](#1-6)
    - [考虑] [布尔值命名参数请省略动词](#1-7)
    - [推荐] [布尔值属性或者变量命名时使用正面词汇命名](#1-8)
    - [推荐] [当函数或者方法会产生副作用时用动词短语命名](#1-9)
    - [推荐] [当函数或者方法有返回值时用名词短语命名](#1-10)
    - [考虑] [如果你想强调函数工作内容请用动词短语命名](#1-11)
    - [避免] [避免使用get作为函数方法名字的开头](#1-12)
    - [推荐] [如果是将一个对象状态复制到另一个对象的方法请使用`to_()`格式命名](#1-13)
    - [推荐] [改变对象类型使用`as_()`格式命名](#1-14)
    - [避免] [不要在函数方法名中出现参数名](#1-15)
    - [要] [当给类型参数命名时请遵循如下的助记符约定](#1-16)
- 库
    - [推荐] [声明为私有](#2-1)
    - [考虑] [可以在同一个库里声明多个类](#2-2)
- 类
    - [避免] [避免为了使用一个简单的函数而去定义一个单一成员的抽象类](#3-1)
    - [避免] [定义仅包含静态成员的类。](#3-1)
    - [避免] [集成一个不期望被集成的类。](#3-1)
    - [要] [把能够继承的说明添加到文档中，如果这个类可以继承。](#3-1)
    - [避免] [去实现一个不期望成为接口的类（该类不想作为接口被实现）。](#3-1)
    - [要] [对支持接口的类在文档注明](#3-1)
    - [要] [对支持 `mixin` 的类在文档注明](#3-1)
    - [避免] [去 `mixin` 一个不期望被 `mixin` 的类](#3-1)

- 构造函数
    - [考虑] [如果类支持请将构造函数声明为`const`](#4-2)
- 成员
    - [推荐] [指定字段或顶级变量为 `final`。](#5-1)
    - [要] [对概念上是访问的属性使用 `getter` 方法。](#5-1)
    - [要] [对概念上是修改的属性使用 `setter` 方法。](#5-1)
    - [不要] [在没有对应的 `getter` 的情况下定义 `setter`。](#5-1)
    - [AVOID] [using runtime type tests to fake overloading.](#5-1)
    - [AVOID] [public late final fields without initializers.](#5-1)
    - [AVOID] [returning nullable Future, Stream, and collection types.](#5-1)
    - [避免] [为了书写流畅，而从方法中返回 `this` 。](#5-1)
- 类型
    - [DO] [type annotate variables without initializers.](#6-1)
    - [推荐] [为类型不明显的公共字段和公共顶级变量指定类型注解。](#6-1)
    - [避免] [为初始化的局部变量添加冗余地类型注解。](#6-1)
    - [DO] [annotate return types on function declarations.](#6-1)
    - [DO] [annotate parameter types on function declarations.](#6-1)
    - [避免] [在函数表达式上注解推断的参数类型。](#6-1)
    - [DON’T] [type annotate initializing formals.](#6-1)
    - [DO] [write type arguments on generic invocations that aren’t inferred.](#6-1)
    - [DON’T] [write type arguments on generic invocations that are inferred.](#6-1)
    - [AVOID] [writing incomplete generic types.](#6-1)
    - [推荐] [使用 `dynamic` 注解替换推断失败的情况。](#6-1)
    - [推荐] [使 `function` 类型注解的特征更明显](#6-1)
    - [不要] [为 `setter` 方法指定返回类型。](#6-1)
    - [不要] [使用弃用的 `typedef` 语法。](#6-1)
    - [推荐] [优先使用内联函数类型，而后是 `typedef`。](#6-1)
    - [考虑] [在参数上使用函数类型语法。](#6-1)
    - [避免] [使用 `dynamic` 除非你希望禁用静态检查](#6-1)
    - [要] [使用 `Future<void>` 作为无法回值异步成员的返回类型。](#6-1)
    - [避免] [使用 `FutureOr<T>` 作为返回类型。](#6-1)
- 参数
    - [避免] [避免布尔值类型位置参数](#7-1)
    - [避免] [如果你想省略一些参数请请避免使用位置参数](#7-2)
    - [避免] [避免强制性参数,当参数可以省略时](#7-3)
    - [要] [获取范围时将参数设置为左闭右开](#7-4)
- 相等判断
    - [要] [如果你重载`==`请一并重载`hashcode`](#8-1)
    - [要] [请让你的`==`运算符遵守数学上的相等](#8-2)
    - [避免] [避免为可变类定义常规意义上的相等](#8-3)
    - [不要] [不需要在重载`==`运算符时判断类型是否为`null`](#8-4)

### 命名
> 命名是编写易于阅读的、可维护代码的关键之一。 下面的最佳实践可以帮助你实现这个目标。

- [要] 使用一致的术语
  >对于同样的东西要一直使用同样的名字。 如果在你的库之外已经存在一个广为人知的名字了， 请继续使用这个名字。

    ```dart
        // good
    pageCount         // A field.
    updatePageCount() // Consistent with pageCount.
    toSomething()     // Consistent with Iterable's toList().
    asSomething()     // Consistent with List's asMap().
    Point             // A familiar concept.

    // bad
    renumberPages()      // Confusingly different from pageCount.
    convertToSomething() // Inconsistent with toX() precedent.
    wrappedAsSomething() // Inconsistent with asX() precedent.
    Cartesian            // Unfamiliar to most users.
    ```
  >目标是尽量利用用户已知的内容。包括他们所熟知的领域、 核心库的习惯用法、 以及你的 API 的其他部分的使用习惯。在这些熟知的基础之上命名你的代码， 可以减少你的用户使用你的库的学习成本， 提高他们的生产效率。

- [避免] 避免使用缩写
  >只使用广为人知的缩写，对于特有领域的缩写，请进来不要使用。 如果要使用，请 正确的指定首字母大小写。

    ```dart
        // good
    pageCount
    buildRectangles
    IOStream
    HttpRequest

    // bad
    numPages    // "num" is an abbreviation of number(of)
    buildRects
    InputOutputStream
    HypertextTransferProtocolRequest
    ```
- [推荐] 将最有意义的描述名词放在最后
  > 最后一个单词应该可以描述所代表的东西。 你可以在之前添加其他前缀来进一步详细描述，例如 其他形容词。

    ```dart
        // good
    pageCount             // A count (of pages).
    ConversionSink        // A sink for doing conversions.
    ChunkedConversionSink // A ConversionSink that's chunked.
    CssFontFaceRule       // A rule for font faces in CSS.

    // bad
    numPages                  // Not a collection of pages.
    CanvasRenderingContext2D  // Not a "2D".
    RuleFontFaceCss           // Not a CSS.
    ```
- [考虑] 增加代码可读性，使之语义化
  > 当你不知道如何命名 API 的时候，尝试着用你的 API 写一些代码， 尽量让你写的代码看起来像普通的句子一样。

    ```dart
        // good
    // "If errors is empty..."
    if (errors.isEmpty) ...

    // "Hey, subscription, cancel!"
    subscription.cancel();

    // "Get the monsters where the monster has claws."
    monsters.where((monster) => monster.hasClaws);

    // bad
    // Telling errors to empty itself, or asking if it is?
    if (errors.empty) ...

    // Toggle what? To what?
    subscription.toggle();

    // Filter the monsters with claws *out* or include *only* those?
    monsters.filter((monster) => monster.hasClaws);
    ```
  >尝试着使用你自己的 API，并且阅读以下写出来的代码，可以帮助你提高命名的技能。 添加其他文学和语法修饰让代码看起来更像语法正确的句子 是不必要的。
    ```dart
        // bad
    if (theCollectionOfErrors.isEmpty) ...

    monsters.producesANewSequenceWhereEach((monster) => monster.hasClaws);
    ```
- [推荐] 非布尔值的属性或者变量命名使用名词短语
  >读者关注属性是什么。如果用户更关心 如何确定一个属性，则很可能应该是一个函数， 并使用动词短语命名该函数。

    ```dart
        // good
    list.length
    context.lineWidth
    quest.rampagingSwampBeast

    // bad
    list.deleteItems

    ```
- [推荐] 布尔值属性或者变量命名使用非命令性动词
  > 布尔名称通常用在控制语句中当做条件，所以你需要让他在 控制条件中语感很好。比较下面的两个：
    ```dart
        if (window.closeable) ...  // Adjective.
    if (window.canClose) ...   // Verb.
    ```
  >可以使用命令式动词来区分布尔变量名字和函数名字。 一个布尔变量的名字不应该看起来像一个命令，告诉这个对象做什么事情。 原因在于访问一个变量的属性并没有修改对象的状态。 如果这个属性确实修改了对象的状态，则它应该是一个函数。

    ```dart
        // good
    isEmpty
    hasElements
    canClose
    closesWindow
    canShowPopup
    hasShownPopup

    // bad
    empty         // Adjective or verb?
    withElements  // Sounds like it might hold elements.
    closeable     // Sounds like an interface.
    // "canClose" reads better as a sentence.
    closingWindow // Returns a bool or a window?
    showPopup     // Sounds like it shows the popup.
    ```
- [考虑] 布尔值命名参数请省略动词
  > 提炼于上一条规则。对于命名布尔参数，没有动词的 名称通常看起来更加舒服。
    ```dart
        Isolate.spawn(entryPoint, message, paused: false);
    var copy = List.from(elements, growable: true);
    var regExp = RegExp(pattern, caseSensitive: false);
    ```

- [推荐]布尔值属性或者变量命名时使用正面词汇命名
  > 函数通常返回一个结果给调用者，并且执行一些任务或者带有副作用。 在像 Dart 这种命令式语言中，调用函数通常为了实现其副作用： 可能改变了对象的内部状态、 产生一些输出内容、或者和外部世界沟通等。

  >这种类型的成员应该使用命令式动词短语来命名，强调 该成员所执行的任务。

    ```dart
        list.add("element");
    queue.removeFirst();
    window.refresh();
    ```
- [推荐] ？使用名词短语或者非命令式动词短语命名返回数据为主要功能的方法或者函数。
  >虽然这些函数可能也有副作用，但是其主要目的是返回一个数据给调用者。 如果该函数无需参数通常应该是一个 getter 。 有时候获取一个属性则需要一些参数，比如， elementAt() 从集合中返回一个数据，但是需要一个 指定返回那个数据的参数。

  >在语法上看这是一个函数，其实严格来说其返回的是集合中的一个属性， 应该使用一个能够表示该函数返回的是什么的词语 来命名。
    ```dart
        var element = list.elementAt(3);
    var first = list.firstWhere(test);
    var char = string.codeUnitAt(4);
    ```

    ```dart
        // good
    var table = database.downloadData();
    var packageVersions = packageGraph.solveConstraints();
    ```
- [推荐] ？当函数或者方法会产生副作用时用动词短语命名
- [推荐] ？当函数或者方法有返回值时用名词短语命名
- [考虑] ？如果你想强调函数工作内容请用动词短语命名
- [避免] ？避免使用get作为函数方法名字的开头
- [推荐] 如果是将一个对象状态复制到另一个对象的方法请使用`to_()`格式命名
  >一个转换函数返回一个新的对象，里面包含一些原对象的状态， 可能还有稍微的修改。 核心库中很多类似的函数命名为 toXXX 。

  >如果你也定义了一个转换函数，最好也使用同样的命名方式。
    ```dart
        // good
    list.toSet();
    stackTrace.toString();
    dateTime.toLocal();
    ```
- [推荐] 改变对象类型使用`as_()`格式命名
  >转换函数提供的是“快照功能”。返回的对象有自己的数据副本，修改原来对象的数据不会改变 返回的对象中的数据。另外一种函数返回的是同一份数据的另外一种 表现形式，返回的是一个新的对象，但是其内部引用的数据和原来对象引用的数据一样。 修改原来对象中的数据，新返回的对象中的数据也一起被修改。

    ```dart
        // good
    var map = table.asMap();
    var list = bytes.asFloat32List();
    var future = subscription.asFuture();
    ```
- [避免] 不要在函数方法名中出现参数名
  >在调用代码的时候可以看到参数，所以无需再次显示参数了。
    ```dart
        // good
    list.add(element);
    map.remove(key);

    // bad
    list.addElement(element)
    map.removeKey(key)
    ```
  >但是，对于具有多个类似的函数的时候，使用参数名字可以消除歧义， 这个时候应该带有参数名字。
    ```dart
        // good
    map.containsKey(key);
    map.containsValue(value);
    ```
- [要] ？当给类型参数命名时请遵循如下的助记符约定

### 库
>下划线 ( _ ) 表明这个成员只能在库内部访问，是库私有成员。 Dart 工具确保该规则生效。

- [推荐] 声明为私有
  >库中的公开声明—顶级定义或者在类中定义—是一种信号， 表示其他库可以并应该访问这些成员。 同时公开声明也是一种你的库需要实现的契约，当 使用这些成员的时候，应该实现其宣称的功能。

  >如果某个成员你不希望公开，则在成员名字之前添加一个`_`即可。 减少公开的接口让你的库更容易维护，也让用户更加容易掌握你的库如何使用。

  >另外，分析工具还可以分析出没有用到的私有成员定义，然后 告诉你可以删除这些无用的代码。 私有成员第三方代码无法调用而你自己在库中也没有使用，所以是无用的代码。
- [考虑] 可以在同一个库里声明多个类
  >一些其他语言，比如 Java。将文件结构和类结构进行捆绑&mdash：每个文件仅能定义一个顶级类。 Dart 没有这样的限制。库与类是相互独立的。如果多个类，顶级变量，以及函数，他们再逻辑上归为同一类，那么将他们包含到单一的库中，这样做是非常棒的。

  >将多个类组织到一个库中，就可以使用一些有用的模式。因为在 Dart 中私有特性是在库级别上有效，而不是在类级别，基于这个模式你可以定义类似于 C++ 中的 “friend” 类。所有定义在同一个库中的类可以互相访问彼此的私有成员，但库以外的代码无法发访问。

  >将多个类组织到一个库中，就可以使用一些有用的模式。因为在 Dart 中私有特性是在库级别上有效，而不是在类级别，基于这个模式你可以定义类似于 C++ 中的 “friend” 类。所有定义在同一个库中的类可以互相访问彼此的私有成员，但库以外的代码无法发访问。

### 类
- [避免] ？避免为了使用一个简单的函数而去定义一个单一成员的抽象类
- [避免] ？定义仅包含静态成员的类。
- [避免] ？集成一个不期望被集成的类。
- [要] ？把能够继承的说明添加到文档中，如果这个类可以继承。
- [避免] ？去实现一个不期望成为接口的类（该类不想作为接口被实现）。
- [要] ？对支持接口的类在文档注明
- [要] ？对支持 `mixin` 的类在文档注明
- [避免] ？去 `mixin` 一个不期望被 `mixin` 的类

### 构造函数
- [考虑] ？如果类支持请将构造函数声明为`const`

### 成员
- [推荐] ？指定字段或顶级变量为 `final`。
- [要] ？对概念上是访问的属性使用 `getter` 方法。
- [要] ？对概念上是修改的属性使用 `setter` 方法。
- [不要] ？在没有对应的 `getter` 的情况下定义 `setter`。
- [AVOID] ？using runtime type tests to fake overloading.
- [AVOID] ？public late final fields without initializers.
- [AVOID] ？returning nullable Future, Stream, and collection types.
- [避免] ？为了书写流畅，而从方法中返回 `this` 。

### 类型
- [DO] ？type annotate variables without initializers.
- [推荐] ？为类型不明显的公共字段和公共顶级变量指定类型注解。
- [避免] ？为初始化的局部变量添加冗余地类型注解。
- [DO] ？annotate return types on function declarations.
- [DO] ？annotate parameter types on function declarations.
- [避免] ？在函数表达式上注解推断的参数类型。
- [DON’T] ？type annotate initializing formals.
- [DO] ？write type arguments on generic invocations that aren’t inferred.
- [DON’T] ？write type arguments on generic invocations that are inferred.
- [AVOID] ？writing incomplete generic types.
- [推荐] ？使用 `dynamic` 注解替换推断失败的情况。
- [推荐] ？使 `function` 类型注解的特征更明显
- [不要] ？为 `setter` 方法指定返回类型。
- [不要] ？使用弃用的 `typedef` 语法。
- [推荐] ？优先使用内联函数类型，而后是 `typedef`。
- [考虑] ？在参数上使用函数类型语法。
- [避免] ？使用 `dynamic` 除非你希望禁用静态检查
- [要] ？使用 `Future<void>` 作为无法回值异步成员的返回类型。
- [避免] ？使用 `FutureOr<T>` 作为返回类型。

### 参数
>在 Dart 中可选参数可以为命名参数或者位置参数，但是不能同时有这两种类型的参数为可选参数。

- [避免] 避免布尔值类型位置参数

  >和其他类型不一样的是，布尔值通常使用字面量形式。 其他成员通常都放到一个命名的常量中，但是布尔值我们通常都直接使用 true 和 false 。如果起名不清晰的话，在使用布尔值调用的时候 代码看起来可能非常难懂：
    ```dart
        // bad
    new Task(true);
    new Task(false);
    new ListBox(false, true, true);
    new Button(false);
    ```
  >考虑使用命名参数或者命名构造函数以及命名常量来清晰 的表明您的意图：
    ```dart
        // good
    Task.oneShot();
    Task.repeating();
    ListBox(scroll: true, showScrollbars: true);
    Button(ButtonState.enabled);
    ```
  >注意，对于 setter 则没有这个要求，应为 setter 的名字已经明确的 表明了值所代表的意义。
    ```dart
        // good
    listBox.canScroll = true;
    button.isEnabled = false;
    ```

- [避免] 如果你想省略一些参数请请避免使用位置参数
  >位置可选参数应该把经常使用的参数放到参数列表前面。 如果位置排列的不合理，则用户使用起来将很 麻烦。 对于拿不准的排序，请使用命名参数。
    ```dart
        // good
    String.fromCharCodes(Iterable<int> charCodes, [int start = 0, int end]);

    DateTime(int year,
        [int month = 1,
          int day = 1,
          int hour = 0,
          int minute = 0,
          int second = 0,
          int millisecond = 0,
          int microsecond = 0]);

    Duration(
        {int days = 0,
          int hours = 0,
          int minutes = 0,
          int seconds = 0,
          int milliseconds = 0,
          int microseconds = 0});
    ```
- [避免] [避免强制性参数,当参数可以省略时
  >如果用户可以省略一个参数调用函数，推荐让该参数为可选参数而不是强迫用户 使用 null 来作为参数。空字符串 等类似 的情况也适用这种情况。

  >省略参数看起来更加简洁， 有助于 防止 bug。
    ```dart
        // good
    var rest = string.substring(start);

    // bad
    var rest = string.substring(start, null);
    ```
- [要] 获取范围时将参数设置为左闭右开
  > 如果你定义一个函数或者方法让用户从基于位置排序的集合中 选择一些元素，需要一个开始位置索引和结束位置索引分别制定开始 元素的位置以及结束元素的位置。结束位置通常是指 大于最后一个元素的位置的值。

  >核心库就是这样定义的，所以最好和核心库保持一致。
    ```dart
        // good
    [0, 1, 2, 3].sublist(1, 3) // [1, 2]
    'abcd'.substring(1, 3) // 'bc'
    ```
  >这种类型的参数保持一致是非常重要的，由于这种参数通常是位置参数， 如果你的函数第二个参数所代表的意义为获取元素的个数而不是结束的位置， 在调用的时候用户没法通过代码查看其区别。

### 相等判断
> 为类实现自定义的相等判断可能比较麻烦。关于两个对象是否相等， 用户有根深蒂固的直观感受，并且基于哈希的集合要求 里面的对象满足一些微妙 的协议。

- [要] 如果你重载`==`请一并重载`hashcode`
  >默认的哈希函数实现了恒等式哈希—两个对象 只有当其是同一个对象的时候哈希值才一样。 否则的话，默认的 == 的行为不满足恒等式要求。
  如果你覆写了`==`，则表明你的对象可能和其他对象相等。 任何相等的两个对象都必须具有同样的哈希值。 否则的话，map 和其他基于哈希的集合将不知道这两个对象是相等的。

- [要] 请让你的`==`运算符遵守数学上的相等
  >等价关系应该是这样的：

    - 自反: `a == a` 应该总是 `true`.
    - 对称: `a == b` 应该和 `b == a` 是一样的结果。
    - 传递: 如果 `a == b` 和 `b == c` 都返回 true，则 a == c 也应该为 true。
  >用户以及使用 == 的代码都期望遵守上面的规则。 如果你的类无法满足这些要求，则 == 就不是你想 表达的函数的正确名字。

- [避免] 避免为可变类定义常规意义上的相等
  >如果你定义了 == ，则你还应该定义 hashCode 函数。 这两个函数都应该考虑对象的变量。如果这些变量发生了变化，则 表明该对象的哈希值也应该变化。
  大部分基于哈希的集合并不这样认为—这些集合 认为对象的哈希值应该一直不变，如果不是这样的话，这些集合 可能出现怪异的行为。

- [不要] 不需要在重载`==`运算符时判断类型是否为`null`
  > 语言规范表明了这种判断已经自动执行了，你的 == 自定义操作符只有当 右侧对象不为 null 的时候才会执行。
    ```dart
        // good
    class Person {
      final String name;
      // ···
      operator ==(other) => other is Person && name == other.name;

      int get hashCode => name.hashCode;
    }

    // bad
    class Person {
      final String name;
      // ···
      operator ==(other) => other != null && ...
    }
    ```
  **[⬆ back to top](#top)**