
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
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_batchNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_product">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_sourceType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_productionDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_validDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_recheckDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_checkDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_reNotify">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_manufacture">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_provider">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_supplierBatch">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_purchaseDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_arriveDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_checkState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_passState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_batchInfo_BatchInformation_isAvailable">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_batchNum"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_product"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_sourceType"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_productionDate"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_validDate"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_recheckDate"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_checkDate"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_reNotify"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_manufacture"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_provider"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_supplierBatch"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_purchaseDate"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_arriveDate"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_checkState"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_passState"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_batchInfo_BatchInformation_isAvailable"/>
	<#assign secondCount=17/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell >
							<Data ss:Type="String">批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_batchNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_product||MESBasic_1_product_Product_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String"></Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生成源头</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_sourceType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_productionDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">有效期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_validDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">复检时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_recheckDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">检验日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_checkDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">复检提前提醒(天)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_reNotify
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产厂商</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_manufacture
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供应商</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_provider
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供方批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_supplierBatch
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采购日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_purchaseDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">到货日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_arriveDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">检验状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_checkState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">放行状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_passState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否可用</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_batchInfo_BatchInformation_isAvailable
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
						<Range>R2C17:R65536C17</Range>
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