



f1::
postmessage, 0x100,88,2949121,, �ٶ��ǳ���
postmessage, 0x100, 0x30, 0xB0001 ,, �ٶ��ǳ���
postmessage, 0x100,67,3014657,, �ٶ��ǳ���
SLEEP, 1450
settimer,����,1000
settimer,��,9500
settimer,���,15500
settimer,ȥ÷,3500
settimer,����,3300
settimer,����,63500

settimer,��ȭ����,3500
settimer,��������,1500

settimer,���¹���,46500
settimer,��ȯ���,30000



loop
{
   postmessage, 0x100, 0x35, 0x60001 ,,�ٶ��ǳ��� 
   postmessage, 0x100 , 39, 21823489 ,, �ٶ��ǳ��� 
   postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
   sleep,100
   postmessage, 0x100, 0x31, 0x20001 ,, �ٶ��ǳ���
   postmessage, 0x100 , 39, 21823489 ,, �ٶ��ǳ���
   postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
   sleep,100
   postmessage,  0x100, 0x36, 0x70001 ,, �ٶ��ǳ���
   postmessage, 0x100 , 39, 21823489 ,, �ٶ��ǳ���
   postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
   sleep,200
 

   postmessage, 0x100, 0x36, 0x70001 ,,�ٶ��ǳ���
   postmessage, 0x100 , 39, 21823489 ,, �ٶ��ǳ���
   postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
   sleep,100
   postmessage, 0x100, 0x36, 0x70001 ,, �ٶ��ǳ���
   postmessage, 0x100 , 37, 21692417,, �ٶ��ǳ���
   postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
   sleep,100
   postmessage, 0x100, 0x31, 0x20001 ,, �ٶ��ǳ���
   postmessage, 0x100 , 37, 21692417,, �ٶ��ǳ���
   postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
   sleep,100


}
return

����:
postmessage, 0x100, 0x32, 0xB0001 ,, �ٶ��ǳ���
return

��:
postmessage, 0x100, 0x35, 0x60001 ,, �ٶ��ǳ���
postmessage, 0x100 , 39, 21823489 ,, �ٶ��ǳ���
postmessage, 0x100, 0x0D, ,, �ٶ��ǳ��� 
return

���:
postmessage, 0x100, 0x34, 0x50001 ,, �ٶ��ǳ���
postmessage, 0x100 , 39, 21823489 ,, �ٶ��ǳ���
postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
return

ȥ÷:
postmessage, 0x100,67,3014657,,�ٶ��ǳ���
postmessage, 0x100, 0x0D, ,, �ٶ��ǳ���
return

����:
critical
postmessage, 0x100, 0x30, 0xB0001 ,, �ٶ��ǳ���
sleep, 1000
return

����:
postmessage,0x100,66,3145729,,�ٶ��ǳ���
return



��ȭ����:


��������:



���¹���:
postmessage,0x100,84,1310721,,�ٶ��ǳ���
sleep, 600
return


��ȯ���:
postmessage,0x100,81,1048577 ,, �ٶ��ǳ���
sleep, 2500
return







f2::
reload
return