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
  		<Style ss:ID="activeId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchNumObj.batchText">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchNumObj.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="formulaId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isMixQuality">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="lossRate">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="needWeigh">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="orderProcessId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="phase">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="planNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="processId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productBaseUnit.name">
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
  		<Style ss:ID="property">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="putBatMateId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="sequence">
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
									<#if item == 'productId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'property.value' || item == 'property.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'productId.productBaseUnit.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isMixQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'phase' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'sequence' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'needWeigh' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchNumObj.batchText' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'lossRate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'remark' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchNumObj.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'orderProcessId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'formulaId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'processId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'putBatMateId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'planNum' || item == '*'>
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
								<#if item == 'productId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1449796384550')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737455')}</Data>
										</Cell>
								</#if>
								<#if item == 'property.value' || item == 'property.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1503996516434')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productBaseUnit.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1398235640483')}</Data>
										</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489729935738')}</Data>
										</Cell>
								</#if>
								<#if item == 'phase' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1503995488887')}</Data>
										</Cell>
								</#if>
								<#if item == 'sequence' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1503995517319')}</Data>
										</Cell>
								</#if>
								<#if item == 'needWeigh' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1503995551484')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchNumObj.batchText' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490064501469')}</Data>
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
								<#if item == 'batchNumObj.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'orderProcessId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'formulaId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'processId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'putBatMateId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489730174515')}</Data>
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
								<#if item == 'productId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_productId||MESBasic_1_product_Product_id') != 0>
										<Data ss:Type="Number"><#if (data.productId.id)??>${(data.productId.id)!}</#if></Data>
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
								<#if item == 'property.value' || item == 'property.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('property','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_property') != 0>
										<Data ss:Type="String">${getText('${(data.property.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'productId.productBaseUnit.name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('productId.productBaseUnit.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_productId||MESBasic_1_product_Product_productBaseUnit||X6Basic_1.0_unitGroup_BaseUnit_name') != 0>
										<Data ss:Type="String"><#if (data.productId.productBaseUnit.name)??>${(data.productId.productBaseUnit.name)!}</#if></Data>
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
								<#if item == 'phase' || item == '*'>
									<Cell>
									<#if checkFieldPermission('phase','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_phase') != 0>
										<Data ss:Type="Number"><#if (data.phase)??>${(data.phase)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'sequence' || item == '*'>
									<Cell>
									<#if checkFieldPermission('sequence','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_sequence') != 0>
										<Data ss:Type="Number"><#if (data.sequence)??>${(data.sequence)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'needWeigh' || item == '*'>
									<Cell>
									<#if checkFieldPermission('needWeigh','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_needWeigh') != 0>
										<Data ss:Type="String"><#if (data.needWeigh)?? && data.needWeigh>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'batchNumObj.batchText' || item == '*'>
									<Cell>
									<#if checkFieldPermission('batchNumObj.batchText','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_batchNumObj||WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText') != 0>
										<Data ss:Type="String"><#if (data.batchNumObj.batchText)??>${(data.batchNumObj.batchText)!}</#if></Data>
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
								<#if item == 'batchNumObj.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('batchNumObj.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_batchNumObj||WOM_7.5.0.0_standingcropRef_StandingcropRef_id') != 0>
										<Data ss:Type="Number"><#if (data.batchNumObj.id)??>${(data.batchNumObj.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'orderProcessId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('orderProcessId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_orderProcessId||WOM_7.5.0.0_produceTask_ProduceTaskProcess_id') != 0>
										<Data ss:Type="Number"><#if (data.orderProcessId.id)??>${(data.orderProcessId.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'activeId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('activeId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_activeId||RM_7.5.0.0_formula_FormulaProcessActive_id') != 0>
										<Data ss:Type="Number"><#if (data.activeId.id)??>${(data.activeId.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'formulaId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('formulaId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_formulaId||RM_7.5.0.0_formula_Formula_id') != 0>
										<Data ss:Type="Number"><#if (data.formulaId.id)??>${(data.formulaId.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'processId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('processId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_processId||RM_7.5.0.0_formula_FormulaProcess_id') != 0>
										<Data ss:Type="Number"><#if (data.processId.id)??>${(data.processId.id)!}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'putBatMateId.id' || item == '*'>
									<Cell>
									<#if checkFieldPermission('putBatMateId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_putBatMateId||RM_7.5.0.0_formula_FormulaProcessActive_id') != 0>
										<Data ss:Type="Number"><#if (data.putBatMateId.id)??>${(data.putBatMateId.id)!}</#if></Data>
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
						
								
								
								
