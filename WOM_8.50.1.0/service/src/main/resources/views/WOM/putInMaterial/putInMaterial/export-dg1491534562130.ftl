<#assign exportFields = dgPage.exportFields />
<#assign result = dgPage.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign showCusProps =  dgPage.showCusProps />
	<?xml version="1.0"?>
	<?mso-application progid="Excel.Sheet"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>datagriCommonExport</Author>
		<Created>1899-12-30T00:00:00</Created>
	</DocumentProperties>
	<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowWidth>18800</WindowWidth>
 		<WindowHeight>10540</WindowHeight>
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
  		<Style ss:ID="batchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="factoryId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="factoryId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="formluActive.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="formluActive.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="lossNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putinDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putinEndDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="storeID.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="storeID.placeSetCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="storeID.placeSetName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="takeTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskProcessId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskProcessId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="useNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.cargoStatue">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.wareCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.wareName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
			 						    	<#assign customPropList = showCusProps.get("putInMaterialPart")  />
											<#-- 排布自定义字段 -->
											<#if customPropList?? && customPropList?has_content>
												<#list customPropList as c>
													<Style ss:ID="${c.property.name}">
													<#if c['excelFormat']?? >
														<NumberFormat ss:Format="${c['excelFormat']}"/>
													<#else>
														<NumberFormat/>
													</#if>
														<Protection/>
													</Style>
												</#list>
											</#if>
 	</Styles>
	<Worksheet ss:Name="${sheetName!}">
		<Table ss:ExpandedColumnCount="256" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
 				<#assign count = 1>
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0 && item != "checkbox">
									<#if item == 'productId.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.wareCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.wareName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.cargoStatue.value' || item == 'wareID.cargoStatue.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'storeID.placeSetCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'storeID.placeSetName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'storeID.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'formluActive.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'formluActive.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'factoryId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'factoryId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskProcessId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskProcessId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'useNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'lossNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putinDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putinEndDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'takeTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#assign customGeneratedFlag=false />
										<#if item == 'takeTime' && !customGeneratedFlag >
										<#assign count = count + 1>
										<#assign customPropList = showCusProps.get("putInMaterialPart")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												 <Column ss:Index="${count}" ss:StyleID="${c.property.name}"  ss:Width="100" />
												 <#assign count = count + 1>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
										</#if>
									<#if item == 'remark' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
 						<#assign count = count + 1>
						</#if>
					</#list>
				</#if>
 			
 			
 			
 			<Row ss:AutoFitHeight="0">
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0>
								<#if item == 'productId.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772644833222')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737334')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1449796384550')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605271044')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.wareCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031239866')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.wareName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031316281')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.cargoStatue.value' || item == 'wareID.cargoStatue.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031944240')}</Data>
										</Cell>
								</#if>
								<#if item == 'storeID.placeSetCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1489731651449')}</Data>
										</Cell>
								</#if>
								<#if item == 'storeID.placeSetName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1489731677162')}</Data>
										</Cell>
								</#if>
								<#if item == 'storeID.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'formluActive.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330156499')}</Data>
										</Cell>
								</#if>
								<#if item == 'formluActive.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'factoryId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490616670249')}</Data>
										</Cell>
								</#if>
								<#if item == 'factoryId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskProcessId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489720649125')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskProcessId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'useNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605292518')}</Data>
										</Cell>
								</#if>
								<#if item == 'lossNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605314992')}</Data>
										</Cell>
								</#if>
								<#if item == 'putinDate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492078322275')}</Data>
										</Cell>
								</#if>
								<#if item == 'putinEndDate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492674267022')}</Data>
										</Cell>
								</#if>
								<#if item == 'takeTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492674304959')}</Data>
										</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'takeTime' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("putInMaterialPart")  />
									<#-- 排布自定义字段 -->
									<#if customPropList?? && customPropList?has_content>
										<#list customPropList as c>
											<Cell><Data ss:Type="String">${getText('${(c.displayName)!}')}</Data></Cell>
										</#list>
									</#if>
									<#assign customGeneratedFlag=true />
									</#if>
								<#if item == 'remark' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605337153')}</Data>
										</Cell>
								</#if>
 			
							
						</#if>
					</#list>
				</#if>
			</Row>
			<!-- -->
			<#list result as data>
			<Row ss:AutoFitHeight="0">
				<#list exportFieldList as item>
					<#if item?length gt 0>
								<#if item == 'productId.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productId.productCode)??>${(data.productId.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productId.productName)??>${(data.productId.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productId.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.productId.id)??>${(data.productId.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'batchNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.batchNum)??>${(data.batchNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'wareID.wareCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.wareID.wareCode)??>${(data.wareID.wareCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'wareID.wareName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.wareID.wareName)??>${(data.wareID.wareName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'wareID.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.wareID.id)??>${(data.wareID.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'wareID.cargoStatue.value' || item == 'wareID.cargoStatue.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.wareID.cargoStatue.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'storeID.placeSetCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.storeID.placeSetCode)??>${(data.storeID.placeSetCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'storeID.placeSetName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.storeID.placeSetName)??>${(data.storeID.placeSetName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'storeID.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.storeID.id)??>${(data.storeID.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'formluActive.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.formluActive.name)??>${(data.formluActive.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'formluActive.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.formluActive.id)??>${(data.formluActive.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'factoryId.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.factoryId.name)??>${(data.factoryId.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'factoryId.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.factoryId.id)??>${(data.factoryId.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskProcessId.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskProcessId.name)??>${(data.taskProcessId.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskProcessId.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.taskProcessId.id)??>${(data.taskProcessId.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'useNum' || item == '*'>
									<Cell>
									
										<#if (data.useNum)?has_content><Data ss:Type="Number">#{(data.useNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'lossNum' || item == '*'>
									<Cell>
									
										<#if (data.lossNum)?has_content><Data ss:Type="Number">#{(data.lossNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'putinDate' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.putinDate??><Data ss:Type="Number"><@workerdate datetime='${(data.putinDate)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'putinEndDate' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.putinEndDate??><Data ss:Type="Number"><@workerdate datetime='${(data.putinEndDate)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'takeTime' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.takeTime)??>${(data.takeTime)!}</#if></Data>
									
									</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'takeTime' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("putInMaterialPart")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												<Cell  ss:StyleID="${c.property.name}" >
												<#if c.property.type == 'DECIMAL' && c.property.decimalNum??>
													<#if data[c.property.name]??><Data ss:Type="<@datatype type='${(c.fieldType)!Text}'></@datatype>">${(data["${c.property.name?if_exists}"])!}</Data></#if>
												<#elseif  c.property.type == 'DATETIME'>
													<#if data[c.property.name]??><Data ss:Type="DateTime">${(data["${c.property.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif  c.property.type == 'DATE'>
													<#if data[c.property.name]??><Data ss:Type="DateTime">${(data["${c.property.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif  c.property.type == 'SYSTEMCODE'>
													<#assign tempVal='${(data["${c.property.name}MainDisplay"])!}'  />
													<Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>">${getText('${(tempVal)!}')}</Data>
												<#elseif  c.property.type == 'BOOLEAN'>
													<Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>">${(data["${c.property.name?if_exists}"]?string("是","否"))!}</Data>
												<#elseif  c.property.type == 'OBJECT'>
													<#assign attrMapVal='${(data["${c.property.name}MainDisplay"])!}'  />
													<#if data[c.property.name]??><Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>"><#if attrMapVal?? ><![CDATA[${attrMapVal}]]><#else><![CDATA[${(data["${c.property.name?if_exists}"])!}]]></#if></Data></#if>
												<#else>
													<#if data[c.property.name]??><Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>"><![CDATA[${(data["${c.property.name?if_exists}"])!}]]></Data></#if>
												</#if>
												</Cell>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
									</#if>
								<#if item == 'remark' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.remark)??>${(data.remark)!}</#if></Data>
									
									</Cell>
								</#if>
			
					</#if>
				</#list>
			</Row>
			</#list>
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
		
	</Worksheet>
	</Workbook>

