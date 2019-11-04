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
  		<Style ss:ID="auto">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchSite">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="exeOrder">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isPlace">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="longTime">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="meno">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="product.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="standardQuantity">
  			<NumberFormat ss:Format="0.00"/>
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
									<#if item == 'exeOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isPlace' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'standardQuantity' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'auto' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'longTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
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
								<#if item == 'name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487811442421')}</Data>
										</Cell>
								</#if>
								<#if item == 'exeOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487811763250')}</Data>
										</Cell>
								</#if>
								<#if item == 'product.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772644833')}</Data>
										</Cell>
								</#if>
								<#if item == 'isPlace' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812026631')}</Data>
										</Cell>
								</#if>
								<#if item == 'standardQuantity' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812075915')}</Data>
										</Cell>
								</#if>
								<#if item == 'auto' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812128791')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487811905250')}</Data>
										</Cell>
								</#if>
								<#if item == 'longTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487811796153')}</Data>
										</Cell>
								</#if>
								<#if item == 'meno' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812510638')}</Data>
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
								<#if item == 'name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('name','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_name') != 0>
										<Data ss:Type="String"><#if (data.name)??>${(data.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'exeOrder' || item == '*'>
									<Cell>
									<#if checkFieldPermission('exeOrder','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_exeOrder') != 0>
										<Data ss:Type="Number"><#if (data.exeOrder)??>${(data.exeOrder)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'product.productCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('product.productCode','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_product||MESBasic_1_product_Product_productCode') != 0>
										<Data ss:Type="String"><#if (data.product.productCode)??>${(data.product.productCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'isPlace' || item == '*'>
									<Cell>
									<#if checkFieldPermission('isPlace','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_isPlace') != 0>
										<Data ss:Type="String"><#if (data.isPlace)?? && data.isPlace>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'standardQuantity' || item == '*'>
									<Cell>
									<#if checkFieldPermission('standardQuantity','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_standardQuantity') != 0>
										<#if (data.standardQuantity)?has_content><Data ss:Type="Number">#{(data.standardQuantity)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'auto' || item == '*'>
									<Cell>
									<#if checkFieldPermission('auto','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_auto') != 0>
										<Data ss:Type="String"><#if (data.auto)?? && data.auto>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('batchSite','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_batchSite') != 0>
										<Data ss:Type="String">${getText('${(data.batchSite.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'longTime' || item == '*'>
									<Cell>
									<#if checkFieldPermission('longTime','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_longTime') != 0>
										<#if (data.longTime)?has_content><Data ss:Type="Number">#{(data.longTime)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'meno' || item == '*'>
									<Cell>
									<#if checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_meno') != 0>
										<Data ss:Type="String"><#if (data.meno)??>${(data.meno)!}</#if></Data>
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
						
								
								
								
