
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
	<Style ss:ID="RM_7.5.0.0_formula_Formula_code">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_name">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_edition">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_product">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_produceType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_formulaType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_usedFor">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_isForProduct">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_state">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_startTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_endTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_isDafault">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_description">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_theoreYield">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_yieldFormula">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_longTime">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_qualityStandard">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_batchOverOnFinish">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_feedCondition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_advanceCharge">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_pickSite">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_setProcess">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_ownerPosition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_batchContral">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_batchFormula">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_mainMetarial">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_batchFormulaEdition">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_interfaceUrl">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_ownerStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_feedingMode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_batchFormulaID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_autoReportOnFinish">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_batchFormulaCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_yieldRange">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_processTableId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_supportEbr">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_sampleProj">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_isAnaly">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_saveFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_editions">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="RM_7.5.0.0_formula_Formula_isUseFormulaBom">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_code"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_name"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_edition"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_product"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_produceType"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_formulaType"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_usedFor"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_isForProduct"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_state"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_startTime"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_endTime"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_isDafault"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_description"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_theoreYield"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_yieldFormula"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_longTime"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_qualityStandard"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_batchOverOnFinish"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_feedCondition"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_advanceCharge"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_pickSite"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_setProcess"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_ownerPosition"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_batchContral"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_batchFormula"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_mainMetarial"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_batchFormulaEdition"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_interfaceUrl"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_ownerStaff"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_feedingMode"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_batchFormulaID"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_autoReportOnFinish"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_batchFormulaCode"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_yieldRange"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_processTableId"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_supportEbr"/>
			<Column ss:Index="37" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_sampleProj"/>
			<Column ss:Index="38" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_isAnaly"/>
			<Column ss:Index="39" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_saveFlag"/>
			<Column ss:Index="40" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_editions"/>
			<Column ss:Index="41" ss:Width="100"  ss:StyleID="RM_7.5.0.0_formula_Formula_isUseFormulaBom"/>
	<#assign secondCount=42/>
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
										RM_7.5.0.0_formula_Formula_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">标识</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_name
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">版本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_edition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">产品编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_product||MESBasic_1_product_Product_id
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
							<Data ss:Type="String">生产性质</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_produceType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">配方类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_formulaType||RM_7.5.0.0_formulaType_FormulaType_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">用途</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_usedFor
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产配方</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_isForProduct
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_state
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_startTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">停用时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_endTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">默认</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_isDafault
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">描述</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_description
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">理论收率(%)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_theoreYield
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">收率公式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_yieldFormula
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">标准时长(分)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_longTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">质量标准.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_qualityStandard||RM_7.5.0.0_qualityStandard_Stand_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控结束即完成</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_batchOverOnFinish
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">放料条件</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_feedCondition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">允许提前放料</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_advanceCharge
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">采样点.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_pickSite||RM_7.5.0.0_pickSite_PickSite_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">配方属性</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_setProcess
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">所有者岗位.岗位编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_ownerPosition||base_position_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_batchContral
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控配方.批控主配方ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_batchFormula||RM_7.5.0.0_batchFormula_BatchFormulaMain_batchFormulaId
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">主原料.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_mainMetarial||MESBasic_1_product_Product_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控版本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_batchFormulaEdition
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">中间接口服务地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_interfaceUrl
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">拥有者.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_ownerStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">投料模式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_feedingMode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控配方ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_batchFormulaID
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">完成后自动报工</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_autoReportOnFinish
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控配方编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_batchFormulaCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批产范围</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_yieldRange
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">表单号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_processTableId
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">支持EBR</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_supportEbr
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">样品模板.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_sampleProj||RM_7.5.0.0_sampleProj_SampleProj_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">统计标识</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_isAnaly
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">保存标识</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_saveFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">配方版本</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_editions
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用配方BOM</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										RM_7.5.0.0_formula_Formula_isUseFormulaBom
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
						<Range>R2C13:R65536C13</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C19:R65536C19</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C21:R65536C21</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C25:R65536C25</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C37:R65536C37</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C39:R65536C39</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C40:R65536C40</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C42:R65536C42</Range>
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