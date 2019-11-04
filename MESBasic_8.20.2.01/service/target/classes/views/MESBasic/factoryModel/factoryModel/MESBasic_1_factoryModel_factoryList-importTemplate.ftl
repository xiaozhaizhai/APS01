
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
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_name">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_code">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_nodeType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_nodeDesc">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_department">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_workArea">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_area">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_isOnlyStore">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_isEbr">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_runState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_emsFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_interfaceUrl">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_assignBatchNo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_endItem">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_belongLine">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_fromSystemCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_factoryModel_FactoryModel_areaName">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_name"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_code"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_nodeType"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_nodeDesc"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_department"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_workArea"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_area"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_isOnlyStore"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_isEbr"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_runState"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_emsFlag"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_interfaceUrl"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_assignBatchNo"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_endItem"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_belongLine"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_fromSystemCode"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_factoryModel_FactoryModel_areaName"/>
	<#assign secondCount=18/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell >
							<Data ss:Type="String">节点名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_name
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">节点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">节点类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_nodeType||MESBasic_1_nodeType_NodeType_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">节点描述</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_nodeDesc
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">部门.部门编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_department||base_department_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产区域</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_workArea
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">位置</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_area
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">多货位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_isOnlyStore
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否同步EBR</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_isEbr
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">配料容器(组)状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_runState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参与能耗计划</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_emsFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">中间接口服务地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_interfaceUrl
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">指定批号位号.测点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_assignBatchNo||MESBasic_1_itemManage_ItemSetup_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">结束工序位号.测点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_endItem||MESBasic_1_itemManage_ItemSetup_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">所属生产线</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_belongLine
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">外部系统编号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_fromSystemCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">区域名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_factoryModel_FactoryModel_areaName
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
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C8:R65536C8</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C9:R65536C9</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C11:R65536C11</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
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