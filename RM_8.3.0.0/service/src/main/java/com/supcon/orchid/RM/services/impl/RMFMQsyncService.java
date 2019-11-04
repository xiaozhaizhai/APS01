package com.supcon.orchid.RM.services.impl;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.RM.daos.RMMQDealinfoDao;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.services.RMMQDealinfoService;

@Service("rMFMQsyncService")
public class RMFMQsyncService implements MessageListener{

	protected final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private RMMQDealinfoService mQDealinfoService;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void onMessage(Message msg)  {
		if(msg instanceof BytesMessage){ //接收字节消息     
			RMMQDealinfo mqdealinfo=new RMMQDealinfo();
            byte[] b = new byte[2048];
            byte[] byte4 = new byte[4];
            byte[] byte8 = new byte[8];
            int len = -1;     
            BytesMessage message = (BytesMessage)msg;   
            try {
				long length=message.getBodyLength();
				b=new byte[Integer.parseInt(String.valueOf(length))];     
			} catch (JMSException e1) {
				log.error(e1.getMessage(),e1);
				e1.printStackTrace();
			}
            try {
            	message.readBytes(byte4);
            	String messageId = bytes2HexString(byte4);
            	
            	message.readBytes(byte4);
            	
            	message.readBytes(byte4);
            	
            	message.readBytes(byte8);
            	
            	message.readBytes(byte4);
            	int plantSize = byte2int(byte4);
            	if(plantSize > 0){
            		byte[] plantInfo = new byte[plantSize];	
            		message.readBytes(plantInfo);
            		//while((len=message.readBytes(plantInfo))!=-1){ 
	            		try {
	    				    String data=new String(plantInfo, 0, plantSize, "GB2312");
	    				    if(plantSize > 0){
	    				    	String origin = data.substring(0,plantSize);
	    				    	mqdealinfo.setOrigin(origin);
	    				    }
	    				 }catch (UnsupportedEncodingException e) {
	    					log.error(e.getMessage(),e);
	    					e.printStackTrace();
	    				} 
            		//}
            	}
            	
            	message.readBytes(byte4);        	
            	int bodySize = byte2int(byte4);
            	//byte[] bodyInfo = new byte[plantSize+1];
            	
            	/*
            	 * hard to translate byte to String or sth 
            	 * so i do it that way
            	 * but if u try
            	 * hope u willnot go nuts
            	 * 
            	 * */
				while((len=message.readBytes(b))!=-1 && messageId != null && messageId.length() > 0){  
				    try {
				    	
				    	String data=new String(b, 0, len, "GB2312");
				    	
				    	/*if(plantSize > 0){
				    		String origin = data.substring(0,plantSize);
				    		mqdealinfo.setOrigin(origin);
				    	}*/
				    	
				    	if(data.contains("{") && data.indexOf("{")!=0){
				    		data = data.substring(data.indexOf("{"),data.length());
				    	}
				    	mqdealinfo.setCreateTime(new Date());
				    	if(messageId.equals("01000100")){
					    	mqdealinfo.setMqValue(data);
					    	mqdealinfo.setObjectType("RMFormula");
				    	}else{
				    		mqdealinfo.setObjectType("workOrder");
				    		if(messageId.equals("01000200")){
				    			mqdealinfo.setMqValue("00020001"+data);
				    		}else if(messageId.equals("02000200")){
				    			mqdealinfo.setMqValue("00020002"+data);
				    		}else if(messageId.equals("03000200")){
				    			mqdealinfo.setMqValue("00020003"+data);
				    		}else if(messageId.equals("04000200")){
				    			mqdealinfo.setMqValue("00020004"+data);
				    		}else if(messageId.equals("05000200")){
				    			mqdealinfo.setMqValue("00020005"+data);
				    		}else if(messageId.equals("06000200")){
				    			mqdealinfo.setMqValue("00020006"+data);
				    		}else if(messageId.equals("07000200")){
				    			mqdealinfo.setMqValue("00020007"+data);
				    		}
				    	}
				    	mQDealinfoService.save(mqdealinfo);
				    	return;
					} catch (UnsupportedEncodingException e) {
						log.error(e.getMessage(),e);
						e.printStackTrace();
					}     
				}
			} catch (JMSException e) {
				log.error(e.getMessage(),e);
				e.printStackTrace();
			}   
		}
	}
	
	public String bytes2HexString(byte[] b){
		String ret = "";
		for(int i = 0; i <b.length;i++){
			String hex = Integer.toHexString(b[i] & 0xFF);
			if(hex.length() == 1){
				hex = '0' + hex;
			}
			ret += hex.toUpperCase();
		}
		return ret;
	}
	
	public int byte2int(byte[] res) {   
		// 一个byte数据左移24位变成0x??000000，再右移8位变成0x00??0000 
		int targets = (res[0] & 0xff) | ((res[1] << 8) & 0xff00) // | 表示安位或   
		| ((res[2] << 24) >>> 8) | (res[3] << 24);   
		return targets;   
	}   
	
}
