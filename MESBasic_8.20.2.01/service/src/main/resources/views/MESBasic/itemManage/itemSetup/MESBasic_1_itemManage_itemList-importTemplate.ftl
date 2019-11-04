
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
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_code">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_itemNumber">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_itemName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_tagType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_itemClass">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_virtualTag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_itemPlace">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_crtValue">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_updatTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_formula">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_procedure">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_frequency">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_delay">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_manuallySet">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_calcType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_lastEvalue">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_unitCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_department">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_params">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_unit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_energyType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_projectType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_itemMemo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_lastStime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_lastSvalue">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_isSystem">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_machine">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_factor">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_workLine">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_itemRole">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_compareNumber">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_gatherLevel">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_compareTime">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_dataType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_isId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_lastEtime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm:ss"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_purpose">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_dataSouceType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_range">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_itemManage_ItemSetup_active">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_code"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_itemNumber"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_itemName"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_tagType"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_itemClass"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_virtualTag"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_itemPlace"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_crtValue"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_updatTime"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_formula"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_procedure"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_frequency"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_delay"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_manuallySet"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_calcType"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_lastEvalue"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_unitCode"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_department"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_params"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_unit"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_energyType"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_projectType"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_itemMemo"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_lastStime"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_lastSvalue"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_isSystem"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_machine"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_factor"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_workLine"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_itemRole"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_compareNumber"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_gatherLevel"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_compareTime"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_dataType"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_isId"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_lastEtime"/>
			<Column ss:Index="37" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_purpose"/>
			<Column ss:Index="38" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_dataSouceType"/>
			<Column ss:Index="39" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_range"/>
			<Column ss:Index="40" ss:Width="100"  ss:StyleID="MESBasic_1_itemManage_ItemSetup_active"/>
	<#assign secondCount=41/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">测点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产位号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_itemNumber
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">测点名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_itemName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_tagType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">位号属性</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_itemClass
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">虚拟位号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_virtualTag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">位置名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_itemPlace||MESBasic_1_placeManage_PlaceManage_placeCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">当前值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_crtValue
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">更新时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_updatTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计算公式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_formula
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工序</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_procedure
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据频率</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_frequency
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">时延(s)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_delay
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">手动设置相关测点</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_manuallySet
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">算法类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_calcType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近期末值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_lastEvalue
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">单位编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_unitCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">部门.部门编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_department||base_department_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">参数</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_params
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计量单位.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_unit||X6Basic_1.0_unitGroup_BaseUnit_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">能源类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_energyType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">项目类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_projectType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_itemMemo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近期初时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_lastStime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近期初值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_lastSvalue
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">系统定义</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_isSystem
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">装置名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_machine
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">修正公式</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_factor
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">作业区</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_workLine
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">测点角色</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_itemRole
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">比较数值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_compareNumber
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">统计级别</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_gatherLevel
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">比较时间(分钟)</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_compareTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">数据类型（与老系统兼容）</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_dataType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">同步S2ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_isId
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">最近期末时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_lastEtime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">测点用途</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_purpose
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">数据来源</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_dataSouceType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">量程</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_range
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_itemManage_ItemSetup_active
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
						<Range>R2C6:R65536C6</Range>
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
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C26:R65536C26</Range>
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