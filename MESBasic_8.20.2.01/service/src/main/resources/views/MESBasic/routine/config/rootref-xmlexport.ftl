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
  		<Style ss:ID="formula">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isDefault">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="maxAggValue">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="pumpBelong">
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
									<#if item == 'isDefault' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'maxAggValue' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'pumpBelong.value' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?substring(0,item?last_index_of('.'))}"/>
									</#if>
									<#if item == 'formula' || item == '*'>
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
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1416558524615')}</Data></Cell>
								</#if>
								<#if item == 'isDefault' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1416558214312')}</Data></Cell>
								</#if>
								<#if item == 'maxAggValue' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415338029833')}</Data></Cell>
								</#if>
								<#if item == 'pumpBelong.value' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415338200540')}</Data></Cell>
								</#if>
								<#if item == 'formula' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1426644791679')}</Data></Cell>
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
			
								<#if item == 'name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('name','MESBasic_1_routine_Config','MESBasic_1_routine_Config_name') != 0>
										<#if data.name??><Data ss:Type="String">${(data.name)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'isDefault' || item == '*'>
									<Cell>
									<#if checkFieldPermission('isDefault','MESBasic_1_routine_Config','MESBasic_1_routine_Config_isDefault') != 0>
										<Data ss:Type="String"><#if data.isDefault?? && data.isDefault>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'maxAggValue' || item == '*'>
									<Cell>
									<#if checkFieldPermission('maxAggValue','MESBasic_1_routine_Config','MESBasic_1_routine_Config_maxAggValue') != 0>
										<#if (data.maxAggValue)?has_content><Data ss:Type="Number">#{(data.maxAggValue)!; m4M4}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'pumpBelong.value' || item == '*'>
									<Cell>
									<#if checkFieldPermission('pumpBelong','MESBasic_1_routine_Config','MESBasic_1_routine_Config_pumpBelong') != 0>
										<Data ss:Type="String">${getText('${(data.pumpBelong.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'formula' || item == '*'>
									<Cell>
									<#if checkFieldPermission('formula','MESBasic_1_routine_Config','MESBasic_1_routine_Config_formula') != 0>
										<#if data.formula??><Data ss:Type="String">${(data.formula)!}</Data></#if>
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
						
								
								
								
