
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
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorShortName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorDegreeCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorVCCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorPostCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorStaffID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorAheadDays">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorDepartID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorDCCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorBank">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorDeliveryCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorAPMoney">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorPayCondition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorTradeCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorMobile">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_lossRate">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorEvDate">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorPayTerm">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorVocation">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorCorpopation">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorTempPeriodT">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorFax">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorEvState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorPhone">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorAddress">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorAccount">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorRecentSupplyDate">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorIntroduce">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorCustomerID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorTempPeriodF">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorMemo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorProperty">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorTaxCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorRegFund">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorEmail">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseVendor_BaseVendor_vendorWeb">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorCode"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorShortName"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorName"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorDegreeCode"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorVCCode"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorState"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorPostCode"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorStaffID"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorAheadDays"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorDepartID"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorDCCode"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorBank"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorDeliveryCode"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorAPMoney"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorPayCondition"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorTradeCode"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorMobile"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_lossRate"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorEvDate"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorPayTerm"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorVocation"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorCorpopation"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorTempPeriodT"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorFax"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorEvState"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorPhone"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorAddress"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorAccount"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorRecentSupplyDate"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorIntroduce"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorCustomerID"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorTempPeriodF"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorMemo"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorProperty"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorTaxCode"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorRegFund"/>
			<Column ss:Index="37" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorEmail"/>
			<Column ss:Index="38" ss:Width="100"  ss:StyleID="MESBasic_1_baseVendor_BaseVendor_vendorWeb"/>
	<#assign secondCount=39/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">供应商编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供应商简称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorShortName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供应商名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供应商等级</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorDegreeCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供应商分类</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorVCCode||MESBasic_1_baseVenderClass_BaseVendorClass_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">邮编</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorPostCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采购员.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorStaffID||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">到货提醒周期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorAheadDays
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">分管部门.部门编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorDepartID||base_department_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">地区</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorDCCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">开户银行</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorBank
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">发运方式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorDeliveryCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">上期应付余额</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorAPMoney
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">付款条件</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorPayCondition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工商登记号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorTradeCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">手机</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorMobile
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">途耗率(‰)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_lossRate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">评估日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorEvDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">账期（天）</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorPayTerm
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">行业</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorVocation
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">法人</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorCorpopation
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">临时交易结束时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorTempPeriodT
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">传真</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorFax
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">评估状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorEvState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">电话</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorPhone
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorAddress
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">银行账号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorAccount
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近供货日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorRecentSupplyDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">企业简介</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorIntroduce
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">对应客户.客户编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorCustomerID||MESBasic_1_baseCustomer_BaseCustomer_customerCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">临时交易开始时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorTempPeriodF
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorMemo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">企业性质</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorProperty
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">税务登记号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorTaxCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">注册资金</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorRegFund
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">Email地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorEmail
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">主页</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseVendor_BaseVendor_vendorWeb
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