package com.supcon.orchid.WOM.wsSyncPutInMaterial;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.12
 * 2017-08-04T21:59:13.258+08:00
 * Generated source version: 3.1.12
 * 
 */
@WebService(targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", name = "ZMES008")
@XmlSeeAlso({ObjectFactory.class})
public interface ZMES008 {

    @RequestWrapper(localName = "ZMesGetGi", targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", className = "com.supcon.orchid.WOM.wsSyncPutInMaterial.ZMesGetGi")
    @WebMethod(operationName = "ZMesGetGi")
    @ResponseWrapper(localName = "ZMesGetGiResponse", targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style", className = "com.supcon.orchid.WOM.wsSyncPutInMaterial.ZMesGetGiResponse")
    public void zMesGetGi(
        @WebParam(name = "WInput", targetNamespace = "")
        com.supcon.orchid.WOM.wsSyncPutInMaterial.Zmes008Stru2 wInput,
        @WebParam(mode = WebParam.Mode.OUT, name = "Message", targetNamespace = "")
        javax.xml.ws.Holder<java.lang.String> message,
        @WebParam(mode = WebParam.Mode.OUT, name = "Sflag", targetNamespace = "")
        javax.xml.ws.Holder<java.lang.String> sflag
    );
}
