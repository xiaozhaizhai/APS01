<#assign exportFields = dgPage.exportFields />
<#assign result = dgPage.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign showCusProps =  dgPage.showCusProps />
	<?xml version="1.0"?>
	<?mso-application progid="Excel.Sheet"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
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
  		<Style ss:ID="planNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productBaseUnit.name">
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
  		<Style ss:ID="property">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
			 						    	<#assign customPropList = showCusProps.get("produceMaterialSum")  />
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
									<#if item == 'property.value' || item == 'property.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'planNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productBaseUnit.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#assign customGeneratedFlag=false />
										<#if item == 'batchNum' && !customGeneratedFlag >
										<#assign count = count + 1>
										<#assign customPropList = showCusProps.get("produceMaterialSum")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												 <Column ss:Index="${count}" ss:StyleID="${c.property.name}"  ss:Width="100" />
												 <#assign count = count + 1>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
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
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion14157726448331')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737334')}</Data>
										</Cell>
								</#if>
								<#if item == 'property.value' || item == 'property.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1504080330992')}</Data>
										</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489671332695')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productBaseUnit.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1398235640483')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1493086257330')}</Data>
										</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'batchNum' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("produceMaterialSum")  />
									<#-- 排布自定义字段 -->
									<#if customPropList?? && customPropList?has_content>
										<#list customPropList as c>
											<Cell><Data ss:Type="String">${getText('${(c.displayName)!}')}</Data></Cell>
										</#list>
									</#if>
									<#assign customGeneratedFlag=true />
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
									<#if checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_productId||MESBasic_1_product_Product_productCode') != 0>
										<Data ss:Type="String"><#if (data.productId.productCode)??>${(data.productId.productCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_productId||MESBasic_1_product_Product_productName') != 0>
										<Data ss:Type="String"><#if (data.productId.productName)??>${(data.productId.productName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'property.value' || item == 'property.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('property','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_property') != 0>
										<Data ss:Type="String">${getText('${(data.property.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
									<Cell>
									<#if checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_planNum') != 0>
										<#if (data.planNum)?has_content><Data ss:Type="Number">#{(data.planNum)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'productId.productBaseUnit.name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.productBaseUnit.name','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_productId||MESBasic_1_product_Product_productBaseUnit||X6Basic_1.0_unitGroup_BaseUnit_name') != 0>
										<Data ss:Type="String"><#if (data.productId.productBaseUnit.name)??>${(data.productId.productBaseUnit.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'batchNum' || item == '*'>
									<Cell>
									<#if checkFieldPermission('batchNum','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_batchNum') != 0>
										<Data ss:Type="String"><#if (data.batchNum)??>${(data.batchNum)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'batchNum' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("produceMaterialSum")  />
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
						
								
								
								
