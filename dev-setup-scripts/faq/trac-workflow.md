工作流的主线 new->accepted->resolved->closed
增加了一个 resolved 状态，它表示开发团队认为该功能已经开发完成或缺陷已经修复，并交由 QA 团队跟进测试
只有 resovled 的 ticket 才能转换到 closed，这个动作叫 test，明确地把 QA 的重要性体现了出来，也体现了从提出问题->解决问题->验证方案->结案记录的完备流程。
最后，给出工作流的完整配置：

[ticket-workflow]
leave = * -> *
leave.default = 1
leave.operations = leave_status

accept = new,assigned -> accepted
accept.operations = set_owner_to_self
accept.permissions = TICKET_MODIFY

reassign = new,assigned,accepted,resolved -> assigned
reassign.operations = set_owner
reassign.permissions = TICKET_MODIFY

reopen = closed -> assigned
reopen.operations = del_resolution,set_owner
reopen.permissions = TICKET_CREATE

resolve = assigned,accepted,resolved -> resolved
resolve.operations = set_owner
resolve.permissions = TICKET_MODIFY
resolve.set_owner = tester1, tester2

test = resolved -> closed
test.operations = set_resolution
test.permissions = TICKET_MODIFY

参考网址：http://blog.csdn.net/gzlaiyonghao/article/details/6620098


