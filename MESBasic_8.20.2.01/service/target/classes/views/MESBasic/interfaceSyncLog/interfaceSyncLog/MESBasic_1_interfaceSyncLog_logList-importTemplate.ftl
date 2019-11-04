
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
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logTypeDes">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logFault">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logOperate">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logSynFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logIsIgnore">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logDate">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logBillNo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logID">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logType"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logTypeDes"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logFault"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logOperate"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logSynFlag"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logIsIgnore"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logDate"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logBillNo"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logStaff"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logID"/>
	<#assign secondCount=11/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">数据类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据类型描述</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logTypeDes
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">错误信息</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logFault
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">操作类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logOperate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">数据同步状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logSynFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否忽视</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logIsIgnore
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">同步时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">单据编号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logBillNo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">同步人员.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">数据PK值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_interfaceSyncLog_InterfaceSyncLog_logID
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
						<Range>R2C5:R65536C5</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C6:R65536C6</Range>
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