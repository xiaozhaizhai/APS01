
<#if customPropData?? && (customPropData?size>0) >
<#assign customProperties = customPropData.properties />
<#assign customStyleCodes = customPropData.styleCodes />
<#assign customStyleFormates = customPropData.styleFormats />
</#if>
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
	xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"
	xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40"
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>zhangbobin</Author>
		<Created>2015-07-16T18:33:57</Created>
	</DocumentProperties>
	<CustomDocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<KSOProductBuildVer dt:dt="string">2052-9.1.0.4167
		</KSOProductBuildVer>
	</CustomDocumentProperties>
	<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowWidth>20940</WindowWidth>
		<WindowHeight>10320</WindowHeight>
		<ProtectStructure>False</ProtectStructure>
		<ProtectWindows>False</ProtectWindows>
	</ExcelWorkbook>
	<Styles>
		<Style ss:ID="Default" ss:Name="Normal">
		<Alignment/>
		<Borders/>
		<Font ss:FontName="Arial" x:CharSet="134" ss:Size="10"/>
		<Interior/>
		<NumberFormat/>
		<Protection/>
	</Style>
	<Style ss:ID="s4">
		<NumberFormat ss:Format="_ * #,##0.00_ ;_ * -#,##0.00_ ;_ * &quot;-&quot;??_ ;_ @_ "/>
		<Protection/>
	</Style>
	<Style ss:ID="s5">
		<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0.00_ ;_ &quot;￥&quot;* -#,##0.00_ ;_ &quot;￥&quot;* &quot;-&quot;??_ ;_ @_ "/>
		<Protection/>
	</Style>
	<Style ss:ID="s2">
		<NumberFormat ss:Format="0%"/>
		<Protection/>
	</Style>
	<Style ss:ID="s1">
		<NumberFormat ss:Format="_ * #,##0_ ;_ * -#,##0_ ;_ * &quot;-&quot;_ ;_ @_ "/>
		<Protection/>
	</Style>
	<Style ss:ID="s3">
		<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0_ ;_ &quot;￥&quot;* -#,##0_ ;_ &quot;￥&quot;* &quot;-&quot;_ ;_ @_ "/>
		<Protection/>
	</Style>
	<Style ss:ID="s6"/>
	<Style ss:ID="s7">
		<NumberFormat ss:Format="yyyy-m-d;-;-;@"/>
		<Protection/>
	</Style>
	<Style ss:ID="s8">
		<NumberFormat ss:Format="yyyy-m-d\ H:mm;-;-;@"/>
		<Protection/>
	</Style>
	<Style ss:ID="unNullable">
			<Alignment />
			<Borders />
			<Font ss:FontName="宋体" x:CharSet="134" ss:Size="10" ss:Color="#FF0000" />
			<Interior />
			<NumberFormat />
			<Protection />
		</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productListID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productSpecif">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productModel">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_createTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_modifyTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_valueType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_keepUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_attachExplain">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBuyUnitRate">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isKeepDate">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_precentPrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_storeUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_keepReckonS2">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_saleUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_ware">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_replaceItem">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCheckFreq">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productAllas">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_approachTime">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_pointNum">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_notifyDays">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isProReset">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_storeDeadlineUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_keepDay">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_numberParamF">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_abcClass">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_selectFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_modifyPerson">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_taxRate">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCheckDays">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_creator">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productComment">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isCtrlPass">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCostunitRate">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBepuchase">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_mrpNum">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_unit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isContainer">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeService">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_protoType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_mfgStockMode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_paRKINGSYS">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_minTargetStock">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_recCost">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_purPoint">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productAttribute">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_purchGroupId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productAccmonth">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeVerstock">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCostPrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_goodState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_cad">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_approachUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_checkIndex">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBaseUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_keepReckon">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_purMoveUpDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_mnecode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeConsume">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_batch">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_ctlEffectiveDateCount">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCheckMethod">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isauto">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_unitGroup">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_costPriceOri">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_recCostOri">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeProducing">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productCostUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_safeNum">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_reqTypeS2">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeasset">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_lowNum">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBebatch">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_purDeliverDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeSale">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_purGroupMark">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_prodType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_desity">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeSelf">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_createDate">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_salePrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isSparePart">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_interfaceUrl">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_frequency">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_minOrderQuantity">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_pieceNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productChartCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_keepUnitS2">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_batchcode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_storeDeadline">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_saleRecentPrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_resetMarkS2">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_checkMethodbap">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_standardPrice">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_abcClassS2">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBalancePrice">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_factory">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_autoSupply">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_salePriceOri">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBuyUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_recentPrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isItemLevel">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBeMass">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_limsUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_lastDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_resetMark">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_reqType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_refCostPrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_bapValueType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_receiveDate">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_topNum">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_beUnique">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_resetDaily">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_standardPercent">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_planPrice">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_storeSet">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_prodModifyTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isNeedConvert">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_dcontent">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isPack">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_avbCODE">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_productBePropCheck">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_isNeedWeigh">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_product_Product_cmemo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
		<#if customStyleFormates?? && (customStyleFormates?size>0) >
			<#list customStyleFormates as style>
				<Style ss:ID="${style.key}">
						<#if style['format']?? >
			  				<NumberFormat ss:Format="${style['format']}"/>
			  			<#else>
			  				<NumberFormat/>
			  			</#if>
			  			<Protection/>
				</Style>
			</#list>
		</#if>  
	</Styles>
