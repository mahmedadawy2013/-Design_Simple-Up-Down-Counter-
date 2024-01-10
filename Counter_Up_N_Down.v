/******************************************************************************
*
* Module: Private - 5 bit-Counter
*
* File Name: Counter_Up_N_Down.v
*
* Description:  this file is used for implementation od the counter to count
*               down and To Count up or puting a value inside the counter 
*               and geting Flag output 
*
* Author: Mohamed A. Eladawy
*
*******************************************************************************/
module Counter_Up_N_down (   //Starting the Module and Declaring its name 

//********************Port Declaration*************************//

input wire [4 : 0] IN , //Declaring the Variable As an Input Port 
input wire LOAD ,       //Declaring the Variable As an Input Port 
input wire UP ,         //Declaring the Variable As an Input Port 
input wire DOWN ,       //Declaring the Variable As an Input Port 
input wire CLK ,        //Declaring the Variable As an Input Port 
output wire FLAG_High , //Declaring the Variable As an Output Port 
output wire FLAG_LOW ,  //Declaring the Variable As an Output Port 

//********************Internal Signal Declaration*****************//

reg [4 : 0 ] COUNTER    //Declaring the Variable As a register to use it In always Block 

);

//****************************************************************//

//*************************The RTL Code***************************//

/********************Starting The Always Block********************/

always @ (*)  //Declaring the always block without **sensitivity list** 

 begin

/*****************************************************
*Count value loaded from `IN? on a positive clock 
*edge when `LOAD? signal is high, LOAD has High priority
*Count value decremented by 1 on a positive clock 
*edge while `Down? signal is high. 
*Count value incremented by 1 on a positive clock 
*edge while `UP ? signal is high. 
*decrement stops at 0 
*Increment stops at 31
******************************************************/   
   if ( LOAD )                           //Check If the Load Signal Is Equal To one Or Not 
     begin                               //Stating If Condition 
     COUNTER <= IN ;                     //Loading the Counter With the Value Of IN
     end                                 //Ending If Condition 
 else if ( DOWN && COUNTER != FLAG_LOW ) //Check If the Down Signal Is Equal To one Or Not && the Value Of counter is zero or not
   begin                                 //Stating Else If Condition 
     COUNTER <= COUNTER - 4'b0001  ;     //Decrementing the Value Of the Counter With One 
   end                                   //Ending Else If Condition 
 else if ( UP && COUNTER != FLAG_High)   //Check If the Up Signal Is Equal To one Or Not && the Value Of counter is 31 or not
   begin                                 //Stating Else If Condition
     COUNTER <= COUNTER + 1 ;            //Incrementing the Value Of the Counter With One  
   end                                   //Ending Else If Condition
    
end   

/*********************ending The Always Block*********************/ 

/*****************************************************
*this is an assign statement to make 
*`LOW ? flag active high whenever count value is 0 
******************************************************/  

assign FLAG_LOW = (COUNTER == 4'b0) ;


/******************************************************/

/*****************************************************
*this is an assign statement to make 
*`High ? flag active high whenever count value is 31 
******************************************************/  

assign FLAG_High = (COUNTER == 5'b11111) ;


/******************************************************/
endmodule //Ending the Module
 


