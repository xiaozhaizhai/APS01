package com.supcon.orchid.MESBasic.services.impl;

import com.supcon.orchid.MESBasic.daos.MESBasicBatchDataDao;
import com.supcon.orchid.MESBasic.daos.MESBasicOriginalSignalDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicOriginalSignal;
import com.supcon.orchid.MESBasic.services.MESBasicBatchDataService;
import com.supcon.orchid.MESBasic.services.MESBasicOriginalSignalService;
import com.supcon.orchid.MESBasic.services.MESBasicSignalDataTask;
import com.supcon.orchid.foundation.entities.SystemCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.math.BigDecimal;


@Service("mESBasicSignalDataTask")
public class MESBasicSignalDataTaskImpl implements MESBasicSignalDataTask {

    private static final Logger logger = LoggerFactory.getLogger(MESBasicSignalDataTaskImpl.class);

    @Autowired
    private MESBasicOriginalSignalService signalService;

    @Autowired
    private MESBasicOriginalSignalDao signalDao;

    @Autowired
    private MESBasicBatchDataDao dataDao;

    @Autowired
    private MESBasicBatchDataService dataService;

    @Override
    @Transactional( propagation = Propagation.REQUIRES_NEW)
    public void batchDeal() {
        logger.info("时间" + new Date() + ",调度开始");
        try {
        List<Object> list = null;
        //String sql = "MARK = 2 AND TVALUE IS NOT NULL AND SOURCE = 'MESignalSourcec/001'";    
        String sql = "MARK = 2 order by occur_time asc"; 
        List<MESBasicOriginalSignal> signals = signalService.getOriginalSignals(sql, list);

        for (MESBasicOriginalSignal signal : signals) {
                Long id = signal.getId();
                Date date = signal.getOccurTime();
                String tagName = signal.getTagName();
                SystemCode source = signal.getSource();
                String content = "";
                String purchaseCode = "";
                String tvalue = signal.getTvalue();

                if (tvalue.indexOf("&") != -1) {
                    String s1 = tvalue.split("&")[1];//切割成 BN=000000 格式
                    tvalue = tvalue.split("&")[0];//分离左侧，在下面逻辑插入到接口表
                  

                    if (s1.indexOf("=") != -1) {
                        content = s1;//含“=”赋值给content
                        purchaseCode = content.split("=")[1];//分解content,把右边赋值给purchaseCode

                    } else {
                        purchaseCode = s1;
                    }

                }
                //存储到数据接口表中
                MESBasicBatchData data = new MESBasicBatchData();
                data.setTvalue(tvalue);
                data.setOriginalSignalId(id);
                data.setDataTime(date);
                data.setTag(tagName);
                data.setSignalSource(source);
              	data.setCid(1000L);
				data.setBusinessType(new SystemCode("Business_Type/2"));
              
                if (purchaseCode != "" && purchaseCode != null) {
                    data.setPurchaseCode(purchaseCode);
                }
                if (content != "" && content != null) {
                    data.setContent(content);
                }
                dataDao.save(data);
                dataDao.flush();
                dataDao.clear();

                //把mark设为3 (已处理)
                signal.setMark(3);
                signalDao.save(signal);
                signalDao.flush();
                signalDao.clear();
        }
        } catch (Exception e) {

            logger.info("调度异常" + e.getMessage());
        }
        logger.info("时间" + new Date() + ",调度结束");
    }

	@Override
    @Transactional( propagation = Propagation.REQUIRES_NEW)
    public void markDeal() {
    	logger.info("时间" + new Date() + ",originalSignat表，MARK调度开始");
        try {
        	List<Object> list = null;
        	String sql = "MARK = null";        
        	List<MESBasicOriginalSignal> signals = signalService.getOriginalSignals(sql, list);
        	for (MESBasicOriginalSignal signal : signals) {
        		Long quality = signal.getQuality();
              	String fv =  signal.getFv();
              	signal.setSource(new SystemCode("MESignalSourcec/001"));
              
              	if(fv != null && fv.length() > 0 && Integer.valueOf(fv) == 1){
        			signal.setMark(1);
        			signalDao.save(signal);
        			continue;
        		}
              
        		if(quality != 0){
        			signal.setMark(1);
        			signalDao.save(signal);
        			continue;
        		}else{
        			String tvalue = signal.getTvalue();
        			if(isBigDecimal(tvalue)){
        				BigDecimal tvalueDecimal = new BigDecimal(tvalue);
        				if(tvalueDecimal.compareTo(BigDecimal.ZERO) == -1){
        					signal.setMark(1);
        					signalDao.save(signal);
        					continue;
        				}
        			}
        			String qc = signal.getQc();
        			if(qc.equals("0")){
        				signal.setMark(2);
        				signalDao.save(signal);
    					continue;
        			}
        			if(qc.equals("2")){
        				String sql2 = "tagName = '" + signal.getTagName() + "' and quality = 0 and id < " 
        						+ signal.getId() + " order by id desc" ;        
        	        	List<MESBasicOriginalSignal> signals2 = signalService.getOriginalSignals(sql2, list);
        	        	if(signals2 != null & signals2.size() > 0){
        	        		MESBasicOriginalSignal signal2 = signals2.get(0);
        	        		if(signal2.getTvalue() != null && signal2.getTvalue().equals(signal.getTvalue())){
        	        			signal.setMark(1);
        	        			signalDao.save(signal);
            					continue;
        	        		}else{
        	        			signal.setMark(2);
        	        			signalDao.save(signal);
            					continue;
        	        		}
        	        	}else{
        	        		signal.setMark(1);
        	        		signalDao.save(signal);
        					continue;
        	        	}
        			}
        		}
        	}
        } catch (Exception e) {
            logger.info("调度异常" + e.getMessage());
        }
        logger.info("时间" + new Date() + ",originalSignat表，MARK调度结束");
    	
    }



    public static boolean isBigDecimal(String str){
    	if(str==null || str.trim().length() == 0){
    		return false;
    	}
    	char[] chars = str.toCharArray();
    	int sz = chars.length;
    	int i = (chars[0] == '-') ? 1 : 0;
    	if(i == sz) return false;
    	
    	if(chars[i] == '.') return false;//除了负号，第一位不能为'小数点'
    	
    	boolean radixPoint = false;
    	for(; i < sz; i++){
    		if(chars[i] == '.'){
    			if(radixPoint) return false;
    			radixPoint = true;
    		}else if(!(chars[i] >= '0' && chars[i] <= '9')){
    			return false;
    		}
    	}
    	return true;
    }
}
