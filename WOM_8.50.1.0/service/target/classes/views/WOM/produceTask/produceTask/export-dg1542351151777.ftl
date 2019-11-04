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
  		<Style ss:ID="acticeName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeRecordBatchState.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeRecordState">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="actualUse">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="endTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="inspectRecordId">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="inspectResult">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="processID">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="processName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="recordDataSource">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="recordProduct.productBaseUnit.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="recordProduct.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="recordProduct.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectsDeal">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="startTime">
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
									<#if item == 'processName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'acticeName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeRecordState.value' || item == 'activeRecordState.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'recordDataSource.value' || item == 'recordDataSource.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'recordProduct.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'recordProduct.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'actualUse' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'recordProduct.productBaseUnit.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'startTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'endTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'inspectResult' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'inspectRecordId' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeRecordBatchState.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectsDeal' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'remark' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'processID' || item == '*'>
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
								<#if item == 'processName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542192019742')}</Data>
										</Cell>
								</#if>
								<#if item == 'acticeName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542181804390')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542182374652')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeRecordState.value' || item == 'activeRecordState.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542181818133')}</Data>
										</Cell>
								</#if>
								<#if item == 'recordDataSource.value' || item == 'recordDataSource.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542351209071')}</Data>
										</Cell>
								</#if>
								<#if item == 'recordProduct.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772644833')}</Data>
										</Cell>
								</#if>
								<#if item == 'recordProduct.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772740737')}</Data>
										</Cell>
								</#if>
								<#if item == 'actualUse' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542179773992')}</Data>
										</Cell>
								</#if>
								<#if item == 'recordProduct.productBaseUnit.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('X6Basic.propertydisplayName.radion1398235640483')}</Data>
										</Cell>
								</#if>
								<#if item == 'startTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542098129762')}</Data>
										</Cell>
								</#if>
								<#if item == 'endTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542098149042')}</Data>
										</Cell>
								</#if>
								<#if item == 'inspectResult' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542360936828')}</Data>
										</Cell>
								</#if>
								<#if item == 'inspectRecordId' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542360892592')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeRecordBatchState.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon15094279554246')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectsDeal' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542361081580')}</Data>
										</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542098160250')}</Data>
										</Cell>
								</#if>
								<#if item == 'processID' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1542190402118')}</Data>
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
								<#if item == 'processName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.processName)??>${(data.processName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'acticeName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.acticeName)??>${(data.acticeName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeType.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeRecordState.value' || item == 'activeRecordState.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeRecordState.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'recordDataSource.value' || item == 'recordDataSource.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.recordDataSource.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'recordProduct.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.recordProduct.productCode)??>${(data.recordProduct.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'recordProduct.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.recordProduct.productName)??>${(data.recordProduct.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'actualUse' || item == '*'>
									<Cell>
									
										<#if (data.actualUse)?has_content><Data ss:Type="Number">#{(data.actualUse)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'recordProduct.productBaseUnit.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.recordProduct.productBaseUnit.name)??>${(data.recordProduct.productBaseUnit.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'startTime' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.startTime??><Data ss:Type="Number"><@workerdate datetime='${(data.startTime)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'endTime' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.endTime??><Data ss:Type="Number"><@workerdate datetime='${(data.endTime)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'inspectResult' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.inspectResult)??>${(data.inspectResult)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'inspectRecordId' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.inspectRecordId)??>${(data.inspectRecordId)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeRecordBatchState.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeRecordBatchState.name)??>${(data.activeRecordBatchState.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectsDeal' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.rejectsDeal)??>${(data.rejectsDeal)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.remark)??>${(data.remark)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'processID' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.processID)??>${(data.processID)!}</#if></Data>
									
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
						
								
								
								
