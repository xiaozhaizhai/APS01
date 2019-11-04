<#assign exportFields = page.exportFields />
<#assign result = page.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign xmlState = xmlState>
<#if xmlState=='START'>
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
  		<Style ss:ID="customerCcCode.ccNAME">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="customerCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="customerName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="customerShortName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="customerState">
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
									<#if item == 'customerCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'customerName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'customerShortName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'customerCcCode.ccNAME' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'customerStateForDisplay' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?substring(0,item?last_index_of('.'))}"/>
									</#if>
 						<#assign count = count + 1>
						</#if>
					</#list>
				</#if>
 			
 			
 			
 			<Row ss:AutoFitHeight="0">
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0>
 			
								<#if item == 'customerCode' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1436499489164')}</Data></Cell>
								</#if>
								<#if item == 'customerName' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1436499520719')}</Data></Cell>
								</#if>
								<#if item == 'customerShortName' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1436499618182')}</Data></Cell>
								</#if>
								<#if item == 'customerCcCode.ccNAME' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1436773836491')}</Data></Cell>
								</#if>
								<#if item == 'customerStateForDisplay' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1438138865907')}</Data></Cell>
								</#if>
 			
							
						</#if>
					</#list>
				</#if>
			</Row>
			<!-- -->
				<#elseif xmlState == 'BODY'>
			<#list result as data>
			<Row ss:AutoFitHeight="0">
				<#list exportFieldList as item>
					<#if item?length gt 0>
			
								<#if item == 'customerCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('customerCode','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerCode') != 0>
										<#if data.customerCode??><Data ss:Type="String">${(data.customerCode)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'customerName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('customerName','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerName') != 0>
										<#if data.customerName??><Data ss:Type="String">${(data.customerName)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'customerShortName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('customerShortName','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerShortName') != 0>
										<#if data.customerShortName??><Data ss:Type="String">${(data.customerShortName)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'customerCcCode.ccNAME' || item == '*'>
									<Cell>
									<#if checkFieldPermission('customerCcCode.ccNAME','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerCcCode||MESBasic_1_baseCustomerClass_BaseCustomerClass_ccNAME') != 0>
										<#if data.customerCcCode.ccNAME??><Data ss:Type="String">${(data.customerCcCode.ccNAME)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'customerStateForDisplay' || item == '*'>
									<Cell>
									<#if checkFieldPermission('customerState','MESBasic_1_baseCustomer_BaseCustomer','MESBasic_1_baseCustomer_BaseCustomer_customerState') != 0>
										<Data ss:Type="String">${getText('${(data.customerStateForDisplay)!}')}</Data>
									</#if>
									</Cell>
								</#if>
			
					</#if>
				</#list>
			</Row>
			</#list>
				<#elseif xmlState == 'END'>
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
</#if>


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
		<#assign times = date[1]?split(':')>
		<#setting number_format="0.000000000000#">
		<#assign totaltime = ((times[0]?number*60) + times[1]?number)/1440>
	</#if>${totalday + totaltime}</#macro>
						
								
								
								
