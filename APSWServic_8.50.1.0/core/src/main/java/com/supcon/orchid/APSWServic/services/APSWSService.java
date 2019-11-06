package com.supcon.orchid.APSWServic.services;

import java.util.ArrayList;
import java.util.HashMap;


import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;


import com.supcon.orchid.foundation.ws.entities.JWSResultDTO;
import com.supcon.orchid.foundation.ws.entities.PageValueDTO;
import com.supcon.orchid.foundation.ws.entities.SimulationMap;


@WebService(targetNamespace = "http://ws.supcon.com")
@XmlSeeAlso({ArrayList.class, PageValueDTO.class, HashMap.class, SimulationMap.class})
public interface APSWSService {


	/**
	 * 获取MES物品接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO getProduct(@WebParam(name = "json") String json);

	/**
	 * 获取配方接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO getFormula(@WebParam(name = "json") String json);

	/**
	 * 获取工序接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO getFormulaProcess(@WebParam(name = "json") String json);
  	/**
	 * APS下推工单接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO saveProduceTask(@WebParam(name = "json") String json);
  
  	/**
	 * 获取资源接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO getResourceInfo(@WebParam(name = "json") String json);
  
  	/**
	 * 获取工序设备对应关系接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO getOpResource(@WebParam(name = "json") String json);
  
  /**
	 * 4. 获取报工接口
	 * @param json
	 * @return json
	 */
	@WebMethod
	@WebResult(name = "jwsResult")
	JWSResultDTO getTaskReporting(@WebParam(name = "json") String json);
  

}