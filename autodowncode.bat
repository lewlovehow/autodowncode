::set �����������ֵ��֮�䲻���пո�
@echo off
:input_url
set /p gihub_url= -------------������github��ַ--------------:
if "%gihub_url%"=="" (
echo ����Ϊ��,���������� 
goto input_url
) ^
else (
set /p project_rename= -------------��Ϊgithub��Ŀȡ������--------------:
)
:input_install_path
set /p install_path= -------------�����밲װ·��--------------:
if "%install_path%"=="" (
echo ����Ϊ��,����������
goto input_install_path 
)
::echo --------------��ȡ��װ�̷�--------------
::��ȡ��һ���ַ�����Ϊ0 ˫�������ַ� ����Ķ���
::��������������ַ���ԭ������set �ı����������˫���ţ������͵�����
set disk_name=%install_path:~0,1%
set temp=":"
::��Ϊ��temp����"" ���ű����Բ���ʶ��������ͻ��˫���ŵ��ַ����Դӵڶ����ַ���ȡ
set disk_name=%disk_name%%temp:~1,1%
::echo --------------���밲װ��Ŀ¼ %disk_name%--------------
%disk_name%
if "%install_path:~2,1%"=="" (

set install_path=%disk_name%
cd %install_path%
) ^
else (
cd %install_path%

)

echo -------------��װ��Ϣ--------------
echo Դ���ַ��%gihub_url%
echo ��Ŀ���ƣ�%project_rename%
echo ��װλ�ã�%install_path%
echo --------------׼����ʼ���Ժ�--------------
::��������
set gihub_url=%gihub_url:com=com.cnpmjs.org%

echo ����Դ����
git clone %gihub_url% %project_rename%
echo ����Դ���ַ���ļ��� Դ���ַ.txt
cd %project_rename%
git remote -v > Դ���ַ.txt
echo --------------��ɣ�������Ϊ����Դ��Ŀ¼-����--------------
start explorer %install_path%