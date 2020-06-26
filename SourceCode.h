//  Top Module
	/*UartCore*/								`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/UartCore.v"
		/*CtrlCore*/							`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/CtrlCore.v"
		/*TxCore*/								`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/TxCore.v"
				/*FSM*/							`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/FSM.v"
				/*ShitfRegister*/				`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/ShiftRegister.v"
				/*ParityGenerator*/				`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/ParityGenerator.v"
				/*FIFO_ver2*/ 					`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/FIFO_ver2.v"
		/*RxCore*/								`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/RxCore.v"
				/*FSM_Rx*/						`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/FSM_Rx.v"
				/*ShiftRegister_Rx*/			`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/ShiftRegister_Rx.v"
				/*ByteAnalyseV2*/				`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/ByteAnalyseV2.v"
				/*AnsDelayTimeMeasure_ver2*/ 	`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/AnsDelayTimeMeasure_ver2.v"
				/*ParityGenerator*/				// Same with the TxCore
				/*FIFO_ver2*/					// Same with the TxCore
		/*BaurateModule*/ 						`include "E:/Javen/IP_Core_Develop/Uart/SourceCode/BaudrateModule_ver2.v"

