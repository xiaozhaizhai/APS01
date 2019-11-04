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
  		<Style ss:ID="rejectNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productBatchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectExeStaff.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="produceTaskId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchingPartId.id">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="ware.wareCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchingPartId.state">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectProduct.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectReasonId.isChangeNeed">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="ware.wareName">
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
  		<Style ss:ID="produceTaskId.productId.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="produceTaskId.factoryId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="produceTaskId.tableNo">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectReasonId.rejectReson">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectProduct.productName">
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
									<#if item == 'batchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectProduct.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectProduct.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productBatchNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectReasonId.rejectReson' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectReasonId.isChangeNeed' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
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
									<#if item == 'produceTaskId.tableNo' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'produceTaskId.factoryId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'produceTaskId.productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchingPartId.state.value' || item == 'batchingPartId.state.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'batchingPartId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'produceTaskId.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectExeStaff.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectTime' || item == '*'>
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
								<#if item == 'batchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543236260606')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectProduct.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772644833')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectProduct.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1415772740737')}</Data>
										</Cell>
								</#if>
								<#if item == 'productBatchNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543236355408')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543236406431')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectReasonId.rejectReson' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543218783588')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectReasonId.isChangeNeed' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543218766334')}</Data>
										</Cell>
								</#if>
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
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1489731651449')}</Data>
										</Cell>
								</#if>
								<#if item == 'store.placeSetName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1489731677162')}</Data>
										</Cell>
								</#if>
								<#if item == 'produceTaskId.tableNo' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.201811281617')}</Data>
										</Cell>
								</#if>
								<#if item == 'produceTaskId.factoryId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.201811281618002')}</Data>
										</Cell>
								</#if>
								<#if item == 'produceTaskId.productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.201811281619')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchingPartId.state.value' || item == 'batchingPartId.state.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1491790699395')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchingPartId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'produceTaskId.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('ec.common.ID')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectExeStaff.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('foundation.staff.dimissionStaff_xls.staffName')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543392762311')}</Data>
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
								<#if item == 'batchNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.batchNum)??>${(data.batchNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectProduct.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rejectProduct.productCode)??>${(data.rejectProduct.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectProduct.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rejectProduct.productName)??>${(data.rejectProduct.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productBatchNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productBatchNum)??>${(data.productBatchNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectNum' || item == '*'>
									<Cell>
									
										<#if (data.rejectNum)?has_content><Data ss:Type="Number">#{(data.rejectNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'rejectReasonId.rejectReson' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rejectReasonId.rejectReson)??>${(data.rejectReasonId.rejectReson)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectReasonId.isChangeNeed' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rejectReasonId.isChangeNeed)?? && data.rejectReasonId.isChangeNeed>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ware.wareCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.ware.wareCode)??>${(data.ware.wareCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ware.wareName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.ware.wareName)??>${(data.ware.wareName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'store.placeSetCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.store.placeSetCode)??>${(data.store.placeSetCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'store.placeSetName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.store.placeSetName)??>${(data.store.placeSetName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'produceTaskId.tableNo' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.produceTaskId.tableNo)??>${(data.produceTaskId.tableNo)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'produceTaskId.factoryId.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.produceTaskId.factoryId.name)??>${(data.produceTaskId.factoryId.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'produceTaskId.productId.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.produceTaskId.productId.productName)??>${(data.produceTaskId.productId.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'batchingPartId.state.value' || item == 'batchingPartId.state.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.batchingPartId.state.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'batchingPartId.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.batchingPartId.id)??>${(data.batchingPartId.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'produceTaskId.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.produceTaskId.id)??>${(data.produceTaskId.id)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectExeStaff.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.rejectExeStaff.name)??>${(data.rejectExeStaff.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectTime' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.rejectTime??><Data ss:Type="Number"><@workerdate datetime='${(data.rejectTime)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
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
						
								
								
								
