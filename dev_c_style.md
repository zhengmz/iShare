C/C++开发规范
====

### 文件格式

0. 头文件的后缀全部用.h，C程序后缀用.c，C++程序后缀用.cc

1. 文件应以Unicode (UTF-8) 编码保存

2. 文件必须使用Unix换行符保存，每行应以LF结束，而不是CRLF

### 命名规则

3. 总原则按骆驼命名法为主，比起以下划线_隔开，显得紧凑一些

4. 对一个独立或平台级产品，所有名字尽量使用产品名开头或用命名空间，减少类库冲突

5. 尽量使用常见词语来命名

6. 类名：首字为大写C，多词首字为大写，如CDateTime

  对枚举的声明也采用此方法，如enum DateTimeType

7. 方法/函数：最好用动词开头，首字小写，多词首字为大写，如asStringGMT

  在类里，private的方法和函数可以在前面加下划线_，如_isValid

8. 变量：首词为变量类型简写，其他同方法命名一样，如szFileName

  增加类型前缀，更有利于阅读和比较

  - 在类里，前面需要加上m_，如m_iTimeZone

  - 在方法或函数的参数中，前面需要加上pm_，如pm_szDateTime

  形参用pm_前缀，比在函数体中用l_声明变量来区别变量作用域，更省时间和空间

9. 常量：全部使用大写，多词用下划线隔开，如MAX_TIME_VALUE_LEN

### 注释

10. 总体原则：对程序的注释采用Doxygen格式

11. 对头文件要详细，要有整体的介绍，包括文件、作者、日期、版本、介绍等，如


      /**
      * @file         CDateTime.cc
      * @author       Zhengmz
      * @date         2015/12/23
      * @version      1.0.0
      * @brief        The implement of the class CDateTime.
      *
      * Copyright(c) FlowSea 2015. All rights reserved.
      *
      * Change log:
      * <pre>
      *     author      time          version     description
      * ----------------------------------------------------------
      *     zhengmz     2015.11.15    0.0.1       creating
      *     zhengmz     2015.11.18    0.1.0       add TimeZone
      *     zhengmz     2015.11.19    0.1.1       add static func isDateTime
      *     zhengmz     2015.11.20    0.2.0       add previous, next, invalid.
      *     zhengmz     2015.11.24    0.3.0       modify constructor and operator func
      *     zhengmz     2015.12.23    1.0.0       modify default constructor, and add weekDay()
      * </pre>
      */


12. 对方法/函数的注释，要有描述、参数、返回值、调用关联等，如


      /**
      * Get the date and time relative to GMT (UTC).
      * @param pm_szFmt: see strftime().
      * @see asString()
      * @return the date and time as a string, formatted by pmszFmt.
      */


13. 单行注释用//或///

14. 块注释使用 /** 和 */ 组合

15. 对大段代码块的注释使用 #if 0 和 #endif 组合，避免与代码里的其他注释嵌套

### 布局

16. 一个文件尽量只定义或实现一种最小的功能，如一个类对应一个头文件和实现文件

17. 代码缩进使用 Allman 风格缩进

  - 括号总是独占一行，且缩进与“属于”它的控制语句同级

  - 尽量使用tab，而不是空格，可以让代码看起来更有效率

18. 空格的使用

  - 尽量不要在方括号"[]"和圆括号"()"内增加任何空格

  - 逻辑和比较的操作符前后要有空格，增加可读性

19. 切记不要在一行写多条语句

20. 对SQL语句，要把长的查询分成多行，最好是每行只有一个从句或子从句

### 其他重要

21. 定义方法/函数时，尽量给参数加默认值，增强程序容错性

22. 如果使用命名空间namesapce，则在头文件和实现程序都必须使用namespace xxx { ... }
    而不只是使用using namespace xxx，避免在类中的友元函数friend显示“undefined reference to”

23. 文件名尽量不重复，如主程序不要都取main.cc

