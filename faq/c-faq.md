C语言拾遗
====

宏的使用:
----

### C语言宏定义##连接符和#符的使用

参见: http://blog.csdn.net/dotphoenix/article/details/4345174

1. "#"的功能是将其后面的宏参数进行字符串化操作

    #define WARN_IF(EXP)    do{ if (EXP)    fprintf(stderr, "Warning: " #EXP "/n"); }   while(0)

2. "##"被称为连接符（concatenator），用来将两个Token连接为一个Token

    #define COMMAND(NAME) { NAME, NAME ## _command }

3. 在变参宏中，##这个连接符号充当的作用就是当__VAR_ARGS__为空的时候，消除前面的那个逗号

    #define myprintf(templt, ...) fprintf(stderr,templt, ##__VAR_ARGS__)

  这样，就可以使用

    myprintf(templt);

4. 错误的嵌套－Misnesting

    #define ceil_div(x, y) (x + y - 1) / y

  那么: 

    a = ceil_div( b & c, sizeof(int) );

  会转化成:

    a = ( b & c  + sizeof(int) - 1) / sizeof(int);

  应该改成:

    #define ceil_div(x, y) (((x) + (y) - 1) / (y))

5. 消除多余的分号－Semicolon Swallowing

    #define MY_MACRO(x) { /* line 1 */   /* line 2 */   /* line 3 */ }

    //...

    if (condition())

        MY_MACRO(a);

    else

        {...}

  应该改为

    #define MY_MACRO(x) do { /* line 1 */    /* line 2 */    /* line 3 */ } while(0)

6. Duplication of Side Effects

    #define min(X,Y) ((X) > (Y) ? (Y) : (X))
    c = min(a,foo(b));

  那么，foo(b)会调用两次，应该改成:

    #define min(X,Y) ({	typeof (X) x_ = (X);	typeof (Y) y_ = (Y);	(x_ < y_) ? x_ : y_; })

  ({...})的作用是将内部的几条语句中最后一条的值返回，它也允许在内部声明变量（因为它通过大括号组成了一个局部Scope）


