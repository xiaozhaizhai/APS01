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
  		<Style ss:ID="activeId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="itemId.crtValue">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="pmemo">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="precessStandards.quota">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="unitId.name">
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
									<#if item == 'unitId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'precessStandards.quota' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'itemId.crtValue' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'pmemo' || item == '*'>
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
								<#if item == 'unitId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.radion1419232393782vrvfrr')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.modelname.randon1487330059541')}</Data>
										</Cell>
								</#if>
								<#if item == 'precessStandards.quota' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331350188')}</Data>
										</Cell>
								</#if>
								<#if item == 'itemId.crtValue' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.radion1415260736864efef')}</Data>
										</Cell>
								</#if>
								<#if item == 'pmemo' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487987361282')}</Data>
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
								<#if item == 'unitId.name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('unitId.name','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_unitId||MESBasic_1_factoryModel_FactoryModel_name') != 0>
										<Data ss:Type="String"><#if (data.unitId.name)??>${(data.unitId.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'activeId.name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('activeId.name','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_activeId||RM_7.5.0.0_formula_FormulaProcessActive_name') != 0>
										<Data ss:Type="String"><#if (data.activeId.name)??>${(data.activeId.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'precessStandards.quota' || item == '*'>
									<Cell>
									<#if checkFieldPermission('precessStandards.quota','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_precessStandards||RM_7.5.0.0_formula_PrecessStandards_quota') != 0>
										<Data ss:Type="String"><#if (data.precessStandards.quota)??>${(data.precessStandards.quota)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'itemId.crtValue' || item == '*'>
									<Cell>
									<#if checkFieldPermission('itemId.crtValue','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_itemId||MESBasic_1_itemManage_ItemSetup_crtValue') != 0>
										<#if (data.itemId.crtValue)?has_content><Data ss:Type="Number">#{(data.itemId.crtValue)!; m4M4}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'pmemo' || item == '*'>
									<Cell>
									<#if checkFieldPermission('pmemo','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_pmemo') != 0>
										<Data ss:Type="String"><#if (data.pmemo)??>${(data.pmemo)!}</#if></Data>
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
						
								
								
								
