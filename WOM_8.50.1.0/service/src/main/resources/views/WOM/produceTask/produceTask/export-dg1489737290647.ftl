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
  		<Style ss:ID="actOrder">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="exeSystem">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isMixQuality">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isReplace">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="lossRate">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="maxQuality">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="minQuality">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="planNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="proBatch">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="processId.name">
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
  		<Style ss:ID="standardNum">
  			<NumberFormat ss:Format="0.000000"/>
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
									<#if item == 'proBatch' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'processId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'actOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'isReplace' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isMixQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'standardNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'minQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'maxQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'planNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'lossRate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
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
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion14157726448331')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737455')}</Data>
										</Cell>
								</#if>
								<#if item == 'proBatch' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489730022829')}</Data>
										</Cell>
								</#if>
								<#if item == 'processId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487295011793')}</Data>
										</Cell>
								</#if>
								<#if item == 'actOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489726473525')}</Data>
										</Cell>
								</#if>
								<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489726529240')}</Data>
										</Cell>
								</#if>
								<#if item == 'isReplace' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489726453862')}</Data>
										</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489729935738')}</Data>
										</Cell>
								</#if>
								<#if item == 'standardNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489730105405')}</Data>
										</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489729953842')}</Data>
										</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489729974625')}</Data>
										</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489730174515')}</Data>
										</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489730189645')}</Data>
										</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489730249805')}</Data>
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
									<#if checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_productId||MESBasic_1_product_Product_productCode') != 0>
										<Data ss:Type="String"><#if (data.productId.productCode)??>${(data.productId.productCode)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_productId||MESBasic_1_product_Product_productName') != 0>
										<Data ss:Type="String"><#if (data.productId.productName)??>${(data.productId.productName)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'proBatch' || item == '*'>
									<Cell>
									<#if checkFieldPermission('proBatch','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_proBatch') != 0>
										<Data ss:Type="String"><#if (data.proBatch)??>${(data.proBatch)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'processId.name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('processId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_processId||RM_7.5.0.0_formula_FormulaProcess_name') != 0>
										<Data ss:Type="String"><#if (data.processId.name)??>${(data.processId.name)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'actOrder' || item == '*'>
									<Cell>
									<#if checkFieldPermission('actOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_actOrder') != 0>
										<Data ss:Type="Number"><#if (data.actOrder)??>${(data.actOrder)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem') != 0>
										<Data ss:Type="String">${getText('${(data.exeSystem.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'isReplace' || item == '*'>
									<Cell>
									<#if checkFieldPermission('isReplace','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isReplace') != 0>
										<Data ss:Type="String"><#if (data.isReplace)?? && data.isReplace>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
									<Cell>
									<#if checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality') != 0>
										<Data ss:Type="String"><#if (data.isMixQuality)?? && data.isMixQuality>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'standardNum' || item == '*'>
									<Cell>
									<#if checkFieldPermission('standardNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_standardNum') != 0>
										<#if (data.standardNum)?has_content><Data ss:Type="Number">#{(data.standardNum)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
									<Cell>
									<#if checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality') != 0>
										<#if (data.minQuality)?has_content><Data ss:Type="Number">#{(data.minQuality)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
									<Cell>
									<#if checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality') != 0>
										<#if (data.maxQuality)?has_content><Data ss:Type="Number">#{(data.maxQuality)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
									<Cell>
									<#if checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum') != 0>
										<#if (data.planNum)?has_content><Data ss:Type="Number">#{(data.planNum)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
									<Cell>
									<#if checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate') != 0>
										<#if (data.lossRate)?has_content><Data ss:Type="Number">#{(data.lossRate)!; m6M6}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
									<Cell>
									<#if checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark') != 0>
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
						
								
								
								
