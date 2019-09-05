MODULE_NAME='POLYCOM'(DEV dvTP[], DEV dvPOLYCOM, INTEGER cnPolycom_BS[])
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 04/04/2006  AT: 11:33:16        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    $History: $
*)
(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE

(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE

(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

DATA_EVENT[dvPOLYCOM]
{
    ONLINE:
    {
	SEND_COMMAND dvPOLYCOM,'SET BAUD 9600,N,8,1'
    }
}
BUTTON_EVENT[dvTP,cnPolycom_BS]
{
    PUSH:
    {
	SWITCH(GET_LAST(cnPolycom_BS))
	{
	    CASE 1:{SEND_STRING dvPOLYCOM,"'button 1',13,10"}
	    CASE 2:{SEND_STRING dvPOLYCOM,"'button 2',13,10"}
	    CASE 3:{SEND_STRING dvPOLYCOM,"'button 3',13,10"}
	    CASE 4:{SEND_STRING dvPOLYCOM,"'button 4',13,10"}
	    CASE 5:{SEND_STRING dvPOLYCOM,"'button 5',13,10"}
	    CASE 6:{SEND_STRING dvPOLYCOM,"'button 6',13,10"}
	    CASE 7:{SEND_STRING dvPOLYCOM,"'button 7',13,10"}
	    CASE 8:{SEND_STRING dvPOLYCOM,"'button 8',13,10"}
	    CASE 9:{SEND_STRING dvPOLYCOM,"'button 9',13,10"}
	    CASE 10:{SEND_STRING dvPOLYCOM,"'button 0',13,10"}
	    CASE 11:{SEND_STRING dvPOLYCOM,"'button *',13,10"}
	    CASE 12:{SEND_STRING dvPOLYCOM,"'button #',13,10"}
	    CASE 13:{SEND_STRING dvPOLYCOM,"'button auto',13,10"}
	    CASE 14:{SEND_STRING dvPOLYCOM,"'button back',13,10"}
	    CASE 15:{SEND_STRING dvPOLYCOM,"'button hangup',13,10"}
	    CASE 16:
	    {
		SEND_STRING dvPOLYCOM,"'button camera',13,10"
	    }
	    CASE 17:{SEND_STRING dvPOLYCOM,"'button delete',13,10"}
	    CASE 18:{SEND_STRING dvPOLYCOM,"'button directory',13,10"} //选项 //目录
	    CASE 19:
	    {
		    SEND_STRING dvPOLYCOM,"'button up',13,10"
	    }
	    CASE 20:
	    {
		    SEND_STRING dvPOLYCOM,"'button down',13,10"
	    }
	    CASE 21:
	    {
		    SEND_STRING dvPOLYCOM,"'button left',13,10"
	    }
	    CASE 22:
	    {
		    SEND_STRING dvPOLYCOM,"'button right',13,10"
	    }
	    CASE 23:{SEND_STRING dvPOLYCOM,"'button far',13,10"}		//远端 20
	    CASE 24:{SEND_STRING dvPOLYCOM,"'button near',13,10"}			//近端28
	    CASE 25:{SEND_STRING dvPOLYCOM,"'button graphics',13,10"}	//双流21 //内容
	    CASE 26:{SEND_STRING dvPOLYCOM,"'button home',13,10"}		//主页23
	    CASE 27:{SEND_STRING dvPOLYCOM,"'button keyboard',13,10"}
	    CASE 28:{SEND_STRING dvPOLYCOM,"'button mute',13,10"}
	    CASE 29:{SEND_STRING dvPOLYCOM,"'button period',13,10"}		//.29
	    CASE 30:{SEND_STRING dvPOLYCOM,"'button pip',13,10"}	//画中画
	    CASE 31:{SEND_STRING dvPOLYCOM,"'button select',13,10"}
	    CASE 32:{SEND_STRING dvPOLYCOM,"'button volume+',13,10"}
	    CASE 33:{SEND_STRING dvPOLYCOM,"'button volume-',13,10"}
	    CASE 34:{SEND_STRING dvPOLYCOM,"'button call',13,10"}

	    CASE 35:{SEND_STRING dvPOLYCOM,"'camera near move up',13,10"}
	    CASE 36:{SEND_STRING dvPOLYCOM,"'camera near move down',13,10"}
	    CASE 37:{SEND_STRING dvPOLYCOM,"'camera near move right',13,10"}
	    CASE 38:{SEND_STRING dvPOLYCOM,"'camera near move left',13,10"}
	    CASE 39:{SEND_STRING dvPOLYCOM,"'camera near move zoom+',13,10"}
	    CASE 40:{SEND_STRING dvPOLYCOM,"'camera near move zoom-',13,10"}
	}
    }
    HOLD[2,REPEAT]:
    {
	SWITCH(GET_LAST(cnPolycom_BS))
	{
	    CASE 17:{SEND_STRING dvPOLYCOM,"'button delete',13,10"}	//delete
//	    CASE 20:{SEND_STRING dvPOLYCOM,"'button down',13,10"}	//down
//	    CASE 21:{SEND_STRING dvPOLYCOM,"'button left',13,10"}	//left
//	    CASE 22:{SEND_STRING dvPOLYCOM,"'button right',13,10"}	//right
//	    CASE 19:{SEND_STRING dvPOLYCOM,"'button up',13,10"}		//up
	    CASE 32:{SEND_STRING dvPOLYCOM,"'button volume+',13,10"}
	    CASE 33:{SEND_STRING dvPOLYCOM,"'button volume-',13,10"}

	    CASE 19:{SEND_STRING dvPOLYCOM,"'camera near move up',13,10"} //35
	    CASE 20:{SEND_STRING dvPOLYCOM,"'camera near move down',13,10"}
	    CASE 21:{SEND_STRING dvPOLYCOM,"'camera near move right',13,10"}
	    CASE 22:{SEND_STRING dvPOLYCOM,"'camera near move left',13,10"} //38
	    CASE 39:{SEND_STRING dvPOLYCOM,"'camera near move zoom+',13,10"}
	    CASE 40:{SEND_STRING dvPOLYCOM,"'camera near move zoom-',13,10"}
	}
    }
    RELEASE:
    {
	SWITCH(GET_LAST(cnPolycom_BS))
	{
	    CASE 19:{SEND_STRING dvPOLYCOM,"'camera near stop',13,10"}
	    CASE 20:{SEND_STRING dvPOLYCOM,"'camera near stop',13,10"}
	    CASE 21:{SEND_STRING dvPOLYCOM,"'camera near stop',13,10"}
	    CASE 22:{SEND_STRING dvPOLYCOM,"'camera near stop',13,10"}
	    CASE 39:{SEND_STRING dvPOLYCOM,"'camera near stop',13,10"}
	    CASE 40:{SEND_STRING dvPOLYCOM,"'camera near stop',13,10"}

	}
    }
}


(***********************************************************)
(*            THE ACTUAL PROGRAM GOES BELOW                *)
(***********************************************************)
DEFINE_PROGRAM

(***********************************************************)
(*                     END OF PROGRAM                      *)
(*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
(***********************************************************)
