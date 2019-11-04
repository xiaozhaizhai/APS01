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
  		<Style ss:ID="taskReportPart.batchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.headId.tableNo">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.reportDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.reportNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.reportStaff.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.reportType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.storeID.placeSetName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportPart.wareId.wareName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskReportUrl">
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
									<#if item == 'taskReportPart.headId.tableNo' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportUrl' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.reportStaff.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.reportNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.reportType.value' || item == 'taskReportPart.reportType.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'taskReportPart.reportDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.batchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.wareId.wareName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.storeID.placeSetName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskReportPart.remark' || item == '*'>
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
								<#if item == 'taskReportPart.headId.tableNo' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.menuName.randon149078554261011')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportUrl' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1503300950455')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.reportStaff.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.staff.dimissionStaff_xls.staffName0000')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.reportNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492079279822858252')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.reportType.value' || item == 'taskReportPart.reportType.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492078645437')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.reportDate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1492078626890')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.batchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490773190433')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.wareId.wareName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1484031316281')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.storeID.placeSetName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490096758348')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskReportPart.remark' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490773225991')}</Data>
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
								<#if item == 'taskReportPart.headId.tableNo' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportPart.headId.tableNo)??>${(data.taskReportPart.headId.tableNo)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportUrl' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportUrl)??>${(data.taskReportUrl)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.reportStaff.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportPart.reportStaff.name)??>${(data.taskReportPart.reportStaff.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.reportNum' || item == '*'>
									<Cell>
									
										<#if (data.taskReportPart.reportNum)?has_content><Data ss:Type="Number">#{(data.taskReportPart.reportNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.reportType.value' || item == 'taskReportPart.reportType.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.taskReportPart.reportType.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.reportDate' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.taskReportPart.reportDate??><Data ss:Type="Number"><@workerdate datetime='${(data.taskReportPart.reportDate)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.batchNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportPart.batchNum)??>${(data.taskReportPart.batchNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.wareId.wareName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportPart.wareId.wareName)??>${(data.taskReportPart.wareId.wareName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.storeID.placeSetName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportPart.storeID.placeSetName)??>${(data.taskReportPart.storeID.placeSetName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'taskReportPart.remark' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskReportPart.remark)??>${(data.taskReportPart.remark)!}</#if></Data>
									
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
						
								
								
								
