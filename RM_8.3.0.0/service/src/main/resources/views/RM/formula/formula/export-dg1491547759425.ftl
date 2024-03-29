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
  		<Style ss:ID="isMixQuality">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="lossRate">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="maxQuality">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="meno">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="minQuality">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="needWeigh">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="phase">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.id">
  			<NumberFormat/>
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
  		<Style ss:ID="sequence">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="unitQuality">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
			 						    	<#assign customPropList = showCusProps.get("formulaBom")  />
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
									<#if item == 'property.value' || item == 'property.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'unitQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productBaseUnit.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isMixQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'phase' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'sequence' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'needWeigh' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'minQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'maxQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'lossRate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#assign customGeneratedFlag=false />
										<#if item == 'lossRate' && !customGeneratedFlag >
										<#assign count = count + 1>
										<#assign customPropList = showCusProps.get("formulaBom")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												 <Column ss:Index="${count}" ss:StyleID="${c.property.name}"  ss:Width="100" />
												 <#assign count = count + 1>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
										</#if>
									<#if item == 'meno' || item == '*'>
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
											<Data ss:Type="String">${getText('RM.propertydisplayName.radion14157726448331')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.radion14157727407371')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1449796384550')}</Data>
										</Cell>
								</#if>
								<#if item == 'property.value' || item == 'property.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1490010423584')}</Data>
										</Cell>
								</#if>
								<#if item == 'unitQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon14872431390911')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productBaseUnit.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.radion139823564048323')}</Data>
										</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488852241781')}</Data>
										</Cell>
								</#if>
								<#if item == 'phase' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1503477430704')}</Data>
										</Cell>
								</#if>
								<#if item == 'sequence' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1503477288458')}</Data>
										</Cell>
								</#if>
								<#if item == 'needWeigh' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon150347726245811123123')}</Data>
										</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488852437576')}</Data>
										</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488852460357')}</Data>
										</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1491544403180')}</Data>
										</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'lossRate' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("formulaBom")  />
									<#-- 排布自定义字段 -->
									<#if customPropList?? && customPropList?has_content>
										<#list customPropList as c>
											<Cell><Data ss:Type="String">${getText('${(c.displayName)!}')}</Data></Cell>
										</#list>
									</#if>
									<#assign customGeneratedFlag=true />
									</#if>
								<#if item == 'meno' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488852483896')}</Data>
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
								<#if item == 'property.value' || item == 'property.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.property.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'unitQuality' || item == '*'>
									<Cell>
									
										<#if (data.unitQuality)?has_content><Data ss:Type="Number">#{(data.unitQuality)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'productId.productBaseUnit.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productId.productBaseUnit.name)??>${(data.productId.productBaseUnit.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isMixQuality)?? && data.isMixQuality>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'phase' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.phase)??>${(data.phase)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'sequence' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.sequence)??>${(data.sequence)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'needWeigh' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.needWeigh)?? && data.needWeigh>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
									<Cell>
									
										<#if (data.minQuality)?has_content><Data ss:Type="Number">#{(data.minQuality)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
									<Cell>
									
										<#if (data.maxQuality)?has_content><Data ss:Type="Number">#{(data.maxQuality)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
									<Cell>
									
										<#if (data.lossRate)?has_content><Data ss:Type="Number">#{(data.lossRate)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'lossRate' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("formulaBom")  />
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
								<#if item == 'meno' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.meno)??>${(data.meno)!}</#if></Data>
									
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
						
								
								
								
