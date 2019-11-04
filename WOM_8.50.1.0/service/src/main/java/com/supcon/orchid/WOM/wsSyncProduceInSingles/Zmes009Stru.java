package com.supcon.orchid.WOM.wsSyncProduceInSingles;

import java.math.BigDecimal;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Zmes009Stru complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�����ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="Zmes009Stru"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="Datum" type="{urn:sap-com:document:sap:rfc:functions}date"/&gt;
 *         &lt;element name="Uzeit" type="{urn:sap-com:document:sap:rfc:functions}time"/&gt;
 *         &lt;element name="Numb" type="{urn:sap-com:document:sap:rfc:functions}char4"/&gt;
 *         &lt;element name="Uname" type="{urn:sap-com:document:sap:rfc:functions}char12"/&gt;
 *         &lt;element name="Mblnr" type="{urn:sap-com:document:sap:rfc:functions}char10"/&gt;
 *         &lt;element name="Aufnr" type="{urn:sap-com:document:sap:rfc:functions}char12"/&gt;
 *         &lt;element name="Budat" type="{urn:sap-com:document:sap:rfc:functions}date"/&gt;
 *         &lt;element name="Werks" type="{urn:sap-com:document:sap:rfc:functions}char4"/&gt;
 *         &lt;element name="Matnr" type="{urn:sap-com:document:sap:rfc:functions}char18"/&gt;
 *         &lt;element name="Menge" type="{urn:sap-com:document:sap:rfc:functions}quantum13.3"/&gt;
 *         &lt;element name="Meins" type="{urn:sap-com:document:sap:rfc:functions}unit3"/&gt;
 *         &lt;element name="Charg" type="{urn:sap-com:document:sap:rfc:functions}char10"/&gt;
 *         &lt;element name="Lgort1" type="{urn:sap-com:document:sap:rfc:functions}char4"/&gt;
 *         &lt;element name="Reverse" type="{urn:sap-com:document:sap:rfc:functions}char1"/&gt;
 *         &lt;element name="Sflag" type="{urn:sap-com:document:sap:rfc:functions}char1"/&gt;
 *         &lt;element name="Message" type="{urn:sap-com:document:sap:rfc:functions}char255"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Zmes009Stru", propOrder = {
    "datum",
    "uzeit",
    "numb",
    "uname",
    "mblnr",
    "aufnr",
    "budat",
    "werks",
    "matnr",
    "menge",
    "meins",
    "charg",
    "lgort1",
    "reverse",
    "sflag",
    "message"
})
public class Zmes009Stru {

    @XmlElement(name = "Datum", required = true)
    protected String datum;
    @XmlElement(name = "Uzeit", required = true)
    protected String uzeit;
    @XmlElement(name = "Numb", required = true)
    protected String numb;
    @XmlElement(name = "Uname", required = true)
    protected String uname;
    @XmlElement(name = "Mblnr", required = true)
    protected String mblnr;
    @XmlElement(name = "Aufnr", required = true)
    protected String aufnr;
    @XmlElement(name = "Budat", required = true)
    protected String budat;
    @XmlElement(name = "Werks", required = true)
    protected String werks;
    @XmlElement(name = "Matnr", required = true)
    protected String matnr;
    @XmlElement(name = "Menge", required = true)
    protected BigDecimal menge;
    @XmlElement(name = "Meins", required = true)
    protected String meins;
    @XmlElement(name = "Charg", required = true)
    protected String charg;
    @XmlElement(name = "Lgort1", required = true)
    protected String lgort1;
    @XmlElement(name = "Reverse", required = true)
    protected String reverse;
    @XmlElement(name = "Sflag", required = true)
    protected String sflag;
    @XmlElement(name = "Message", required = true)
    protected String message;

    /**
     * ��ȡdatum���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDatum() {
        return datum;
    }

    /**
     * ����datum���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDatum(String value) {
        this.datum = value;
    }

    /**
     * ��ȡuzeit���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUzeit() {
        return uzeit;
    }

    /**
     * ����uzeit���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUzeit(String value) {
        this.uzeit = value;
    }

    /**
     * ��ȡnumb���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumb() {
        return numb;
    }

    /**
     * ����numb���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumb(String value) {
        this.numb = value;
    }

    /**
     * ��ȡuname���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUname() {
        return uname;
    }

    /**
     * ����uname���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUname(String value) {
        this.uname = value;
    }

    /**
     * ��ȡmblnr���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMblnr() {
        return mblnr;
    }

    /**
     * ����mblnr���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMblnr(String value) {
        this.mblnr = value;
    }

    /**
     * ��ȡaufnr���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAufnr() {
        return aufnr;
    }

    /**
     * ����aufnr���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAufnr(String value) {
        this.aufnr = value;
    }

    /**
     * ��ȡbudat���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBudat() {
        return budat;
    }

    /**
     * ����budat���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBudat(String value) {
        this.budat = value;
    }

    /**
     * ��ȡwerks���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getWerks() {
        return werks;
    }

    /**
     * ����werks���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setWerks(String value) {
        this.werks = value;
    }

    /**
     * ��ȡmatnr���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMatnr() {
        return matnr;
    }

    /**
     * ����matnr���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMatnr(String value) {
        this.matnr = value;
    }

    /**
     * ��ȡmenge���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    public BigDecimal getMenge() {
        return menge;
    }

    /**
     * ����menge���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setMenge(BigDecimal value) {
        this.menge = value;
    }

    /**
     * ��ȡmeins���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMeins() {
        return meins;
    }

    /**
     * ����meins���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMeins(String value) {
        this.meins = value;
    }

    /**
     * ��ȡcharg���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCharg() {
        return charg;
    }

    /**
     * ����charg���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCharg(String value) {
        this.charg = value;
    }

    /**
     * ��ȡlgort1���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLgort1() {
        return lgort1;
    }

    /**
     * ����lgort1���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLgort1(String value) {
        this.lgort1 = value;
    }

    /**
     * ��ȡreverse���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReverse() {
        return reverse;
    }

    /**
     * ����reverse���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReverse(String value) {
        this.reverse = value;
    }

    /**
     * ��ȡsflag���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSflag() {
        return sflag;
    }

    /**
     * ����sflag���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSflag(String value) {
        this.sflag = value;
    }

    /**
     * ��ȡmessage���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMessage() {
        return message;
    }

    /**
     * ����message���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMessage(String value) {
        this.message = value;
    }

}
