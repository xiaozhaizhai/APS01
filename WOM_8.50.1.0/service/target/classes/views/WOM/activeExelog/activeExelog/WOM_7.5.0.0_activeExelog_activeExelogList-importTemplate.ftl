
<#if customPropData?? && (customPropData?size>0) >
<#assign customProperties = customPropData.properties />
<#assign customStyleCodes = customPropData.styleCodes />
<#assign customStyleFormates = customPropData.styleFormats />
</#if>
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
	xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"
	xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40"
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>zhangbobin</Author>
		<Created>2015-07-16T18:33:57</Created>
	</DocumentProperties>
	<CustomDocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<KSOProductBuildVer dt:dt="string">2052-9.1.0.4167
		</KSOProductBuildVer>
	</CustomDocumentProperties>
	<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowWidth>20940</WindowWidth>
		<WindowHeight>10320</WindowHeight>
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
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskProcessID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_factoryId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskActiveID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_startTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_endTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_staffID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_exeState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_remark">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_ownerStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskBatchNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_materialBatchNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_actualNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_productID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_planNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_batchPhaseID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_activeExelog_ActiveExelog_ownerPosition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
		<#if customStyleFormates?? && (customStyleFormates?size>0) >
			<#list customStyleFormates as style>
				<Style ss:ID="${style.key}">
						<#if style['format']?? >
			  				<NumberFormat ss:Format="${style['format']}"/>
			  			<#else>
			  				<NumberFormat/>
			  			</#if>
			  			<Protection/>
				</Style>
			</#list>
		</#if>  
	</Styles>
<Worksheet ss:Name="sheet1">
	<Table ss:ExpandedColumnCount="256" ss:ExpandedRowCount="3" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskID"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskProcessID"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_factoryId"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskActiveID"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_startTime"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_endTime"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_staffID"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_exeState"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_remark"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_ownerStaff"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_taskBatchNum"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_materialBatchNum"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_actualNum"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_productID"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_planNum"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_batchPhaseID"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_activeExelog_ActiveExelog_ownerPosition"/>
	<#assign secondCount=18/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell >
							<Data ss:Type="String">物品名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_taskID||WOM_7.5.0.0_produceTask_ProduceTask_tableNo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String"></Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String"></Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工序名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_taskProcessID||WOM_7.5.0.0_produceTask_ProduceTaskProcess_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String"></Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String"></Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">执行单元</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_factoryId||MESBasic_1_factoryModel_FactoryModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String"></Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">活动名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_taskActiveID||WOM_7.5.0.0_produceTask_ProduceTaskActive_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">开始时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_startTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">结束时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_endTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">操作人</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_staffID||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">执行状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_exeState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_remark
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">拥有者.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_ownerStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_taskBatchNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物料批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_materialBatchNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">实际投料数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_actualNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物料.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_productID||MESBasic_1_product_Product_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计划投料数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_planNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控.phase</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_batchPhaseID
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">所有者岗位.岗位编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_activeExelog_ActiveExelog_ownerPosition||base_position_code
									 </ss:Data>
							</Comment>
						</Cell>
			<#if customProperties?? &&  (customProperties?size>0) >
				<#list customProperties as item >
								<Cell <#if item.nullAble??&&(!item.nullAble) >ss:StyleID="unNullable"</#if>>
									<Data ss:Type="String">${(item.columnName)!''}</Data>
									<Comment ss:Author="">
											 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
												${(item.propertyCode)!''}
											 </ss:Data>
									</Comment>
								</Cell>
				</#list>
			</#if>
		</Row>
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
		<#if customProperties?? && (customProperties?size>0) >
			<#assign customBooleanIndex = 1/>
			<#list customProperties as item>
					<#if item.columnType??&&item.columnType == 'BOOLEAN' >
						<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
								<Range>R2C${customBooleanIndex}:R65536C${customBooleanIndex}</Range>
								<Type>List</Type>
								<CellRangeList />
								<Value>&quot;是,否&quot;</Value>
								<ErrorStyle>Stop</ErrorStyle>
							</DataValidation>
					</#if>
					<#assign customBooleanIndex = customBooleanIndex +1 />
		   </#list>
		</#if>
</Worksheet>
</Workbook>