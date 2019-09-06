MODULE_NAME='SWITCHER_EXTRON_XTP'(DEV dvTP[], DEV dvSWITCHER, INTEGER cSW_IN_BS[], cSW_OUT_BS[])
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
	
	品牌：EXTRON
	型号：XTP II CROSSPOINT 3200
	视频切换模块
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
///////////////////////////////////////////////////////////////////////////////

DEFINE_FUNCTION update_out(INTEGER IN)
{
	INTEGER index;
	FOR(index = 1; index <= 32; index++)
	{
		IF(vSW_STA[index] = IN)
		{
			ON[dvTP,cSW_OUT_BS[index]];
		}
		ELSE
		{
			OFF[dvTP,cSW_OUT_BS[index]];
		}
	}
}

DEFINE_FUNCTION switcher(IN, OUT)
{
	SEND_STRING dvSWITCHER,"ITOA(IN),'*',ITOA(OUT),'!'"
	vSW_STA[OUT] = IN
}
///////////////////////////////////////////////////////////////////////////////


(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

DATA_EVENT[dvSWITCHER]
{
	ONLINE:
	{
		SEND_COMMAND dvSWITCHER,"'SET BAUD 9600,N,8,1'"
	}
}


BUTTON_EVENT[dvTP, cSW_IN_BS]
{
	vSW_IN_SEL = GET_LAST(cSW_IN_BS)
	ON[BUTTON.INPUT.DEVICE,BUTTON.INPUT.CHANNEL]
	update_out(vSW_IN_SEL)
}

BUTTON_EVENT[dvTP, cSW_OUT_BS]
{
	PUSH:
	{
		vSW_OUT_SEL = GET_LAST(cSW_OUT_BS)
		SWITCHER(vSW_IN_SEL, vSW_OUT_SEL)
		ON[BUTTON.INPUT.DEVICE, BUTTON.INPUT.CHANNEL]
	}
}


(*****************************************************************)
(*                                                               *)
(*                      !!!! WARNING !!!!                        *)
(*                                                               *)
(* Due to differences in the underlying architecture of the      *)
(* X-Series masters, changing variables in the DEFINE_PROGRAM    *)
(* section of code can negatively impact program performance.    *)
(*                                                               *)
(* See �Differences in DEFINE_PROGRAM Program Execution� section *)
(* of the NX-Series Controllers WebConsole & Programming Guide   *)
(* for additional and alternate coding methodologies.            *)
(*****************************************************************)

DEFINE_PROGRAM

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)
