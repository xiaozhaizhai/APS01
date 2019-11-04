package com.supcon.orchid.WOM.services;


public interface WsSyncWOMPutInMaterialService {
		//第八本      工单投料同步  传递指令单ID
	 void syncWOMPutInMaterial(long id);
     void sendSAP(Long id);
	 Boolean sendSAPforAction(Long LogId,Long ID);
}