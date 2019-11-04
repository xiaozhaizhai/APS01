
package com.supcon.orchid.WOM.wsSyncPutInMaterial;

import java.math.BigDecimal;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Zmes008Stru2 complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="Zmes008Stru2"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="Aufnr" type="{urn:sap-com:document:sap:rfc:functions}char12"/&gt;
 *         &lt;element name="Datum" type="{urn:sap-com:document:sap:rfc:functions}date"/&gt;
 *         &lt;element name="Uzeit" type="{urn:sap-com:document:sap:rfc:functions}time"/&gt;
 *         &lt;element name="Numb" type="{urn:sap-com:document:sap:rfc:functions}char4"/&gt;
 *         &lt;element name="Uname" type="{urn:sap-com:document:sap:rfc:functions}char12"/&gt;
 *         &lt;element name="Mblnr" type="{urn:sap-com:document:sap:rfc:functions}char10"/&gt;
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
@XmlType(name = "Zmes008Stru2", propOrder = {
    "aufnr",
    "datum",
    "uzeit",
    "numb",
    "uname",
    "mblnr",
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
public class Zmes008Stru2 {

    @XmlElement(name = "Aufnr", required = true)
    protected String aufnr;
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
     * 获取aufnr属性的值。
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
     * 设置aufnr属性的值。
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
     * 获取datum属性的值。
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
     * 设置datum属性的值。
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
     * 获取uzeit属性的值。
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
     * 设置uzeit属性的值。
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
     * 获取numb属性的值。
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
     * 设置numb属性的值。
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
     * 获取uname属性的值。
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
     * 设置uname属性的值。
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
     * 获取mblnr属性的值。
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
     * 设置mblnr属性的值。
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
     * 获取budat属性的值。
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
     * 设置budat属性的值。
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
     * 获取werks属性的值。
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
     * 设置werks属性的值。
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
     * 获取matnr属性的值。
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
     * 设置matnr属性的值。
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
     * 获取menge属性的值。
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
     * 设置menge属性的值。
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
     * 获取meins属性的值。
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
     * 设置meins属性的值。
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
     * 获取charg属性的值。
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
     * 设置charg属性的值。
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
     * 获取lgort1属性的值。
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
     * 设置lgort1属性的值。
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
     * 获取reverse属性的值。
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
     * 设置reverse属性的值。
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
     * 获取sflag属性的值。
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
     * 设置sflag属性的值。
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
     * 获取message属性的值。
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
     * 设置message属性的值。
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