<Worksheet ss:Name="sheet1">
	<Table ss:ExpandedColumnCount="256" ss:ExpandedRowCount="3" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCode"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productName"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productListID"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productSpecif"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productModel"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_createTime"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_modifyTime"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_valueType"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_keepUnit"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_attachExplain"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBuyUnitRate"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isKeepDate"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_precentPrice"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_storeUnit"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_keepReckonS2"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_saleUnit"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_ware"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_replaceItem"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCheckFreq"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productAllas"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_approachTime"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_pointNum"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_notifyDays"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isProReset"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_storeDeadlineUnit"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_keepDay"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_numberParamF"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_abcClass"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_selectFlag"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_modifyPerson"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_taxRate"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCheckDays"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_creator"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productComment"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isCtrlPass"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCostunitRate"/>
			<Column ss:Index="37" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBepuchase"/>
			<Column ss:Index="38" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_mrpNum"/>
			<Column ss:Index="39" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_unit"/>
			<Column ss:Index="40" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isContainer"/>
			<Column ss:Index="41" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeService"/>
			<Column ss:Index="42" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_protoType"/>
			<Column ss:Index="43" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_mfgStockMode"/>
			<Column ss:Index="44" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_paRKINGSYS"/>
			<Column ss:Index="45" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_minTargetStock"/>
			<Column ss:Index="46" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_recCost"/>
			<Column ss:Index="47" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_purPoint"/>
			<Column ss:Index="48" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productAttribute"/>
			<Column ss:Index="49" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_purchGroupId"/>
			<Column ss:Index="50" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productAccmonth"/>
			<Column ss:Index="51" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeVerstock"/>
			<Column ss:Index="52" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCostPrice"/>
			<Column ss:Index="53" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_goodState"/>
			<Column ss:Index="54" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_cad"/>
			<Column ss:Index="55" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_approachUnit"/>
			<Column ss:Index="56" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_checkIndex"/>
			<Column ss:Index="57" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBaseUnit"/>
			<Column ss:Index="58" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_keepReckon"/>
			<Column ss:Index="59" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_purMoveUpDate"/>
			<Column ss:Index="60" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_mnecode"/>
			<Column ss:Index="61" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeConsume"/>
			<Column ss:Index="62" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_batch"/>
			<Column ss:Index="63" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_ctlEffectiveDateCount"/>
			<Column ss:Index="64" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCheckMethod"/>
			<Column ss:Index="65" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isauto"/>
			<Column ss:Index="66" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_unitGroup"/>
			<Column ss:Index="67" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_costPriceOri"/>
			<Column ss:Index="68" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_recCostOri"/>
			<Column ss:Index="69" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeProducing"/>
			<Column ss:Index="70" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productCostUnit"/>
			<Column ss:Index="71" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_safeNum"/>
			<Column ss:Index="72" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_reqTypeS2"/>
			<Column ss:Index="73" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeasset"/>
			<Column ss:Index="74" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_lowNum"/>
			<Column ss:Index="75" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBebatch"/>
			<Column ss:Index="76" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_purDeliverDate"/>
			<Column ss:Index="77" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeSale"/>
			<Column ss:Index="78" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_purGroupMark"/>
			<Column ss:Index="79" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_prodType"/>
			<Column ss:Index="80" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_desity"/>
			<Column ss:Index="81" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeSelf"/>
			<Column ss:Index="82" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_createDate"/>
			<Column ss:Index="83" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_salePrice"/>
			<Column ss:Index="84" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isSparePart"/>
			<Column ss:Index="85" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_interfaceUrl"/>
			<Column ss:Index="86" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_frequency"/>
			<Column ss:Index="87" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_minOrderQuantity"/>
			<Column ss:Index="88" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_pieceNum"/>
			<Column ss:Index="89" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productChartCode"/>
			<Column ss:Index="90" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_keepUnitS2"/>
			<Column ss:Index="91" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_batchcode"/>
			<Column ss:Index="92" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_storeDeadline"/>
			<Column ss:Index="93" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_saleRecentPrice"/>
			<Column ss:Index="94" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_resetMarkS2"/>
			<Column ss:Index="95" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_checkMethodbap"/>
			<Column ss:Index="96" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_standardPrice"/>
			<Column ss:Index="97" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_abcClassS2"/>
			<Column ss:Index="98" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBalancePrice"/>
			<Column ss:Index="99" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_factory"/>
			<Column ss:Index="100" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_autoSupply"/>
			<Column ss:Index="101" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_salePriceOri"/>
			<Column ss:Index="102" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBuyUnit"/>
			<Column ss:Index="103" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_recentPrice"/>
			<Column ss:Index="104" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isItemLevel"/>
			<Column ss:Index="105" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBeMass"/>
			<Column ss:Index="106" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_limsUnit"/>
			<Column ss:Index="107" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_lastDate"/>
			<Column ss:Index="108" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_resetMark"/>
			<Column ss:Index="109" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_reqType"/>
			<Column ss:Index="110" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_refCostPrice"/>
			<Column ss:Index="111" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_bapValueType"/>
			<Column ss:Index="112" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_receiveDate"/>
			<Column ss:Index="113" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_topNum"/>
			<Column ss:Index="114" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_beUnique"/>
			<Column ss:Index="115" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_resetDaily"/>
			<Column ss:Index="116" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_standardPercent"/>
			<Column ss:Index="117" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_planPrice"/>
			<Column ss:Index="118" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_storeSet"/>
			<Column ss:Index="119" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_prodModifyTime"/>
			<Column ss:Index="120" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isNeedConvert"/>
			<Column ss:Index="121" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_dcontent"/>
			<Column ss:Index="122" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isPack"/>
			<Column ss:Index="123" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_avbCODE"/>
			<Column ss:Index="124" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_productBePropCheck"/>
			<Column ss:Index="125" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_isNeedWeigh"/>
			<Column ss:Index="126" ss:Width="100"  ss:StyleID="MESBasic_1_product_Product_cmemo"/>
	<#assign secondCount=127/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">物品编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">目录名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productListID||MESBasic_1_prodList_BaseProdList_prodListCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">规格</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productSpecif
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">型号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productModel
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">创建时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_createTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">修改时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_modifyTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计价方式S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_valueType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">保质期单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_keepUnit
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">附加说明</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_attachExplain
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采购单位换算</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBuyUnitRate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">保质期管理</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isKeepDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近采购价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_precentPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">库存单位.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_storeUnit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">有效期推算S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_keepReckonS2
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">销售单位.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_saleUnit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">仓库.仓库编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_ware||MESBasic_1_wareMan_Ware_wareCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">替换品.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_replaceItem||MESBasic_1_product_Product_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">盘点周期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCheckFreq
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">别名</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productAllas
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">近效期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_approachTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批量增量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_pointNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">提前提醒（天）</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_notifyDays
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否复验</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isProReset
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最长贮存期限单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_storeDeadlineUnit
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">保质期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_keepDay
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">折算率</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_numberParamF
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">ABC分类</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_abcClass
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">勾选</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_selectFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近维护人.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_modifyPerson||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">税率</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_taxRate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">检验期（天）</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCheckDays
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">建档人.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_creator||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productComment
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">放行控制</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isCtrlPass
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">成本单位换算</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCostunitRate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否采购品</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBepuchase
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">经济批量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_mrpNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计量单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_unit
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">容器启用</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isContainer
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否仓库物品</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeService
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品属性</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_protoType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备料方式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_mfgStockMode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">包装形式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_paRKINGSYS
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">安全库存</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_minTargetStock
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最新库存成本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_recCost
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">订货点</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_purPoint
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品一级属性</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productAttribute
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采购组.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_purchGroupId||MESBasic_1_purch_Group_PurchGroup_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">财务月份</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productAccmonth
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否挤压控制</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeVerstock
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参考采购价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCostPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_goodState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">包装规格型号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_cad
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">近效期单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_approachUnit
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">检验指标.指标编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_checkIndex||MESBasic_1_checkIndex_QACheckIndex_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">主单位ID.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBaseUnit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">有效期推算</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_keepReckon
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采购提前期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_purMoveUpDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品助记码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_mnecode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否消耗品</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeConsume
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">批次启用</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_batch
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">有效期控制天数</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_ctlEffectiveDateCount
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">检验方式s2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCheckMethod
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">自动生成批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isauto
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">单位组.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_unitGroup||X6Basic_1.0_unitGroup_UnitGroups_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参考采购价原值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_costPriceOri
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近库存成本原值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_recCostOri
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否在制品</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeProducing
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">成本单位ID.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productCostUnit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">安全库存</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_safeNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物料需求分析方法S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_reqTypeS2
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否固定资产</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeasset
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最低库存</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_lowNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否批次管理</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBebatch
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">配送提前期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_purDeliverDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否销售品</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeSale
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采购组原有字段值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_purGroupMark
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品类别</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_prodType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">密度(kg/m3)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_desity
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否自产品</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeSelf
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">建档日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_createDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参考售价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_salePrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否备件</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isSparePart
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控服务地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_interfaceUrl
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最大复验次数</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_frequency
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最小订货量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_minOrderQuantity
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">件重量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_pieceNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">图号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productChartCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">保质期单位S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_keepUnitS2
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批号流水号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_batchcode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最长贮存期限</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_storeDeadline
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近销售价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_saleRecentPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">复验期推算S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_resetMarkS2
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">检验方式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_checkMethodbap
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">基准价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_standardPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">ABC分类S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_abcClassS2
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">结存价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBalancePrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工厂模型.节点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_factory||MESBasic_1_factoryModel_FactoryModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">自动补充标志</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_autoSupply
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参考售价原值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_salePriceOri
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">采购单位ID.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBuyUnit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近结算价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_recentPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用等级品管理</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isItemLevel
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否保质期管理</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBeMass
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">取样单位.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_limsUnit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">上次盘点日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_lastDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">复验期推算</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_resetMark
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物料需求分析方法</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_reqType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参考成本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_refCostPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计价方式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_bapValueType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">固定提前期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_receiveDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最高库存</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_topNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批次启用S2</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_beUnique
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">复验周期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_resetDaily
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">标准含量系数</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_standardPercent
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计划价</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_planPrice
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">货位.货位编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_storeSet||MESBasic_1_storeSet_StoreSet_placeSetCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近维护时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_prodModifyTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否折算</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isNeedConvert
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">维护内容及原因</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_dcontent
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否包材</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isPack
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否有效</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_avbCODE
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否质检</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_productBePropCheck
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否计量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_isNeedWeigh
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">s2备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_product_Product_cmemo
									 </ss:Data>
							</Comment>
						</Cell>
			<#if customProperties?? &&  (customProperties?size>0) >
				<#list customProperties as item >
								<Cell <#if item.nullAble??&&(!item.nullAble) >ss:StyleID="unNullable"</#if>>
									<Data ss:Type="String">${(item.columnName)!''}</Data>
									<Comment ss:Author="">
											 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
												${(item.propertyCode)!''}
											 </ss:Data>
									</Comment>
								</Cell>
				</#list>
			</#if>
		</Row>
	</Table>
	<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
		<PageSetup>
			<Header x:Margin="0.511805555555556"/>
			<Footer x:Margin="0.511805555555556"/>
		</PageSetup>
		<Print>
			<HorizontalResolution>1200</HorizontalResolution>
			<VerticalResolution>1200</VerticalResolution>
		</Print>
			<Selected/>
			<PageBreakZoom>100</PageBreakZoom>
		<Panes>
			<Pane>
				<Number>3</Number>
				<ActiveRow>0</ActiveRow>
				<ActiveCol>2</ActiveCol>
				<RangeSelection>R1C3</RangeSelection>
			</Pane>
		</Panes>
		<ProtectObjects>False</ProtectObjects>
		<ProtectScenarios>False</ProtectScenarios>
	</WorksheetOptions>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C12:R65536C12</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C24:R65536C24</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C29:R65536C29</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C35:R65536C35</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C40:R65536C40</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C41:R65536C41</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C65:R65536C65</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C77:R65536C77</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C84:R65536C84</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C104:R65536C104</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C120:R65536C120</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C122:R65536C122</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C123:R65536C123</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C124:R65536C124</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C125:R65536C125</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
		<#if customProperties?? && (customProperties?size>0) >
			<#assign customBooleanIndex = 1/>
			<#list customProperties as item>
					<#if item.columnType??&&item.columnType == 'BOOLEAN' >
						<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
								<Range>R2C${customBooleanIndex}:R65536C${customBooleanIndex}</Range>
								<Type>List</Type>
								<CellRangeList />
								<Value>&quot;是,否&quot;</Value>
								<ErrorStyle>Stop</ErrorStyle>
							</DataValidation>
					</#if>
					<#assign customBooleanIndex = customBooleanIndex +1 />
		   </#list>
		</#if>
</Worksheet>
</Workbook>