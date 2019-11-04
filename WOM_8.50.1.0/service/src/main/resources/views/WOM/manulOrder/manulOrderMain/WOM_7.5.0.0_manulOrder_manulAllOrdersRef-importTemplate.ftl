
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
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_product">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_ware">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderNumber">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_edition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_unit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_planStartTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_planEndTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_factory">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_remarks">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_hasManualNumber">
  			<NumberFormat ss:Format="0.00"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_isFinshed">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulStaff">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_product"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_ware"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderNumber"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_edition"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_unit"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_planStartTime"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_planEndTime"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_factory"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_remarks"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_hasManualNumber"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_isFinshed"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulStaff"/>
	<#assign secondCount=17/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell >
							<Data ss:Type="String">生产订单号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_product||MESBasic_1_product_Product_id
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
							<Data ss:Type="String">库存地点</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_ware||MESBasic_1_wareMan_Ware_wareCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">订单数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_orderNumber
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">订单类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_orderTyep
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产版本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_edition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">单位名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_unit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">基本开始时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_planStartTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">基本结束时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_planEndTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">销售订单号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">销售订单项目</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_saleOrderProject
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工厂代码.节点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_factory||MESBasic_1_factoryModel_FactoryModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_remarks
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">已生产数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_hasManualNumber
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">完成状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_isFinshed
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产管理员.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_manulOrder_ManulOrderMain_manulStaff||base_staff_code
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
						<Range>R2C16:R65536C16</Range>
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