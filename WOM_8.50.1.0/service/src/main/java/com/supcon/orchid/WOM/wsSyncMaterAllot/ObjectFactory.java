
package com.supcon.orchid.WOM.wsSyncMaterAllot;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the src package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: src
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ZMesGetStocktr }
     * 
     */
    public ZMesGetStocktr createZMesGetStocktr() {
        return new ZMesGetStocktr();
    }

    /**
     * Create an instance of {@link Zmes007Stru }
     * 
     */
    public Zmes007Stru createZmes007Stru() {
        return new Zmes007Stru();
    }

    /**
     * Create an instance of {@link ZMesGetStocktrResponse }
     * 
     */
    public ZMesGetStocktrResponse createZMesGetStocktrResponse() {
        return new ZMesGetStocktrResponse();
    }

}
