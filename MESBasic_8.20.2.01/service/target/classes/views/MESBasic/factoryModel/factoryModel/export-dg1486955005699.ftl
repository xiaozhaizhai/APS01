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
  		<Style ss:ID="product.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="product.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="store.placeSetCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="store.placeSetName">
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
									<#if item == 'ware.wareCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'ware.wareName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'store.placeSetCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'store.placeSetName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productName' || item == '*'>
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
								<#if item == 'ware.wareCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031239866')}</Data>
										</Cell>
								</#if>
								<#if item == 'ware.wareName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031316281')}</Data>
										</Cell>
								</#if>
								<#if item == 'store.placeSetCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1486607342343')}</Data>
										</Cell>
								</#if>
								<#if item == 'store.placeSetName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1486607374172')}</Data>
										</Cell>
								</#if>
								<#if item == 'product.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772644833')}</Data>
										</Cell>
								</#if>
								<#if item == 'product.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772740737')}</Data>
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
								<#if item == 'ware.wareCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('ware.wareCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_factoryModel_ObjWareStore_ware||MESBasic_1_wareMan_Ware_wareCode') != 0>
										<Data ss:Type="String"><#if (data.ware.wareCode)??>${(data.ware.wareCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'ware.wareName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('ware.wareName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_factoryModel_ObjWareStore_ware||MESBasic_1_wareMan_Ware_wareName') != 0>
										<Data ss:Type="String"><#if (data.ware.wareName)??>${(data.ware.wareName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'store.placeSetCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('store.placeSetCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_factoryModel_ObjWareStore_store||MESBasic_1_storeSet_StoreSet_placeSetCode') != 0>
										<Data ss:Type="String"><#if (data.store.placeSetCode)??>${(data.store.placeSetCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'store.placeSetName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('store.placeSetName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_factoryModel_ObjWareStore_store||MESBasic_1_storeSet_StoreSet_placeSetName') != 0>
										<Data ss:Type="String"><#if (data.store.placeSetName)??>${(data.store.placeSetName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'product.productCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('product.productCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_factoryModel_ObjWareStore_product||MESBasic_1_product_Product_productCode') != 0>
										<Data ss:Type="String"><#if (data.product.productCode)??>${(data.product.productCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'product.productName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('product.productName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_factoryModel_ObjWareStore_product||MESBasic_1_product_Product_productName') != 0>
										<Data ss:Type="String"><#if (data.product.productName)??>${(data.product.productName)!}</#if></Data>
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
						
								
								
								
