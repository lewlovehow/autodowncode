::set 定义变量名赋值号之间不能有空格
@echo off
:input_url
set /p gihub_url= -------------请输入github地址--------------:
if "%gihub_url%"=="" (
echo 输入为空,请重新输入 
goto input_url
) ^
else (
set /p project_rename= -------------请为github项目取个名字--------------:
)
:input_install_path
set /p install_path= -------------请输入安装路径--------------:
if "%install_path%"=="" (
echo 输入为空,请重新输入
goto input_install_path 
)
::echo --------------获取安装盘符--------------
::截取第一个字符索引为0 双引号算字符 后面的丢弃
::从命令行输入的字符会原样赋给set 的变量不会添加双引号，无类型的语言
set disk_name=%install_path:~0,1%
set temp=":"
::因为我temp带来"" 但脚本语言不会识别变量类型会把双引号当字符所以从第二个字符截取
set disk_name=%disk_name%%temp:~1,1%
::echo --------------进入安装根目录 %disk_name%--------------
%disk_name%
if "%install_path:~2,1%"=="" (

set install_path=%disk_name%
cd %install_path%
) ^
else (
cd %install_path%

)

echo -------------安装信息--------------
echo 源码地址：%gihub_url%
echo 项目名称：%project_rename%
echo 安装位置：%install_path%
echo --------------准备开始请稍后--------------
::加速下载
set gihub_url=%gihub_url:com=com.cnpmjs.org%

echo 下载源码中
git clone %gihub_url% %project_rename%
echo 备份源码地址到文件： 源码地址.txt
cd %project_rename%
git remote -v > 源码地址.txt
echo --------------完成！！！已为您打开源码目录-主人--------------
start explorer %install_path%