<#macro datatype type><#if type == 'MONEY' || type == 'DECIMAL' || type== 'INTEGER' || type == 'LONG' || type == 'DATETIME' || type == 'DATE'>Number<#return></#if>String</#macro>

<#macro workerdate datetime>
	<#assign totalday = 1>
	<#assign date = datetime?split(' ')>
	<#assign dates = date[0]?split('-')>
	<#list 1900..(dates[0]?number-1) as year>
		<#if (year%4==0&&year%100!=0) || (year%100==0&&year%400==0)>
			<#assign totalday = totalday + 366>
		<#else>
			<#assign totalday = totalday + 365>
		</#if>
	</#list>
	<#if dates[1]?number != 1>
	<#list 1..(dates[1]?number-1) as month>
		<#assign year = dates[0]?number>
		<#if month == 2>
				<#if (year%4==0&&year%100!=0) || (year%100==0&&year%400==0)>
					<#assign totalday = totalday + 29>
				<#else>
					<#assign totalday = totalday + 28>
				</#if>
		<#elseif "1,3,5,7,8,10,12"?contains('${month}') >
			<#assign totalday = totalday + 31>
		<#else>
			<#assign totalday = totalday + 30>
		</#if>
	</#list>
	</#if>
	<#assign totalday = totalday + dates[2]?number>
	<#assign totaltime = 0>
	<#if (date?size>1)>
		<#setting number_format="0.############">
		<#assign times = date[1]?split(':')>
		<#assign totaltime = ((times[0]?number*60) + times[1]?number)/1440>
	</#if>${totalday + totaltime}</#macro>
						
								
								
								
