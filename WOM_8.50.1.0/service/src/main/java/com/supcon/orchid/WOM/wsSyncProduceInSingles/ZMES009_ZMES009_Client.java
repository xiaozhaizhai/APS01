package com.supcon.orchid.WOM.wsSyncProduceInSingles;

/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.11
 * 2017-06-19T14:21:48.573+08:00
 * Generated source version: 3.1.11
 * 
 */
public final class ZMES009_ZMES009_Client {

    private static final QName SERVICE_NAME = new QName("urn:sap-com:document:sap:soap:functions:mc-style", "ZMES009");

    private ZMES009_ZMES009_Client() {
    }

    public static void main(String args[]) throws java.lang.Exception {
        URL wsdlURL = ZMES009_Service.WSDL_LOCATION;
        if (args.length > 0 && args[0] != null && !"".equals(args[0])) { 
            File wsdlFile = new File(args[0]);
            try {
                if (wsdlFile.exists()) {
                    wsdlURL = wsdlFile.toURI().toURL();
                } else {
                    wsdlURL = new URL(args[0]);
                }
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }
        }
      
        ZMES009_Service ss = new ZMES009_Service(wsdlURL, SERVICE_NAME);
        ZMES009 port = ss.getZMES009();  
        
        {
        System.out.println("Invoking zMesGetGr...");
        Zmes009Stru _zMesGetGr_wInput = null;
        javax.xml.ws.Holder<java.lang.String> _zMesGetGr_message = new javax.xml.ws.Holder<java.lang.String>();
        javax.xml.ws.Holder<java.lang.String> _zMesGetGr_sflag = new javax.xml.ws.Holder<java.lang.String>();
        port.zMesGetGr(_zMesGetGr_wInput, _zMesGetGr_message, _zMesGetGr_sflag);

        System.out.println("zMesGetGr._zMesGetGr_message=" + _zMesGetGr_message.value);
        System.out.println("zMesGetGr._zMesGetGr_sflag=" + _zMesGetGr_sflag.value);

        }

        System.exit(0);
    }

}
