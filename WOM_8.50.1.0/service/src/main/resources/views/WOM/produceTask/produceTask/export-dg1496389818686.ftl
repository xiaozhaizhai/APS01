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
  		<Style ss:ID="activeId.auto">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.batchSite">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.container">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.exeSystem">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.finalInspection">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.fromContainer">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.longTime">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.occurTurn">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.pickSite.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.qualityStandard.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeId.testProduct.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="actOrder">
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
  		<Style ss:ID="mobileTerminal">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="offerOrder">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="orderProcessId.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="planNum">
  			<NumberFormat ss:Format="0.000000"/>
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
			 						    	<#assign customPropList = showCusProps.get("produceTaskActive")  />
											<#-- 排布自定义字段 -->
											<#if customPropList?? && customPropList?has_content>
												<#list customPropList as c>
													<Style ss:ID="${c.property.name}">
													<#if c['excelFormat']?? >
														<NumberFormat ss:Format="${c['excelFormat']}"/>
													<#else>
														<NumberFormat/>
													</#if>
														<Protection/>
													</Style>
												</#list>
											</#if>
 	</Styles>
	<Worksheet ss:Name="${sheetName!}">
		<Table ss:ExpandedColumnCount="256" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
 				<#assign count = 1>
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0 && item != "checkbox">
									<#if item == 'orderProcessId.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.occurTurn.value' || item == 'activeId.occurTurn.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeId.fromContainer.value' || item == 'activeId.fromContainer.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeId.container' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productId.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
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
									<#if item == 'activeId.longTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.auto' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'actOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'offerOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.batchSite.value' || item == 'activeId.batchSite.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeId.exeSystem.value' || item == 'activeId.exeSystem.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'mobileTerminal' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.testProduct.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.pickSite.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.qualityStandard.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeId.finalInspection' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#assign customGeneratedFlag=false />
										<#if item == 'activeId.finalInspection' && !customGeneratedFlag >
										<#assign count = count + 1>
										<#assign customPropList = showCusProps.get("produceTaskActive")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												 <Column ss:Index="${count}" ss:StyleID="${c.property.name}"  ss:Width="100" />
												 <#assign count = count + 1>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
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
								<#if item == 'orderProcessId.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489720649125')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.occurTurn.value' || item == 'activeId.occurTurn.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330199423')}</Data>
										</Cell>
								</#if>
								<#if item == 'name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490683872072')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489726359628')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.fromContainer.value' || item == 'activeId.fromContainer.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488697524885')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.container' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488696547250')}</Data>
										</Cell>
								</#if>
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
								<#if item == 'activeId.longTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330334270')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.auto' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331130107')}</Data>
										</Cell>
								</#if>
								<#if item == 'actOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489726473525')}</Data>
										</Cell>
								</#if>
								<#if item == 'offerOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1498091639306')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.batchSite.value' || item == 'activeId.batchSite.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon148733082974922')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.exeSystem.value' || item == 'activeId.exeSystem.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1490010085314')}</Data>
										</Cell>
								</#if>
								<#if item == 'mobileTerminal' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1497502665124')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.testProduct.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1490317960117445456767')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.pickSite.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon150457889470250033')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.qualityStandard.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon148759513963344')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeId.finalInspection' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1497849337000')}</Data>
										</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'activeId.finalInspection' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("produceTaskActive")  />
									<#-- 排布自定义字段 -->
									<#if customPropList?? && customPropList?has_content>
										<#list customPropList as c>
											<Cell><Data ss:Type="String">${getText('${(c.displayName)!}')}</Data></Cell>
										</#list>
									</#if>
									<#assign customGeneratedFlag=true />
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
								<#if item == 'orderProcessId.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.orderProcessId.name)??>${(data.orderProcessId.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.occurTurn.value' || item == 'activeId.occurTurn.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeId.occurTurn.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.name)??>${(data.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeType.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.fromContainer.value' || item == 'activeId.fromContainer.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeId.fromContainer.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.container' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeId.container)??>${(data.activeId.container)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productId.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productId.productCode)??>${(data.productId.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productId.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productId.productName)??>${(data.productId.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isReplace' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isReplace)?? && data.isReplace>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isMixQuality)?? && data.isMixQuality>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'standardNum' || item == '*'>
									<Cell>
									
										<#if (data.standardNum)?has_content><Data ss:Type="Number">#{(data.standardNum)!; m6M6}</Data></#if>
									
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
								<#if item == 'planNum' || item == '*'>
									<Cell>
									
										<#if (data.planNum)?has_content><Data ss:Type="Number">#{(data.planNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
									<Cell>
									
										<#if (data.lossRate)?has_content><Data ss:Type="Number">#{(data.lossRate)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'activeId.longTime' || item == '*'>
									<Cell>
									
										<#if (data.activeId.longTime)?has_content><Data ss:Type="Number">#{(data.activeId.longTime)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'activeId.auto' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeId.auto)?? && data.activeId.auto>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'actOrder' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.actOrder)??>${(data.actOrder)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'offerOrder' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.offerOrder)??>${(data.offerOrder)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.batchSite.value' || item == 'activeId.batchSite.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeId.batchSite.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.exeSystem.value' || item == 'activeId.exeSystem.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeId.exeSystem.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'mobileTerminal' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.mobileTerminal)?? && data.mobileTerminal>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.testProduct.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeId.testProduct.name)??>${(data.activeId.testProduct.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.pickSite.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeId.pickSite.name)??>${(data.activeId.pickSite.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.qualityStandard.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeId.qualityStandard.name)??>${(data.activeId.qualityStandard.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeId.finalInspection' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeId.finalInspection)?? && data.activeId.finalInspection>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'activeId.finalInspection' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("produceTaskActive")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												<Cell  ss:StyleID="${c.property.name}" >
												<#if c.property.type == 'DECIMAL' && c.property.decimalNum??>
													<#if data[c.property.name]??><Data ss:Type="<@datatype type='${(c.fieldType)!Text}'></@datatype>">${(data["${c.property.name?if_exists}"])!}</Data></#if>
												<#elseif  c.property.type == 'DATETIME'>
													<#if data[c.property.name]??><Data ss:Type="DateTime">${(data["${c.property.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif  c.property.type == 'DATE'>
													<#if data[c.property.name]??><Data ss:Type="DateTime">${(data["${c.property.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif  c.property.type == 'SYSTEMCODE'>
													<#assign tempVal='${(data["${c.property.name}MainDisplay"])!}'  />
													<Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>">${getText('${(tempVal)!}')}</Data>
												<#elseif  c.property.type == 'BOOLEAN'>
													<Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>">${(data["${c.property.name?if_exists}"]?string("是","否"))!}</Data>
												<#elseif  c.property.type == 'OBJECT'>
													<#assign attrMapVal='${(data["${c.property.name}MainDisplay"])!}'  />
													<#if data[c.property.name]??><Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>"><#if attrMapVal?? ><![CDATA[${attrMapVal}]]><#else><![CDATA[${(data["${c.property.name?if_exists}"])!}]]></#if></Data></#if>
												<#else>
													<#if data[c.property.name]??><Data ss:Type="<@datatype type='${(c.property.type)!Text}'></@datatype>"><![CDATA[${(data["${c.property.name?if_exists}"])!}]]></Data></#if>
												</#if>
												</Cell>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
									</#if>
								<#if item == 'remark' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.remark)??>${(data.remark)!}</#if></Data>
									
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
						
								
								
								
