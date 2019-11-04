
package com.supcon.orchid.WOM.sapWs;

/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

import javax.xml.namespace.QName;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * This class was generated by Apache CXF 3.1.11
 * 2019-07-09T19:40:11.341+08:00
 * Generated source version: 3.1.11
 * 
 */
public final class ZFGMMNSHMES_ZFGMMNSHMES_Client {

    private static final QName SERVICE_NAME = new QName("urn:sap-com:document:sap:rfc:functions", "ZFG_MM_NSHMES");

    private ZFGMMNSHMES_ZFGMMNSHMES_Client() {
    }

    public static void main(String args[]) throws Exception {
        URL wsdlURL = ZFGMMNSHMES_Service.WSDL_LOCATION;
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

        ZFGMMNSHMES_Service ss = new ZFGMMNSHMES_Service(wsdlURL, SERVICE_NAME);
        ZFGMMNSHMES port = ss.getZFGMMNSHMES();

        {
        System.out.println("Invoking zfmMMNSHMES002...");
        String _zfmMMNSHMES002_input = "";
        String _zfmMMNSHMES002__return = port.zfmMMNSHMES002(_zfmMMNSHMES002_input);
        System.out.println("zfmMMNSHMES002.result=" + _zfmMMNSHMES002__return);


        }
        {
        System.out.println("Invoking zfmMMNSHMES003...");
        String _zfmMMNSHMES003_input = "";
        String _zfmMMNSHMES003__return = port.zfmMMNSHMES003(_zfmMMNSHMES003_input);
        System.out.println("zfmMMNSHMES003.result=" + _zfmMMNSHMES003__return);


        }
        {
        System.out.println("Invoking zfmMMNSHMES004...");
        String _zfmMMNSHMES004_input = "";
        String _zfmMMNSHMES004__return = port.zfmMMNSHMES004(_zfmMMNSHMES004_input);
        System.out.println("zfmMMNSHMES004.result=" + _zfmMMNSHMES004__return);


        }
        {
        System.out.println("Invoking zfmMMNSHMES005...");
        String _zfmMMNSHMES005_input = "";
        String _zfmMMNSHMES005__return = port.zfmMMNSHMES005(_zfmMMNSHMES005_input);
        System.out.println("zfmMMNSHMES005.result=" + _zfmMMNSHMES005__return);


        }
        {
        System.out.println("Invoking zfmMMNSHMES001...");
        String _zfmMMNSHMES001_input = "";
        String _zfmMMNSHMES001__return = port.zfmMMNSHMES001(_zfmMMNSHMES001_input);
        System.out.println("zfmMMNSHMES001.result=" + _zfmMMNSHMES001__return);


        }

        System.exit(0);
    }

}
