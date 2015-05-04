路线图中的重要概念就是里程碑（MileStone），里程碑可以指定一个逾期日，和一个完成日，分别表示预期完成时间和实际完成时间，通过这两个时间，可以看出是否存在延期或提前。每一个任务单（ticket）都有一个里程碑字段可供设定它所属的里程碑，乐观地说，如果能够把项目的需求、缺陷和改进都分析、细化到多个 ticket 中去，并设定好里程碑，那么整个项目的计划书就跃然纸上了。

定制里程碑，可以看到已关闭、测试中和开发中三个状态的任务单数量，并且通过点击状态分组，可以进入此分组的任务单报表。
定制状态分组通过编辑 trac.ini 来完成，首先确保 trac.ini 中有如下一节：

[milestone]
stats_provider = DefaultTicketGroupStatsProvider

然后加入一个名为 milestone-groups 的节，可以定义如下：

[milestone-groups]
closed = closed
closed.order = 1
closed.query_args = group=resolution
closed.overall_completion = true
closed.label = 已关闭
                            
resolved = resolved
resolved.order = 2
resolved.css_class = new
resolved.label = 测试中

active = *
active.order = 3
active.css_class = open
active.label = 开发中

其中 closed、resolved 和 active 都可以随意定义，它们表示分组名（groupname）。每一个分组名的值是一个以逗号（,）分格的列表，每一个元素都是一个状态名；也可以使用一次星号（*），它匹配了所有尚未指定的状态。每一个分组都有 order、query_args、overall_completion、label 和 css_class 五个属性供你设定，它们的意义如下：
1. order：决定了进度条中的显示次序，越小的数值越排在前面；
2. label：显示的名字；
3. css_class：css样式类名，可以通过增加 table.progress td.<class>这种形式的 selector 来定义；
4. query_args：前文说过点击进度条色块或 label 会打开一个任务单查询报表，这个参数的结果会附到那个报表的 url 之后，用来定制报表的，比如重载分组方式，可以使用 closed.query_args = group=resolution；
5. overall_completion：一个布尔值参数，标识在计算完成度时此组是否作为已完成状态的组。

参考网址：http://blog.csdn.net/gzlaiyonghao/article/details/6641391
