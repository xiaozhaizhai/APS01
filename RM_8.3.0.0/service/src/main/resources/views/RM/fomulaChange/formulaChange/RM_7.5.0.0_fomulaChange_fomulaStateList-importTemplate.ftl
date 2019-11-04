
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
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_formulaId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_oldState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_state">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_createStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_createTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_oldIsForProduct">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_ownerStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_ownerPosition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_oldUsedFor">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_meno">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_usedFor">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_isForProduct">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_fomulaChange_FormulaChange_changeType">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_formulaId"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_oldState"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_state"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_createStaff"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_createTime"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_oldIsForProduct"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_ownerStaff"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_ownerPosition"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_oldUsedFor"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_meno"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_usedFor"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_isForProduct"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="RM_7.5.0.0_fomulaChange_FormulaChange_changeType"/>
	<#assign secondCount=14/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell >
							<Data ss:Type="String">配方编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_formulaId||RM_7.5.0.0_formula_Formula_tableNo
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
							<Data ss:Type="String">原状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_oldState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">变更后的状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_state
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">变更申请人</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_createStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">变更申请时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_createTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">原生产配方</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_oldIsForProduct
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">拥有者.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_ownerStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">所有者岗位.岗位编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_ownerPosition||base_position_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">原用途</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_oldUsedFor
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_meno
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">用途</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_usedFor
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产配方(新)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_isForProduct
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">变更类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_fomulaChange_FormulaChange_changeType
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
						<Range>R2C14:R65536C14</Range>
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