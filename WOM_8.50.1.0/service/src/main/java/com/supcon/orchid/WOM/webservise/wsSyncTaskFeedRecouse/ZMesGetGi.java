
package com.supcon.orchid.WOM.webservise.wsSyncTaskFeedRecouse;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�����ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="WInput" type="{urn:sap-com:document:sap:soap:functions:mc-style}Zmes008Stru2"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "wInput"
})
@XmlRootElement(name = "ZMesGetGi")
public class ZMesGetGi {

    @XmlElement(name = "WInput", required = true)
    protected Zmes008Stru2 wInput;

    /**
     * ��ȡwInput���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link Zmes008Stru2 }
     *     
     */
    public Zmes008Stru2 getWInput() {
        return wInput;
    }

    /**
     * ����wInput���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link Zmes008Stru2 }
     *     
     */
    public void setWInput(Zmes008Stru2 value) {
        this.wInput = value;
    }

}
