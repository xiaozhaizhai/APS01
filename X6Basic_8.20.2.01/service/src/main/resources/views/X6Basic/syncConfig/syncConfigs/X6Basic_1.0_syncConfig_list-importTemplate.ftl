
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
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_pandionUserName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_pandionDataSourse">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_des">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailDelSync">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_bbsDataSourse">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_bbsPassword">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailDomain">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_bbsAlias">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailUserName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_bbsUserName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailDataSourse">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_pandionDelSync">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailHomedir">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_pandionPassword">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_bbsDeleteSync">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailPassword">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="X6Basic_1.0_syncConfig_SyncConfigs_emailMaildir">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_pandionUserName"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_pandionDataSourse"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_des"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailDelSync"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_bbsDataSourse"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_bbsPassword"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailDomain"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_bbsAlias"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailUserName"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_bbsUserName"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailDataSourse"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_pandionDelSync"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailHomedir"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_pandionPassword"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_bbsDeleteSync"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailPassword"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="X6Basic_1.0_syncConfig_SyncConfigs_emailMaildir"/>
	<#assign secondCount=21/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell >
							<Data ss:Type="String">同步邮件账户</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">同步BBS账户</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">同步聊天工具账户</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">用户名</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_pandionUserName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据库连接</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_pandionDataSourse
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_des
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">删除时是否同步</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailDelSync
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据库连接</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_bbsDataSourse
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">密码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_bbsPassword
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">邮件域名</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailDomain
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">别名</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_bbsAlias
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">用户名</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailUserName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">用户名</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_bbsUserName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据库连接</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailDataSourse
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">删除时是否同步</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_pandionDelSync
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">邮件服务器目录</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailHomedir
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">密码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_pandionPassword
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">删除时是否同步</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_bbsDeleteSync
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">密码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailPassword
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">邮件存放目录</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										X6Basic_1.0_syncConfig_SyncConfigs_emailMaildir
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
						<Range>R2C1:R65536C1</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C2:R65536C2</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C3:R65536C3</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C7:R65536C7</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C15:R65536C15</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C18:R65536C18</Range>
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