<#assign exportFields = dg1416558291086Page.exportFields />
<#assign result = dg1416558291086Page.result />
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
  		<Style ss:ID="backword">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="forword">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="stype">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="switcher.code">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="switcher.itemName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="switcher.itemNumber">
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
									<#if item == 'stype.value' || item == 'stype.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'switcher.code' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'switcher.itemNumber' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'switcher.itemName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'forword' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'backword' || item == '*'>
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
 			
								<#if item == 'stype.value' || item == 'stype.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1416558430815')}</Data>
										</Cell>
								</#if>
								<#if item == 'switcher.code' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415261315358')}</Data>
										</Cell>
								</#if>
								<#if item == 'switcher.itemNumber' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415258842136')}</Data>
										</Cell>
								</#if>
								<#if item == 'switcher.itemName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415258813793')}</Data>
										</Cell>
								</#if>
								<#if item == 'forword' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1416557806300')}</Data>
										</Cell>
								</#if>
								<#if item == 'backword' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1416557834819')}</Data>
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
			
								<#if item == 'stype.value' || item == 'stype.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('stype','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_stype') != 0>
										<Data ss:Type="String">${getText('${(data.stype.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'switcher.code' || item == '*'>
									<Cell>
									<#if checkFieldPermission('switcher.code','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_switcher||MESBasic_1_itemManage_ItemSetup_code') != 0>
										<Data ss:Type="String"><#if (data.switcher.code)??>${(data.switcher.code)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'switcher.itemNumber' || item == '*'>
									<Cell>
									<#if checkFieldPermission('switcher.itemNumber','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_switcher||MESBasic_1_itemManage_ItemSetup_itemNumber') != 0>
										<Data ss:Type="String"><#if (data.switcher.itemNumber)??>${(data.switcher.itemNumber)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'switcher.itemName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('switcher.itemName','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_switcher||MESBasic_1_itemManage_ItemSetup_itemName') != 0>
										<Data ss:Type="String"><#if (data.switcher.itemName)??>${(data.switcher.itemName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'forword' || item == '*'>
									<Cell>
									<#if checkFieldPermission('forword','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_forword') != 0>
										<Data ss:Type="String"><#if (data.forword)?? && data.forword>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'backword' || item == '*'>
									<Cell>
									<#if checkFieldPermission('backword','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_backword') != 0>
										<Data ss:Type="String"><#if (data.backword)?? && data.backword>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
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
						
								
								
								
