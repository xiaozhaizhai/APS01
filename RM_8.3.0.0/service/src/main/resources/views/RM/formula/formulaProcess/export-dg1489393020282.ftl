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
  		<Style ss:ID="activeHiddenId">
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
  		<Style ss:ID="auto">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="batchPhaseName">
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
  		<Style ss:ID="container">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="execSort">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="exeSystem">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="finalInspection">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="fromContainer">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="hiddenSort">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="ingredientsOrder">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isAgile">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isAnaly">
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
  		<Style ss:ID="isWatchActive">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="longTime">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="lossRate">
  			<NumberFormat ss:Format="0.000000"/>
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
  		<Style ss:ID="mobileTerminal">
  			<NumberFormat/>
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
  		<Style ss:ID="product.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="product.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="qualityStandard.code">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="standardQuantity">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="testProduct.code">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
			 						    	<#assign customPropList = showCusProps.get("formulaProcessActive")  />
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
									<#if item == 'name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchPhaseName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'occurTurn.value' || item == 'occurTurn.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'fromContainer.value' || item == 'fromContainer.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'container' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'product.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isAgile' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isReplace' || item == '*'>
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
									<#if item == 'longTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'auto' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'actOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'ingredientsOrder' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'execSort' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'mobileTerminal' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'testProduct.code' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'qualityStandard.code' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isWatchActive' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isAnaly' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'finalInspection' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#assign customGeneratedFlag=false />
										<#if item == 'finalInspection' && !customGeneratedFlag >
										<#assign count = count + 1>
										<#assign customPropList = showCusProps.get("formulaProcessActive")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												 <Column ss:Index="${count}" ss:StyleID="${c.property.name}"  ss:Width="100" />
												 <#assign count = count + 1>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
										</#if>
									<#if item == 'meno' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'hiddenSort' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'channelOrManual' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeHiddenId' || item == '*'>
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
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330156499')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchPhaseName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1493276184676')}</Data>
										</Cell>
								</#if>
								<#if item == 'occurTurn.value' || item == 'occurTurn.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330199423')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330759313')}</Data>
										</Cell>
								</#if>
								<#if item == 'fromContainer.value' || item == 'fromContainer.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488697524885')}</Data>
										</Cell>
								</#if>
								<#if item == 'container' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488696547250')}</Data>
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
								<#if item == 'isAgile' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon15035391802161122')}</Data>
										</Cell>
								</#if>
								<#if item == 'isReplace' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331060176')}</Data>
										</Cell>
								</#if>
								<#if item == 'isMixQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488696577648')}</Data>
										</Cell>
								</#if>
								<#if item == 'standardQuantity' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331086583')}</Data>
										</Cell>
								</#if>
								<#if item == 'minQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488696602815')}</Data>
										</Cell>
								</#if>
								<#if item == 'maxQuality' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488696624224')}</Data>
										</Cell>
								</#if>
								<#if item == 'lossRate' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1495418354792')}</Data>
										</Cell>
								</#if>
								<#if item == 'longTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1490162289778')}</Data>
										</Cell>
								</#if>
								<#if item == 'auto' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331130107')}</Data>
										</Cell>
								</#if>
								<#if item == 'actOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1489911238343')}</Data>
										</Cell>
								</#if>
								<#if item == 'ingredientsOrder' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331110232')}</Data>
										</Cell>
								</#if>
								<#if item == 'execSort' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1539917544374')}</Data>
										</Cell>
								</#if>
								<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487330829749')}</Data>
										</Cell>
								</#if>
								<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488696458643')}</Data>
										</Cell>
								</#if>
								<#if item == 'mobileTerminal' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1497849359617')}</Data>
										</Cell>
								</#if>
								<#if item == 'testProduct.code' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon148759638486223')}</Data>
										</Cell>
								</#if>
								<#if item == 'qualityStandard.code' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon148759542443623')}</Data>
										</Cell>
								</#if>
								<#if item == 'isWatchActive' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon148869652642623')}</Data>
										</Cell>
								</#if>
								<#if item == 'isAnaly' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1543394912389')}</Data>
										</Cell>
								</#if>
								<#if item == 'finalInspection' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1497849337000')}</Data>
										</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'finalInspection' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("formulaProcessActive")  />
									<#-- 排布自定义字段 -->
									<#if customPropList?? && customPropList?has_content>
										<#list customPropList as c>
											<Cell><Data ss:Type="String">${getText('${(c.displayName)!}')}</Data></Cell>
										</#list>
									</#if>
									<#assign customGeneratedFlag=true />
									</#if>
								<#if item == 'meno' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1487331194516')}</Data>
										</Cell>
								</#if>
								<#if item == 'hiddenSort' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1539936079970')}</Data>
										</Cell>
								</#if>
								<#if item == 'channelOrManual' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488776431957')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeHiddenId' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1488158485925')}</Data>
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
								<#if item == 'batchPhaseName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.batchPhaseName)??>${(data.batchPhaseName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'occurTurn.value' || item == 'occurTurn.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.occurTurn.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeType.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'fromContainer.value' || item == 'fromContainer.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.fromContainer.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'container' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.container)??>${(data.container)!}</#if></Data>
									
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
								<#if item == 'isAgile' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isAgile)?? && data.isAgile>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
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
								<#if item == 'longTime' || item == '*'>
									<Cell>
									
										<#if (data.longTime)?has_content><Data ss:Type="Number">#{(data.longTime)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'auto' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.auto)?? && data.auto>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'actOrder' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.actOrder)??>${(data.actOrder)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'ingredientsOrder' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.ingredientsOrder)??>${(data.ingredientsOrder)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'execSort' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.execSort)??>${(data.execSort)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'batchSite.value' || item == 'batchSite.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.batchSite.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'exeSystem.value' || item == 'exeSystem.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.exeSystem.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'mobileTerminal' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.mobileTerminal)?? && data.mobileTerminal>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'testProduct.code' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.testProduct.code)??>${(data.testProduct.code)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'qualityStandard.code' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.qualityStandard.code)??>${(data.qualityStandard.code)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isWatchActive' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isWatchActive)?? && data.isWatchActive>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isAnaly' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isAnaly)?? && data.isAnaly>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'finalInspection' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.finalInspection)?? && data.finalInspection>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'finalInspection' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("formulaProcessActive")  />
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
								<#if item == 'meno' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.meno)??>${(data.meno)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'hiddenSort' || item == '*'>
									<Cell>
									
										<#if (data.hiddenSort)?has_content><Data ss:Type="Number">#{(data.hiddenSort)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'channelOrManual' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.channelOrManual)?? && data.channelOrManual>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeHiddenId' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.activeHiddenId)??>${(data.activeHiddenId)!}</#if></Data>
									
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
						
								
								
								
