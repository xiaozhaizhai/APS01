<#assign exportFields = dg1445343942880Page.exportFields />
<#assign result = dg1445343942880Page.result />
<#assign exportFieldList = exportFields?split(',')>
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
  			<Font ss:FontName="Arial" x:CharSet="134" ss:Size="12"/>
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
  		<Style ss:ID="endDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="month">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="quarter">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="startDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="week">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="year">
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
									<#if item == 'name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'startDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'endDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'year' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'quarter' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'month' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'week' || item == '*'>
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
 			
								<#if item == 'name' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441784357503')}</Data></Cell>
								</#if>
								<#if item == 'startDate' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441779162485')}</Data></Cell>
								</#if>
								<#if item == 'endDate' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441779207153')}</Data></Cell>
								</#if>
								<#if item == 'year' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441779229335')}</Data></Cell>
								</#if>
								<#if item == 'quarter' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441779338024')}</Data></Cell>
								</#if>
								<#if item == 'month' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441779301329')}</Data></Cell>
								</#if>
								<#if item == 'week' || item == '*'>
										<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1441779320160')}</Data></Cell>
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
			
								<#if item == 'name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('name','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_name') != 0>
										<Data ss:Type="String"><#if (data.name)??>${(data.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'startDate' || item == '*'>
									<Cell ss:StyleID="s7">
									<#if checkFieldPermission('startDate','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_startDate') != 0>
										<#if data.startDate??><Data ss:Type="Number"><@workerdate datetime='${(data.startDate)!?string("yyyy-MM-dd")}'></@workerdate></Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'endDate' || item == '*'>
									<Cell ss:StyleID="s7">
									<#if checkFieldPermission('endDate','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_endDate') != 0>
										<#if data.endDate??><Data ss:Type="Number"><@workerdate datetime='${(data.endDate)!?string("yyyy-MM-dd")}'></@workerdate></Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'year' || item == '*'>
									<Cell>
									<#if checkFieldPermission('year','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_year') != 0>
										<Data ss:Type="Number"><#if (data.year)??>${(data.year)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'quarter' || item == '*'>
									<Cell>
									<#if checkFieldPermission('quarter','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_quarter') != 0>
										<Data ss:Type="Number"><#if (data.quarter)??>${(data.quarter)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'month' || item == '*'>
									<Cell>
									<#if checkFieldPermission('month','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_month') != 0>
										<Data ss:Type="Number"><#if (data.month)??>${(data.month)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'week' || item == '*'>
									<Cell>
									<#if checkFieldPermission('week','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_week') != 0>
										<Data ss:Type="Number"><#if (data.week)??>${(data.week)!}</#if></Data>
									</#if>
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
		
	</Worksheet>
	</Workbook>


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
						
								
								
								
