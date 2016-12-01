gdb使用问题集锦
====

一、问题列表
----

### 1.1 无法进入dlopen动态调用的库中进行跟踪调试

1. 问题描述:

   在appmain中使用dlopen打开testapp.so，但在gdb调试中，无法进入testapp.so, 编译时都使用了-g参数

2. 解决:

   - 先让gdb运行起来，并暂停，使用info sharedlibrary来查看是否有动态库处理Syms:NO状态

   - 然后设置solib-search-path

      set solib-search-path /opt/rcs/modules


二、其他说明
----


