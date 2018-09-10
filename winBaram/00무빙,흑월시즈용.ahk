



f1::
postmessage, 0x100,88,2949121,, 바람의나라
postmessage, 0x100, 0x30, 0xB0001 ,, 바람의나라
postmessage, 0x100,67,3014657,, 바람의나라
SLEEP, 1450
settimer,공증,1000
settimer,헬,9500
settimer,삼매,15500
settimer,혼첨,3500
settimer,십자,3300
settimer,마기,63500

settimer,염화지옥,3500
settimer,서리한파,1500

settimer,마력방패,46500
settimer,생환대법,30000



loop
{
   postmessage, 0x100, 0x35, 0x60001 ,,바람의나라 
   postmessage, 0x100 , 39, 21823489 ,, 바람의나라 
   postmessage, 0x100, 0x0D, ,, 바람의나라
   sleep,100
   postmessage, 0x100, 0x31, 0x20001 ,, 바람의나라
   postmessage, 0x100 , 39, 21823489 ,, 바람의나라
   postmessage, 0x100, 0x0D, ,, 바람의나라
   sleep,100
   postmessage,  0x100, 0x36, 0x70001 ,, 바람의나라
   postmessage, 0x100 , 39, 21823489 ,, 바람의나라
   postmessage, 0x100, 0x0D, ,, 바람의나라
   sleep,200
 

   postmessage, 0x100, 0x36, 0x70001 ,,바람의나라
   postmessage, 0x100 , 39, 21823489 ,, 바람의나라
   postmessage, 0x100, 0x0D, ,, 바람의나라
   sleep,100
   postmessage, 0x100, 0x36, 0x70001 ,, 바람의나라
   postmessage, 0x100 , 37, 21692417,, 바람의나라
   postmessage, 0x100, 0x0D, ,, 바람의나라
   sleep,100
   postmessage, 0x100, 0x31, 0x20001 ,, 바람의나라
   postmessage, 0x100 , 37, 21692417,, 바람의나라
   postmessage, 0x100, 0x0D, ,, 바람의나라
   sleep,100


}
return

공증:
postmessage, 0x100, 0x32, 0xB0001 ,, 바람의나라
return

헬:
postmessage, 0x100, 0x35, 0x60001 ,, 바람의나라
postmessage, 0x100 , 39, 21823489 ,, 바람의나라
postmessage, 0x100, 0x0D, ,, 바람의나라 
return

삼매:
postmessage, 0x100, 0x34, 0x50001 ,, 바람의나라
postmessage, 0x100 , 39, 21823489 ,, 바람의나라
postmessage, 0x100, 0x0D, ,, 바람의나라
return

혼첨:
postmessage, 0x100,67,3014657,,바람의나라
postmessage, 0x100, 0x0D, ,, 바람의나라
return

십자:
critical
postmessage, 0x100, 0x30, 0xB0001 ,, 바람의나라
sleep, 1000
return

마기:
postmessage,0x100,66,3145729,,바람의나라
return



염화지옥:


서리한파:



마력방패:
postmessage,0x100,84,1310721,,바람의나라
sleep, 600
return


생환대법:
postmessage,0x100,81,1048577 ,, 바람의나라
sleep, 2500
return







f2::
reload
return