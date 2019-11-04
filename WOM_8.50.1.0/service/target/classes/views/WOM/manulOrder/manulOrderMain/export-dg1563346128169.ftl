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
  		<Style ss:ID="ablePass">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="coOperation">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="edition">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="material.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="material.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="materialBatchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="needNumber">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rsNUM">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rsPOS">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="unit.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="ware.wareCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="ware.wareName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
 	</Styles>
	<Worksheet ss:Name="${sheetName!}">
		<Table ss:ExpandedColumnCount="256" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
 				<#assign count = 1>
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0 && item != "checkbox">
									<#if item == 'material.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'material.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'ablePass' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'ware.wareName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'ware.wareCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'unit.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'needNumber' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'materialBatchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'edition' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'coOperation' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rsNUM' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rsPOS' || item == '*'>
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
								<#if item == 'material.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772644833')}</Data>
										</Cell>
								</#if>
								<#if item == 'material.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772740737')}</Data>
										</Cell>
								</#if>
								<#if item == 'ablePass' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1563254591438')}</Data>
										</Cell>
								</#if>
								<#if item == 'ware.wareName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertyshowName.randon1563348308936.flag')}</Data>
										</Cell>
								</#if>
								<#if item == 'ware.wareCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031239866')}</Data>
										</Cell>
								</#if>
								<#if item == 'unit.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('X6Basic.propertydisplayName.radion1398235640483')}</Data>
										</Cell>
								</#if>
								<#if item == 'needNumber' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1563254572747')}</Data>
										</Cell>
								</#if>
								<#if item == 'materialBatchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1563254620511')}</Data>
										</Cell>
								</#if>
								<#if item == 'edition' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1563254644099')}</Data>
										</Cell>
								</#if>
								<#if item == 'coOperation' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertyshowName.randon1568163535873.flag')}</Data>
										</Cell>
								</#if>
								<#if item == 'rsNUM' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1565685798260')}</Data>
										</Cell>
								</#if>
								<#if item == 'rsPOS' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1565685818679')}</Data>
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
								<#if item == 'material.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.material.productCode)??>${(data.material.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'material.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.material.productName)??>${(data.material.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ablePass' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.ablePass)?? && data.ablePass>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ware.wareName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.ware.wareName)??>${(data.ware.wareName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ware.wareCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.ware.wareCode)??>${(data.ware.wareCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'unit.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.unit.name)??>${(data.unit.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'needNumber' || item == '*'>
									<Cell>
									
										<#if (data.needNumber)?has_content><Data ss:Type="Number">#{(data.needNumber)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'materialBatchNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.materialBatchNum)??>${(data.materialBatchNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'edition' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.edition)??>${(data.edition)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'coOperation' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.coOperation)?? && data.coOperation>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rsNUM' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rsNUM)??>${(data.rsNUM)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rsPOS' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rsPOS)??>${(data.rsPOS)!}</#if></Data>
									
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
						
								
								
								
