package com.supcon.orchid.WOM.services;

public interface WsSyncWOMMaterAllotService {
	/*
	 * id 表头id   第七本
	 */
	void sendMaterAllot(Long id);
	void sendSAP(Long id);
	Boolean sendSAPforAction(Long LogId,Long ID);

}
