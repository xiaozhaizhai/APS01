package com.supcon.orchid.WOM.wsSyncMaterAllot;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.12
 * 2017-07-29T17:19:38.524+08:00
 * Generated source version: 3.1.12
 * 
 */
@WebService(targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", name = "ZMES007")
@XmlSeeAlso({ObjectFactory.class})
public interface ZMES007 {

    @RequestWrapper(localName = "ZMesGetStocktr", targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", className = "src.ZMesGetStocktr")
    @WebMethod(operationName = "ZMesGetStocktr")
    @ResponseWrapper(localName = "ZMesGetStocktrResponse", targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", className = "src.ZMesGetStocktrResponse")
    public void zMesGetStocktr(
        @WebParam(name = "WInput", targetNamespace = "")
        com.supcon.orchid.WOM.wsSyncMaterAllot.Zmes007Stru wInput,
        @WebParam(mode = WebParam.Mode.OUT, name = "Message", targetNamespace = "")
        javax.xml.ws.Holder<java.lang.String> message,
        @WebParam(mode = WebParam.Mode.OUT, name = "Sflag", targetNamespace = "")
        javax.xml.ws.Holder<java.lang.String> sflag
    );
}