### 1.介绍
为了方便在Xcode控制台打印log，处理了NSArray、NSDictionary、NSSet在控制打印出来的是中文是Unicode的问题，这里使用的是Method swizzling 改变一个已经存在的 selector 的实现。这项技术使得在运行时通过改变 selector 在类的消息分发列表中的映射从而改变方法的掉用成为可能。
### 2.使用
1、导入NSObject+WLLogUnicode.h即可以使用
