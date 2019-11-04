
package com.supcon.orchid.WOM.webservise.wsSyncMaterAllotRecouse;

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
 *         &lt;element name="WInput" type="{urn:sap-com:document:sap:soap:functions:mc-style}Zmes007Stru"/&gt;
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
@XmlRootElement(name = "ZMesGetStocktr")
public class ZMesGetStocktr {

    @XmlElement(name = "WInput", required = true)
    protected Zmes007Stru wInput;

    /**
     * ��ȡwInput���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link Zmes007Stru }
     *     
     */
    public Zmes007Stru getWInput() {
        return wInput;
    }

    /**
     * ����wInput���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link Zmes007Stru }
     *     
     */
    public void setWInput(Zmes007Stru value) {
        this.wInput = value;
    }

}
