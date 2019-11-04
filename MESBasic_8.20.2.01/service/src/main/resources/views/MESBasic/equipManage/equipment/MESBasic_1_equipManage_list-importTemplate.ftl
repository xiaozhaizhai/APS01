
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
	<Style ss:ID="MESBasic_1_equipManage_Equipment_code">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_name">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_installPlace">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamBuyTime">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamVendorName">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamProduceFirm">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_demo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_areaNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_specialtyNew">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_otherspecia">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamSum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_isMea">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamAbc">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamInstallPlace">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamProduceDate">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamUseDeptId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamPeriodTime">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_relateContainer">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_autoCreateContainer">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_isSpecialNew">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_specialType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_fileState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamFigureNo">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamUseYear">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamUseDate">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamRunStateId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamModel">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_workcenter">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamDesignFirm">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamProductId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamIsSpecial">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamPeriodType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamPeriodUnit">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamDutyStaffId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamInstallFirm">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_fileDate">
  			<NumberFormat ss:Format="yyyy-mm-dd"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamParentCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamAssetCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_isRelateContainer">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamProduceCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamNetsum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamSpefic">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamHaveRunstate">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="MESBasic_1_equipManage_Equipment_eamProperty">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_code"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_name"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamType"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_installPlace"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamBuyTime"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamVendorName"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamProduceFirm"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_demo"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_areaNum"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_specialtyNew"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_otherspecia"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamSum"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamState"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_isMea"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamAbc"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamInstallPlace"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamProduceDate"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamUseDeptId"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamPeriodTime"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_relateContainer"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_autoCreateContainer"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_isSpecialNew"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_specialType"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_fileState"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamFigureNo"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamUseYear"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamUseDate"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamRunStateId"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamModel"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_workcenter"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamDesignFirm"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamProductId"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamIsSpecial"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamPeriodType"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamPeriodUnit"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamDutyStaffId"/>
			<Column ss:Index="37" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamInstallFirm"/>
			<Column ss:Index="38" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_fileDate"/>
			<Column ss:Index="39" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamParentCode"/>
			<Column ss:Index="40" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamAssetCode"/>
			<Column ss:Index="41" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_isRelateContainer"/>
			<Column ss:Index="42" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamProduceCode"/>
			<Column ss:Index="43" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamNetsum"/>
			<Column ss:Index="44" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamSpefic"/>
			<Column ss:Index="45" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamHaveRunstate"/>
			<Column ss:Index="46" ss:Width="100"  ss:StyleID="MESBasic_1_equipManage_Equipment_eamProperty"/>
	<#assign secondCount=47/>
	<#if customStyleCodes??>
		<#list customStyleCodes as scode>
			<Column ss:Index="${secondCount}" ss:Width="100"  ss:StyleID="${scode}"/>
			<#assign secondCount = secondCount + 1>
		</#list>
	</#if>
	
		<Row ss:AutoFitHeight="0">
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">设备名称</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_name
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">设备类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamType||MESBasic_1_eamType_EamType_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">区域位置</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_installPlace||MESBasic_1_area_Area_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">购入时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamBuyTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">供应商</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamVendorName
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">制造单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamProduceFirm
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_demo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">设备位号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_areaNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">专业</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_specialtyNew
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">其他特殊设备</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_otherspecia
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">原值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamSum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">设备状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否测量设备</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_isMea
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">ABC分类</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamAbc
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">安装位置</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamInstallPlace
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">出厂日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamProduceDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">使用部门.部门编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamUseDeptId||base_department_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">保养周期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamPeriodTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">容器.编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_relateContainer||MESBasic_1_container_Container_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">自动生成容器</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_autoCreateContainer
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否特种设备</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_isSpecialNew
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">特种设备类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_specialType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">建档标记</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_fileState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">图号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamFigureNo
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">使用年限</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamUseYear
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">启用日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamUseDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">运行状态ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamRunStateId
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">型号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamModel
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">工作中心.节点编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_workcenter||MESBasic_1_factoryModel_FactoryModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">设计单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamDesignFirm
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">物品ID.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamProductId||MESBasic_1_product_Product_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">特种设备</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamIsSpecial
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">周期类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamPeriodType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">周期单位</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamPeriodUnit
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">责任人.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamDutyStaffId||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">安装公司</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamInstallFirm
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">建档日期</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_fileDate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">归属编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamParentCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">资产编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamAssetCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">关联容器</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_isRelateContainer
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">出厂编号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamProduceCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">净值</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamNetsum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">规格</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamSpefic
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">关注运行</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamHaveRunstate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">设备属性</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										MESBasic_1_equipManage_Equipment_eamProperty
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
						<Range>R2C14:R65536C14</Range>
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
						<Range>R2C22:R65536C22</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C33:R65536C33</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C41:R65536C41</Range>
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