<#assign exportFields = dgPage.exportFields />
<#assign result = dgPage.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign showCusProps =  dgPage.showCusProps />
	<?xml version="1.0"?>
	<?mso-application progid="Excel.Sheet"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>datagriCommonExport</Author>
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
  		<Style ss:ID="addFlag">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchSite">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="channelOrManual">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="exeSystem">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="formulaType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="ingredientsOrder">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isMixQuality">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isPlace">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="lossRate">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="maxQuality">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="meno">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="minQuality">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="occurTurn">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="product.productBaseUnit.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="product.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="product.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="saveFlag">
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
									<#if item == 'ingredientsOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'product.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productBaseUnit.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isPlace' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isMixQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'standardQuantity' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'minQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'maxQuality' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'lossRate' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'formulaType.value' || item == 'formulaType.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'occurTurn.value' || item == 'occurTurn.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'saveFlag' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'addFlag' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'channelOrManual' || item == '*'>
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
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487811442421223')}</Data>
										</Cell>
								</#if>
								<#if item == 'ingredientsOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812100211')}</Data>
										</Cell>
								</#if>
								<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon149061416353245')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon148781190525023')}</Data>
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
								<#if item == 'product.productBaseUnit.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.radion139823564048323')}</Data>
										</Cell>
								</#if>
								<#if item == 'isPlace' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812026631')}</Data>
										</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488697216181')}</Data>
										</Cell>
								</#if>
								<#if item == 'standardQuantity' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487812075915')}</Data>
										</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488697198714')}</Data>
										</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488697171334')}</Data>
										</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1491544403180')}</Data>
										</Cell>
								</#if>
								<#if item == 'formulaType.value' || item == 'formulaType.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487811825429')}</Data>
										</Cell>
								</#if>
								<#if item == 'occurTurn.value' || item == 'occurTurn.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488770817816')}</Data>
										</Cell>
								</#if>
								<#if item == 'saveFlag' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488329849392')}</Data>
										</Cell>
								</#if>
								<#if item == 'addFlag' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488331230571')}</Data>
										</Cell>
								</#if>
								<#if item == 'channelOrManual' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488877235631')}</Data>
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
									
										<Data ss:Type="String"><#if (data.name)??>${(data.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ingredientsOrder' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.ingredientsOrder)??>${(data.ingredientsOrder)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.exeSystem.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.batchSite.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'product.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.product.productCode)??>${(data.product.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'product.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.product.productName)??>${(data.product.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'product.productBaseUnit.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.product.productBaseUnit.name)??>${(data.product.productBaseUnit.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isPlace' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isPlace)?? && data.isPlace>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isMixQuality)?? && data.isMixQuality>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'standardQuantity' || item == '*'>
									<Cell>
									
										<#if (data.standardQuantity)?has_content><Data ss:Type="Number">#{(data.standardQuantity)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
									<Cell>
									
										<#if (data.minQuality)?has_content><Data ss:Type="Number">#{(data.minQuality)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
									<Cell>
									
										<#if (data.maxQuality)?has_content><Data ss:Type="Number">#{(data.maxQuality)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
									<Cell>
									
										<#if (data.lossRate)?has_content><Data ss:Type="Number">#{(data.lossRate)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'formulaType.value' || item == 'formulaType.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.formulaType.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'occurTurn.value' || item == 'occurTurn.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.occurTurn.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'saveFlag' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.saveFlag)?? && data.saveFlag>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'addFlag' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.addFlag)?? && data.addFlag>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'channelOrManual' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.channelOrManual)?? && data.channelOrManual>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'meno' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.meno)??>${(data.meno)!}</#if></Data>
									
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
						
								
								
								
