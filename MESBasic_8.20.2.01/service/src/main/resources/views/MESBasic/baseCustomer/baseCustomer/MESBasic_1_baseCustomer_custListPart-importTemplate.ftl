
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
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerShortName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerCCCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerVocation">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerDCCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerDegreeCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerProperty">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_ownerStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerPostCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerCreditLimit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerInvoiceAddress">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerEmail">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerAccount">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerVendorID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerCreditMemo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerFax">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerTradeCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerIntroduce">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerFreezen">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerDepartID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerIsBlack">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerCreditLine">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerBank">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerWeb">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerPayCondition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerInvoicePhone">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerTaxCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerPhone">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerMobile">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerRegFund">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerMemo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerAddress">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_baseCustomer_BaseCustomer_customerCorporation">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerCode"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerShortName"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerName"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerCCCode"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerVocation"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerDCCode"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerDegreeCode"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerProperty"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_ownerStaff"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerType"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerPostCode"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerCreditLimit"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerInvoiceAddress"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerEmail"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerAccount"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerVendorID"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerCreditMemo"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerFax"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerTradeCode"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerIntroduce"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerState"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerFreezen"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerDepartID"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerIsBlack"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerCreditLine"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerBank"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerWeb"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerPayCondition"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerInvoicePhone"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerTaxCode"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerPhone"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerMobile"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerRegFund"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerMemo"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerAddress"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="MESBasic_1_baseCustomer_BaseCustomer_customerCorporation"/>
	<#assign secondCount=37/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">客户编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">客户简称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerShortName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">客户名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">客户分类</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerCCCode||MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">行业</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerVocation
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">地区</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerDCCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">客户等级</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerDegreeCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">企业性质</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerProperty
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据所有人</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_ownerStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">客户类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">邮编</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerPostCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">信用期限</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerCreditLimit
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">开票地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerInvoiceAddress
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">Email地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerEmail
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">银行账号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerAccount
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">对应供应商.供应商编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerVendorID||MESBasic_1_baseVendor_BaseVendor_vendorCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">信贷文本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerCreditMemo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">传真</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerFax
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工商登记号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerTradeCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">企业简介</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerIntroduce
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">信贷冻结状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerFreezen
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">分管部门.部门编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerDepartID||base_department_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否黑名单</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerIsBlack
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">信用额度</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerCreditLine
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">开户行</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerBank
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">主页地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerWeb
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">付款条件</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerPayCondition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">开票地点电话</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerInvoicePhone
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">税务登记号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerTaxCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">电话</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerPhone
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">手机</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerMobile
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">注册资金</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerRegFund
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerMemo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerAddress
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">法人</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_baseCustomer_BaseCustomer_customerCorporation
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