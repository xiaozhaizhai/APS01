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
  		<Style ss:ID="action">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="businessType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="containerId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="destination">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="desType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="endLevel">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="endTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="flowRecordId">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="gasVolume">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="gasWeight">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="levelDiff">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="liquidVolume">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="liquidWeight">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productId.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="routineId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="source">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="sourceType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="startLevel">
  			<NumberFormat ss:Format="0.000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="startTime">
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
									<#if item == 'containerId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'businessType' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'action' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'liquidWeight' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'liquidVolume' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'gasWeight' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'gasVolume' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'startLevel' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'endLevel' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'levelDiff' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'startTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'endTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'source' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'sourceType' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'destination' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'desType' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'routineId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'flowRecordId' || item == '*'>
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
								<#if item == 'containerId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion141526839345211')}</Data>
										</Cell>
								</#if>
								<#if item == 'businessType' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293349287')}</Data>
										</Cell>
								</#if>
								<#if item == 'action' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293390953')}</Data>
										</Cell>
								</#if>
								<#if item == 'liquidWeight' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293194490')}</Data>
										</Cell>
								</#if>
								<#if item == 'liquidVolume' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293206265')}</Data>
										</Cell>
								</#if>
								<#if item == 'gasWeight' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293233181')}</Data>
										</Cell>
								</#if>
								<#if item == 'gasVolume' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293260505')}</Data>
										</Cell>
								</#if>
								<#if item == 'startLevel' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293181589')}</Data>
										</Cell>
								</#if>
								<#if item == 'endLevel' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293218148')}</Data>
										</Cell>
								</#if>
								<#if item == 'levelDiff' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293248327')}</Data>
										</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion141577274073711')}</Data>
										</Cell>
								</#if>
								<#if item == 'startTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293161365')}</Data>
										</Cell>
								</#if>
								<#if item == 'endTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293170857')}</Data>
										</Cell>
								</#if>
								<#if item == 'source' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293376259')}</Data>
										</Cell>
								</#if>
								<#if item == 'sourceType' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293383468')}</Data>
										</Cell>
								</#if>
								<#if item == 'destination' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293360137')}</Data>
										</Cell>
								</#if>
								<#if item == 'desType' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293367908')}</Data>
										</Cell>
								</#if>
								<#if item == 'routineId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion141533659780133')}</Data>
										</Cell>
								</#if>
								<#if item == 'flowRecordId' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('MESBasic.propertydisplayName.randon1555293271767')}</Data>
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
								<#if item == 'containerId.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.containerId.name)??>${(data.containerId.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'businessType' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.businessType)??>${(data.businessType)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'action' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.action)??>${(data.action)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'liquidWeight' || item == '*'>
									<Cell>
									
										<#if (data.liquidWeight)?has_content><Data ss:Type="Number">#{(data.liquidWeight)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'liquidVolume' || item == '*'>
									<Cell>
									
										<#if (data.liquidVolume)?has_content><Data ss:Type="Number">#{(data.liquidVolume)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'gasWeight' || item == '*'>
									<Cell>
									
										<#if (data.gasWeight)?has_content><Data ss:Type="Number">#{(data.gasWeight)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'gasVolume' || item == '*'>
									<Cell>
									
										<#if (data.gasVolume)?has_content><Data ss:Type="Number">#{(data.gasVolume)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'startLevel' || item == '*'>
									<Cell>
									
										<#if (data.startLevel)?has_content><Data ss:Type="Number">#{(data.startLevel)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'endLevel' || item == '*'>
									<Cell>
									
										<#if (data.endLevel)?has_content><Data ss:Type="Number">#{(data.endLevel)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'levelDiff' || item == '*'>
									<Cell>
									
										<#if (data.levelDiff)?has_content><Data ss:Type="Number">#{(data.levelDiff)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productId.productName)??>${(data.productId.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'startTime' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.startTime??><Data ss:Type="Number"><@workerdate datetime='${(data.startTime)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'endTime' || item == '*'>
									<Cell ss:StyleID="s8">
									
										<#if data.endTime??><Data ss:Type="Number"><@workerdate datetime='${(data.endTime)!?string("yyyy-MM-dd HH:mm:ss")}'></@workerdate></Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'source' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.source)??>${(data.source)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'sourceType' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.sourceType)??>${(data.sourceType)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'destination' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.destination)??>${(data.destination)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'desType' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.desType)??>${(data.desType)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'routineId.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.routineId.name)??>${(data.routineId.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'flowRecordId' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.flowRecordId)??>${(data.flowRecordId)!}</#if></Data>
									
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
						
								
								
								
