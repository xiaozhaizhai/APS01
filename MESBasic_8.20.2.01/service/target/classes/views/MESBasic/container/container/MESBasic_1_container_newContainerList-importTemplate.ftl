
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
	<Style ss:ID="MESBasic_1_container_Container_code">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_name">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_containerShape">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_containerStatus">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_product">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_person">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_department">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_produceMgr">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_radius">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_warehouse">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_stdDensity">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_volumneCalc">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_factorDisplay">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_propertyTags">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_containerType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_tankHeight">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_warePosition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_model">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_tankCapacity">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_llevel">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_remark">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_liquidDensityFactor">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_density">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_pimsurl">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_levelDeviation">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_tankMgr">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_gasDensityFactor">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_equip">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_container_Container_hlevel">
  			<NumberFormat ss:Format="0.000000"/>
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_code"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_name"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_containerShape"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_containerStatus"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_product"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_person"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_department"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_produceMgr"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_radius"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_warehouse"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_stdDensity"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_volumneCalc"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_factorDisplay"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_propertyTags"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_containerType"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_tankHeight"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_warePosition"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_model"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_tankCapacity"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_llevel"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_remark"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_liquidDensityFactor"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_density"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_pimsurl"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_levelDeviation"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_tankMgr"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_gasDensityFactor"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_equip"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="MESBasic_1_container_Container_hlevel"/>
	<#assign secondCount=30/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">储罐编号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">储罐名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_name
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">储罐形状</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_containerShape
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">储罐状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_containerStatus
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物料编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_product||MESBasic_1_product_Product_id
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
							<Data ss:Type="String">责任人</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_person||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">所属部门</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_department||base_department_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产区容器</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_produceMgr
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">半径(m)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_radius
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">仓库</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_warehouse
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">标准密度</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_stdDensity
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">体积计算公式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_volumneCalc
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">体积计算公式(展示用)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_factorDisplay
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">状态位号.测点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_propertyTags||MESBasic_1_itemManage_ItemSetup_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">容器类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_containerType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">罐高(m)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_tankHeight
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">库位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_warePosition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">型号.编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_model||MESBasic_1_tankModel_TankModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">罐总量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_tankCapacity
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最低工作液位(m)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_llevel
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_remark
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">液相密度修正公式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_liquidDensityFactor
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">储料密度</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_density
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">监控页面</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_pimsurl
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">实际液位偏差(m)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_levelDeviation
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">罐区容器</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_tankMgr
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">气相密度修正公式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_gasDensityFactor
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">设备.编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_equip||MESBasic_1_equipManage_Equipment_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最大工作液位(m)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_container_Container_hlevel
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
						<Range>R2C9:R65536C9</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C27:R65536C27</Range>
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