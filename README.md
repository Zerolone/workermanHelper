自己用Delphi做了一个windows下监控文件修改自动重载workerman的工具

0、饮水思源，最近做项目用到了workerman，在windows下调试经常要重启，不方便，所以做了一个这样的工具。

1、通过设置文件， 可以设置需要监控的文件目录，文件后缀
会监控该目录下面所有子目录、所有文件的修改，
设定文件后缀的话， 就只监控设定的后缀

2、监控到文件有修改、添加、删除都算，自动重新加载workerman

3、估计swoole也可以用， 只要是需要重新加载命令行的都可以。

4、用的是Delphi7写的，所以不需要修改任何php环境，代码。

5、不放心怕有病毒的话，我把代码传到github上，可以自取。自行编译

6、写的很乱，只用了一晚上，所以没有考虑任何好用的地方。只在win10 64bit上面调试测试。

<img src="http://f.zerolone.com/workermanHelper/01.png">
<img src="http://f.zerolone.com/workermanHelper/02.png">
<img src="http://f.zerolone.com/workermanHelper/03.png">
<img src="http://f.zerolone.com/workermanHelper/04.png">
<img src="http://f.zerolone.com/workermanHelper/05.png">

![image](http://f.zerolone.com/workermanHelper/01.png)
