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
  		<Style ss:ID="putInMetarialPart.batchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.headId.tableNo">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.lossNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.productId.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.productId.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.putinDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.putinStaff.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInMetarialPart.useNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putInUrl">
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
									<#if item == 'putInMetarialPart.headId.tableNo' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInUrl' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.productId.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.batchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.putinStaff.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.useNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.lossNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.putinDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putInMetarialPart.remark' || item == '*'>
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
								<#if item == 'putInMetarialPart.headId.tableNo' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.modelname.randon1490604832447')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInUrl' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1503300915609')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.productId.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion14157726448331')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737334')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.batchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605271044')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.putinStaff.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492078276959')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.useNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605292518')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.lossNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490605314992')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.putinDate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492078322274')}</Data>
										</Cell>
								</#if>
								<#if item == 'putInMetarialPart.remark' || item == '*'>
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
								<#if item == 'putInMetarialPart.headId.tableNo' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInMetarialPart.headId.tableNo)??>${(data.putInMetarialPart.headId.tableNo)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'putInUrl' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInUrl)??>${(data.putInUrl)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.productId.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInMetarialPart.productId.productCode)??>${(data.putInMetarialPart.productId.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.productId.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInMetarialPart.productId.productName)??>${(data.putInMetarialPart.productId.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.batchNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInMetarialPart.batchNum)??>${(data.putInMetarialPart.batchNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.putinStaff.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInMetarialPart.putinStaff.name)??>${(data.putInMetarialPart.putinStaff.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.useNum' || item == '*'>
									<Cell>
									
										<#if (data.putInMetarialPart.useNum)?has_content><Data ss:Type="Number">#{(data.putInMetarialPart.useNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.lossNum' || item == '*'>
									<Cell>
									
										<#if (data.putInMetarialPart.lossNum)?has_content><Data ss:Type="Number">#{(data.putInMetarialPart.lossNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.putinDate' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.putInMetarialPart.putinDate??><Data ss:Type="Number"><@workerdate datetime='${(data.putInMetarialPart.putinDate)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'putInMetarialPart.remark' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.putInMetarialPart.remark)??>${(data.putInMetarialPart.remark)!}</#if></Data>
									
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
						
								
								
								
