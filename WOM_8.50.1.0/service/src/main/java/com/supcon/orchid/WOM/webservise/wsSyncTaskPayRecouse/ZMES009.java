package com.supcon.orchid.WOM.webservise.wsSyncTaskPayRecouse;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.12
 * 2017-07-31T09:10:06.745+08:00
 * Generated source version: 3.1.12
 * 
 */
@WebService(targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", name = "ZMES009")
@XmlSeeAlso({ObjectFactory.class})
public interface ZMES009 {

    @RequestWrapper(localName = "ZMesGetGr", targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", className = "com.supcon.orchid.WOM.wsSyncTaskReporting.ZMesGetGr")
    @WebMethod(operationName = "ZMesGetGr")
    @ResponseWrapper(localName = "ZMesGetGrResponse", targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", className = "com.supcon.orchid.WOM.wsSyncTaskReporting.ZMesGetGrResponse")
    public void zMesGetGr(
        @WebParam(name = "WInput", targetNamespace = "")
        com.supcon.orchid.WOM.webservise.wsSyncTaskPayRecouse.Zmes009Stru wInput,
        @WebParam(mode = WebParam.Mode.OUT, name = "Message", targetNamespace = "")
        javax.xml.ws.Holder<java.lang.String> message,
        @WebParam(mode = WebParam.Mode.OUT, name = "Sflag", targetNamespace = "")
        javax.xml.ws.Holder<java.lang.String> sflag
    );
}
