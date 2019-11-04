package com.supcon.orchid.WOM.services;

public interface WSSyncTaskPayService {
	//第九本 工单缴库同步，传入制造指令单id
      void sendSAP(Long id);
      Boolean sendSAPforAction(Long LogId,Long id);
}
