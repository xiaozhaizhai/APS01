package com.supcon.orchid.WOM.wsSyncProduceInSingles;

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
 *         &lt;element name="WInput" type="{urn:sap-com:document:sap:soap:functions:mc-style}Zmes009Stru"/&gt;
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
@XmlRootElement(name = "ZMesGetGr")
public class ZMesGetGr {

    @XmlElement(name = "WInput", required = true)
    protected Zmes009Stru wInput;

    /**
     * ��ȡwInput���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link Zmes009Stru }
     *     
     */
    public Zmes009Stru getWInput() {
        return wInput;
    }

    /**
     * ����wInput���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link Zmes009Stru }
     *     
     */
    public void setWInput(Zmes009Stru value) {
        this.wInput = value;
    }

}
