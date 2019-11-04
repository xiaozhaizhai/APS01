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
  		<Style ss:ID="batchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="doneNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="exeDate">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="exeStaff.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="state">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="storeID.placeSetCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="storeID.placeSetName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.wareCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="wareID.wareName">
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
									<#if item == 'productId.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'doneNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.wareCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.wareName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'wareID.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'storeID.placeSetCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'storeID.placeSetName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'exeStaff.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'exeDate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'state.value' || item == 'state.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'remark' || item == '*'>
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
								<#if item == 'productId.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772644833222')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737334')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1449796384550')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790594009')}</Data>
										</Cell>
								</#if>
								<#if item == 'doneNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790683313')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.wareCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031239866')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.wareName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1484031316281')}</Data>
										</Cell>
								</#if>
								<#if item == 'wareID.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'storeID.placeSetCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1489731651449')}</Data>
										</Cell>
								</#if>
								<#if item == 'storeID.placeSetName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1489731677162')}</Data>
										</Cell>
								</#if>
								<#if item == 'exeStaff.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790473893')}</Data>
										</Cell>
								</#if>
								<#if item == 'exeDate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790496670')}</Data>
										</Cell>
								</#if>
								<#if item == 'state.value' || item == 'state.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790699395')}</Data>
										</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790724898')}</Data>
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
								<#if item == 'productId.productCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.productCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_productId||MESBasic_1_product_Product_productCode') != 0>
										<Data ss:Type="String"><#if (data.productId.productCode)??>${(data.productId.productCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.productName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_productId||MESBasic_1_product_Product_productName') != 0>
										<Data ss:Type="String"><#if (data.productId.productName)??>${(data.productId.productName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'productId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_productId||MESBasic_1_product_Product_id') != 0>
										<Data ss:Type="Number"><#if (data.productId.id)??>${(data.productId.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'batchNum' || item == '*'>
									<Cell>
									<#if checkFieldPermission('batchNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_batchNum') != 0>
										<Data ss:Type="String"><#if (data.batchNum)??>${(data.batchNum)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'doneNum' || item == '*'>
									<Cell>
									<#if checkFieldPermission('doneNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_doneNum') != 0>
										<#if (data.doneNum)?has_content><Data ss:Type="Number">#{(data.doneNum)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'wareID.wareCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('wareID.wareCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_wareID||MESBasic_1_wareMan_Ware_wareCode') != 0>
										<Data ss:Type="String"><#if (data.wareID.wareCode)??>${(data.wareID.wareCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'wareID.wareName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('wareID.wareName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_wareID||MESBasic_1_wareMan_Ware_wareName') != 0>
										<Data ss:Type="String"><#if (data.wareID.wareName)??>${(data.wareID.wareName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'wareID.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('wareID.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_wareID||MESBasic_1_wareMan_Ware_id') != 0>
										<Data ss:Type="Number"><#if (data.wareID.id)??>${(data.wareID.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'storeID.placeSetCode' || item == '*'>
									<Cell>
									<#if checkFieldPermission('storeID.placeSetCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_storeID||MESBasic_1_storeSet_StoreSet_placeSetCode') != 0>
										<Data ss:Type="String"><#if (data.storeID.placeSetCode)??>${(data.storeID.placeSetCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'storeID.placeSetName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('storeID.placeSetName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_storeID||MESBasic_1_storeSet_StoreSet_placeSetName') != 0>
										<Data ss:Type="String"><#if (data.storeID.placeSetName)??>${(data.storeID.placeSetName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'exeStaff.name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('exeStaff.name','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeStaff||base_staff_name') != 0>
										<Data ss:Type="String"><#if (data.exeStaff.name)??>${(data.exeStaff.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'exeDate' || item == '*'>
									<Cell ss:StyleID="s8">
									<#if checkFieldPermission('exeDate','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate') != 0>
										<#if data.exeDate??><Data ss:Type="Number"><@workerdate datetime='${(data.exeDate)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'state.value' || item == 'state.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('state','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state') != 0>
										<Data ss:Type="String">${getText('${(data.state.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
									<Cell>
									<#if checkFieldPermission('remark','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_remark') != 0>
										<Data ss:Type="String"><#if (data.remark)??>${(data.remark)!}</#if></Data>
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
						
								
								
								
