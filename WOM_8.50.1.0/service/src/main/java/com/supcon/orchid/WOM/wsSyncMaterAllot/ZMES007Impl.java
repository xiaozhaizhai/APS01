
/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

package com.supcon.orchid.WOM.wsSyncMaterAllot;

import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.12
 * 2017-07-29T17:19:38.507+08:00
 * Generated source version: 3.1.12
 * 
 */

@javax.jws.WebService(
                      serviceName = "ZMES007",
                      portName = "ZMES007",
                      targetNamespace = "urn:sap-com:document:sap:soap:functions:mc-style",
                      wsdlLocation = "file:/E:/sksintetface/pags/doc77.wsdl",
                      endpointInterface = "src.ZMES007")
                      
public class ZMES007Impl implements ZMES007 {

    private static final Logger LOG = Logger.getLogger(ZMES007Impl.class.getName());

    /* (non-Javadoc)
     * @see src.ZMES007#zMesGetStocktr(src.Zmes007Stru wInput, java.lang.String message, java.lang.String sflag)*
     */
    public void zMesGetStocktr(com.supcon.orchid.WOM.wsSyncMaterAllot.Zmes007Stru wInput, javax.xml.ws.Holder<java.lang.String> message, javax.xml.ws.Holder<java.lang.String> sflag) { 
        LOG.info("Executing operation zMesGetStocktr");
        System.out.println(wInput);
        try {
            java.lang.String messageValue = "";
            message.value = messageValue;
            java.lang.String sflagValue = "";
            sflag.value = sflagValue;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

}