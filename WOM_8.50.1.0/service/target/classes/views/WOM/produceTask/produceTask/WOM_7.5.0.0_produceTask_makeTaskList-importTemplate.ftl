
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
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_manuOrderMain">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_productId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_formularId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_factoryId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_taskState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_planStartTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_planEndTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_actStartTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_actEndTime">
  			<NumberFormat ss:Format="yyyy-mm-dd\ HH:mm"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_staticFlag">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_remark">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_ownerPosition">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_batchNumRule">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_workType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_ownerStaff">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_productNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_packageType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_recycleTime">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_batchTaskState">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_batchProdTaskID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_advanceCharge">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_batchProduceNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_workCode">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_finishNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_taskType">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_lossRate">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_planParId">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_bulkProduct">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_isAnaly">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_bulkNum">
  			<NumberFormat ss:Format="0.000000"/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_autoReportOnFinish">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_interfaceUrl">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_isHasMaterial">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_reWorkBatchNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_supportEbr">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_bulkBatchNum">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_team">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_tasksID">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_changePackageForm">
  			<NumberFormat/>
  			<Protection/>
	</Style>
	<Style ss:ID="WOM_7.5.0.0_produceTask_ProduceTask_batchContral">
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
			<Column ss:Index="1" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_manuOrderMain"/>
			<Column ss:Index="2" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_productId"/>
			<Column ss:Index="3" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum"/>
			<Column ss:Index="4" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_formularId"/>
			<Column ss:Index="5" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_factoryId"/>
			<Column ss:Index="6" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_taskState"/>
			<Column ss:Index="7" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_planStartTime"/>
			<Column ss:Index="8" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_planEndTime"/>
			<Column ss:Index="9" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_actStartTime"/>
			<Column ss:Index="10" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_actEndTime"/>
			<Column ss:Index="11" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_staticFlag"/>
			<Column ss:Index="12" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_remark"/>
			<Column ss:Index="13" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_ownerPosition"/>
			<Column ss:Index="14" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_batchNumRule"/>
			<Column ss:Index="15" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_workType"/>
			<Column ss:Index="16" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_ownerStaff"/>
			<Column ss:Index="17" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_productNum"/>
			<Column ss:Index="18" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_packageType"/>
			<Column ss:Index="19" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_recycleTime"/>
			<Column ss:Index="20" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_batchTaskState"/>
			<Column ss:Index="21" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_batchProdTaskID"/>
			<Column ss:Index="22" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_advanceCharge"/>
			<Column ss:Index="23" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_batchProduceNum"/>
			<Column ss:Index="24" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_workCode"/>
			<Column ss:Index="25" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_finishNum"/>
			<Column ss:Index="26" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_taskType"/>
			<Column ss:Index="27" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_lossRate"/>
			<Column ss:Index="28" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_planParId"/>
			<Column ss:Index="29" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_bulkProduct"/>
			<Column ss:Index="30" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_isAnaly"/>
			<Column ss:Index="31" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_bulkNum"/>
			<Column ss:Index="32" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_autoReportOnFinish"/>
			<Column ss:Index="33" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_interfaceUrl"/>
			<Column ss:Index="34" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_isHasMaterial"/>
			<Column ss:Index="35" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_reWorkBatchNum"/>
			<Column ss:Index="36" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_supportEbr"/>
			<Column ss:Index="37" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_bulkBatchNum"/>
			<Column ss:Index="38" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_team"/>
			<Column ss:Index="39" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_tasksID"/>
			<Column ss:Index="40" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_changePackageForm"/>
			<Column ss:Index="41" ss:Width="100"  ss:StyleID="WOM_7.5.0.0_produceTask_ProduceTask_batchContral"/>
	<#assign secondCount=42/>
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
										WOM_7.5.0.0_produceTask_ProduceTask_manuOrderMain||WOM_7.5.0.0_manulOrder_ManulOrderMain_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">产品编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_productId||MESBasic_1_product_Product_id
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
							<Data ss:Type="String">生产批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">配方编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_formularId||RM_7.5.0.0_formula_Formula_tableNo
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
							<Data ss:Type="String">生产线</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_factoryId||MESBasic_1_factoryModel_FactoryModel_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">执行状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_taskState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计划开始时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_planStartTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计划结束时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_planEndTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">实际开始时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_actStartTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">实际完成时间</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_actEndTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">统计标识</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_staticFlag
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">备注</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_remark
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">所有者岗位.岗位编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_ownerPosition||base_position_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批号规则.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_batchNumRule||WOM_7.5.0.0_batchNumRule_BatchNumRule_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_workType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell ss:StyleID="unNullable">
							<Data ss:Type="String">拥有者.人员编码</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_ownerStaff||base_staff_code
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">生产数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_productNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">包装类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_packageType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">回收次数</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_recycleTime
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控状态</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_batchTaskState
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控控制配方ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_batchProdTaskID
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">通知放料</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_advanceCharge
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">制造数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_batchProduceNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">APS工单号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_workCode
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">完成数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_finishNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">指令单类型</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_taskType
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">损耗率</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_lossRate
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">计划.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_planParId||WOM_7.5.0.0_producePlanRef_DayBatchPlanParts_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">待包装产品.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_bulkProduct||MESBasic_1_product_Product_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否统计工艺</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_isAnaly
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">待包装数量</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_bulkNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">完成后自动报工</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_autoReportOnFinish
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控接口服务器地址</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_interfaceUrl
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">是否已配料</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_isHasMaterial
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">返工前批号.批号</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_reWorkBatchNum||publicSet_1.0_batchInformation_BatchInfo_batchNum
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">支持EBR</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_supportEbr
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">待包装批号.ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_bulkBatchNum||WOM_7.5.0.0_standingcropRef_StandingcropRef_id
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">班组</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_team
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批量指令单明细ID</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_tasksID
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">换包装审批单</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_changePackageForm
									 </ss:Data>
							</Comment>
						</Cell>
						<Cell >
							<Data ss:Type="String">批控</Data>
							<Comment ss:Author="">
									 <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
										WOM_7.5.0.0_produceTask_ProduceTask_batchContral
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
						<Range>R2C15:R65536C15</Range>
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
						<Range>R2C34:R65536C34</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C38:R65536C38</Range>
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
						<Range>R2C45:R65536C45</Range>
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