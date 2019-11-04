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
  		<Style ss:ID="activeBatchStateID.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeSource">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="activeType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="actualNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="checkResult">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="checkResultID">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="dataSource">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="endTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="finalInspection">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="formularActice.isAnaly">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isAnaly">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isFinish">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="isPassCheck">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="planNum">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productID.productCode">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productID.productName">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="productNum">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="rejectsDealID">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="remark">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="startTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskActiveID.activeState">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="taskProcessID.name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
			 						    	<#assign customPropList = showCusProps.get("prodTaskActiExelog")  />
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
									<#if item == 'taskProcessID.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'isPassCheck' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'finalInspection' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'dataSource.value' || item == 'dataSource.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeSource.value' || item == 'activeSource.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'productID.productCode' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productID.productName' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'productNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'planNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'actualNum' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'taskActiveID.activeState.value' || item == 'taskActiveID.activeState.id' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'activeBatchStateID.name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'checkResult' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'checkResultID' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'rejectsDealID' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'startTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'endTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isFinish' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'formularActice.isAnaly' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'isAnaly' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'remark' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#assign customGeneratedFlag=false />
										<#if item == 'remark' && !customGeneratedFlag >
										<#assign count = count + 1>
										<#assign customPropList = showCusProps.get("prodTaskActiExelog")  />
										<#-- 排布自定义字段 -->
										<#if customPropList?? && customPropList?has_content>
											<#list customPropList as c>
												 <Column ss:Index="${count}" ss:StyleID="${c.property.name}"  ss:Width="100" />
												 <#assign count = count + 1>
											</#list>
										</#if>
										<#assign customGeneratedFlag=true />
										</#if>
 						<#assign count = count + 1>
						</#if>
					</#list>
				</#if>
 			
 			
 			
 			<Row ss:AutoFitHeight="0">
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0>
								<#if item == 'taskProcessID.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1489720649125')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1509414632809')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1496885739673')}</Data>
										</Cell>
								</#if>
								<#if item == 'isPassCheck' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon150941445567577')}</Data>
										</Cell>
								</#if>
								<#if item == 'finalInspection' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1509414528360')}</Data>
										</Cell>
								</#if>
								<#if item == 'dataSource.value' || item == 'dataSource.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495786231888')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeSource.value' || item == 'activeSource.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1509676150205')}</Data>
										</Cell>
								</#if>
								<#if item == 'productID.productCode' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1502676745355')}</Data>
										</Cell>
								</#if>
								<#if item == 'productID.productName' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.radion1415772740737455')}</Data>
										</Cell>
								</#if>
								<#if item == 'productNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495778711921')}</Data>
										</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495788715231')}</Data>
										</Cell>
								</#if>
								<#if item == 'actualNum' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495788684389')}</Data>
										</Cell>
								</#if>
								<#if item == 'taskActiveID.activeState.value' || item == 'taskActiveID.activeState.id' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1540798457415')}</Data>
										</Cell>
								</#if>
								<#if item == 'activeBatchStateID.name' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon15094279554246')}</Data>
										</Cell>
								</#if>
								<#if item == 'checkResult' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1509414588866')}</Data>
										</Cell>
								</#if>
								<#if item == 'checkResultID' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1509592075545')}</Data>
										</Cell>
								</#if>
								<#if item == 'rejectsDealID' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1509592106077')}</Data>
										</Cell>
								</#if>
								<#if item == 'startTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495778838166')}</Data>
										</Cell>
								</#if>
								<#if item == 'endTime' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495852239409')}</Data>
										</Cell>
								</#if>
								<#if item == 'isFinish' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1496885957793')}</Data>
										</Cell>
								</#if>
								<#if item == 'formularActice.isAnaly' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('RM.propertydisplayName.randon1543321671519')}</Data>
										</Cell>
								</#if>
								<#if item == 'isAnaly' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1543321974645')}</Data>
										</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
										<Cell>
											<Data ss:Type="String">${getText('WOM.propertydisplayName.randon1495779312198')}</Data>
										</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'remark' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("prodTaskActiExelog")  />
									<#-- 排布自定义字段 -->
									<#if customPropList?? && customPropList?has_content>
										<#list customPropList as c>
											<Cell><Data ss:Type="String">${getText('${(c.displayName)!}')}</Data></Cell>
										</#list>
									</#if>
									<#assign customGeneratedFlag=true />
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
								<#if item == 'taskProcessID.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.taskProcessID.name)??>${(data.taskProcessID.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeName)??>${(data.activeName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'activeType.value' || item == 'activeType.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeType.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'isPassCheck' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isPassCheck)?? && data.isPassCheck>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'finalInspection' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.finalInspection)?? && data.finalInspection>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'dataSource.value' || item == 'dataSource.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.dataSource.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeSource.value' || item == 'activeSource.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.activeSource.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'productID.productCode' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productID.productCode)??>${(data.productID.productCode)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productID.productName' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productID.productName)??>${(data.productID.productName)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'productNum' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.productNum)??>${(data.productNum)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'planNum' || item == '*'>
									<Cell>
									
										<#if (data.planNum)?has_content><Data ss:Type="Number">#{(data.planNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'actualNum' || item == '*'>
									<Cell>
									
										<#if (data.actualNum)?has_content><Data ss:Type="Number">#{(data.actualNum)!; m6M6}</Data></#if>
									
									</Cell>
								</#if>
								<#if item == 'taskActiveID.activeState.value' || item == 'taskActiveID.activeState.id' || item == '*'>
									<Cell>
									
										<Data ss:Type="String">${getText('${(data.taskActiveID.activeState.value)!}')}</Data>
									
									</Cell>
								</#if>
								<#if item == 'activeBatchStateID.name' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.activeBatchStateID.name)??>${(data.activeBatchStateID.name)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'checkResult' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.checkResult)??>${(data.checkResult)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'checkResultID' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.checkResultID)??>${(data.checkResultID)!}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'rejectsDealID' || item == '*'>
									<Cell>
									
										<Data ss:Type="Number"><#if (data.rejectsDealID)??>${(data.rejectsDealID)!}</#if></Data>
									
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
								<#if item == 'isFinish' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isFinish)?? && data.isFinish>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'formularActice.isAnaly' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.formularActice.isAnaly)?? && data.formularActice.isAnaly>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'isAnaly' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.isAnaly)?? && data.isAnaly>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									
									</Cell>
								</#if>
								<#if item == 'remark' || item == '*'>
									<Cell>
									
										<Data ss:Type="String"><#if (data.remark)??>${(data.remark)!}</#if></Data>
									
									</Cell>
								</#if>
								<#assign customGeneratedFlag=false />
									<#if item == 'remark' && !customGeneratedFlag >
									<#assign customPropList = showCusProps.get("prodTaskActiExelog")  />
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
						
								
								
								
