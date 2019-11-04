<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1542100698339" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<recordProduct.id IsHiddenField="true"></recordProduct.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign processName_defaultValue=''>
						 						<#assign processName_defaultValue=''>
				<#assign processName_defaultText=''>
				<processName
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (processName_defaultValue)?? &&(processName_defaultValue)?has_content>
							defaultValue='${(processName_defaultValue!)?string}'
						</#if>
						<#if (processName_defaultText)?? &&(processName_defaultText)?has_content>
							defaultText='${(processName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">工序名称</processName>
				<#assign isRef = false >
				<#assign acticeName_defaultValue=''>
						 						<#assign acticeName_defaultValue=''>
				<#assign acticeName_defaultText=''>
				<acticeName
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (acticeName_defaultValue)?? &&(acticeName_defaultValue)?has_content>
							defaultValue='${(acticeName_defaultValue!)?string}'
						</#if>
						<#if (acticeName_defaultText)?? &&(acticeName_defaultText)?has_content>
							defaultText='${(acticeName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">活动名称</acticeName>
				<#assign isRef = false >
				<#assign activeType_defaultValue=''>
						 						<#assign activeType_defaultValue=''>
				<#assign activeType_defaultText=''>
				<activeType.id
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('activeType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeType_defaultValue)?? &&(activeType_defaultValue)?has_content>
							defaultValue='${(activeType_defaultValue!)?string}'
						</#if>
						<#if (activeType_defaultText)?? &&(activeType_defaultText)?has_content>
							defaultText='${(activeType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动类型</activeType.id>
				<#assign isRef = false >
				<#assign activeRecordState_defaultValue='processState/state02'>
						 						<#assign activeRecordState_defaultValue='processState/state02'>
				<#assign activeRecordState_defaultText=''>
				<activeRecordState.id
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('processState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeRecordState_defaultValue)?? &&(activeRecordState_defaultValue)?has_content>
							defaultValue='${(activeRecordState_defaultValue!)?string}'
						</#if>
						<#if (activeRecordState_defaultText)?? &&(activeRecordState_defaultText)?has_content>
							defaultText='${(activeRecordState_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动状态</activeRecordState.id>
				<#assign isRef = false >
				<#assign recordDataSource_defaultValue=''>
						 						<#assign recordDataSource_defaultValue=''>
				<#assign recordDataSource_defaultText=''>
				<recordDataSource.id
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('womActiveSource')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (recordDataSource_defaultValue)?? &&(recordDataSource_defaultValue)?has_content>
							defaultValue='${(recordDataSource_defaultValue!)?string}'
						</#if>
						<#if (recordDataSource_defaultText)?? &&(recordDataSource_defaultText)?has_content>
							defaultText='${(recordDataSource_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动来源</recordDataSource.id>
				<#assign isRef = false >
				<#assign recordProduct_productCode_defaultValue=''>
												<#assign recordProduct_productCode_defaultValue=''>
				<#if (recordProduct_productCode_defaultValue!)?string=="currentUser">
					<#assign recordProduct_productCode_defaultValue='${staffJson!}'>
				<#elseif (recordProduct_productCode_defaultValue!)?string=="currentPost">
					<#assign recordProduct_productCode_defaultValue='${postJson!}'>
				<#elseif (recordProduct_productCode_defaultValue!)?string=="currentDepart">
					<#assign recordProduct_productCode_defaultValue='${deptJson!}'>
				<#elseif (recordProduct_productCode_defaultValue!)?string=="currentComp">
					<#assign recordProduct_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign recordProduct_productCode_defaultText=''>
				<recordProduct.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(AdjustOrTempRecords_dg1542100698339Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(AdjustOrTempRecords_dg1542100698339Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/customRef.action','dg1542100698339recordProduct.productCode','${getText("MESBasic.viewtitle.randon1506341311049")}',sPTGridID,nRow,sFieldName,AdjustOrTempRecords_dg1542100698339Widget,null,false,false,'','MESBasic_1_product_customRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (recordProduct_productCode_defaultValue)?? &&(recordProduct_productCode_defaultValue)?has_content>
							defaultValue='${(recordProduct_productCode_defaultValue!)?string}'
						</#if>
						<#if (recordProduct_productCode_defaultText)?? &&(recordProduct_productCode_defaultText)?has_content>
							defaultText='${(recordProduct_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</recordProduct.productCode>
				<#assign isRef = false >
				<#assign recordProduct_productName_defaultValue=''>
												<#assign recordProduct_productName_defaultValue=''>
				<#if (recordProduct_productName_defaultValue!)?string=="currentUser">
					<#assign recordProduct_productName_defaultValue='${staffJson!}'>
				<#elseif (recordProduct_productName_defaultValue!)?string=="currentPost">
					<#assign recordProduct_productName_defaultValue='${postJson!}'>
				<#elseif (recordProduct_productName_defaultValue!)?string=="currentDepart">
					<#assign recordProduct_productName_defaultValue='${deptJson!}'>
				<#elseif (recordProduct_productName_defaultValue!)?string=="currentComp">
					<#assign recordProduct_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign recordProduct_productName_defaultText=''>
				<recordProduct.productName
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (recordProduct_productName_defaultValue)?? &&(recordProduct_productName_defaultValue)?has_content>
							defaultValue='${(recordProduct_productName_defaultValue!)?string}'
						</#if>
						<#if (recordProduct_productName_defaultText)?? &&(recordProduct_productName_defaultText)?has_content>
							defaultText='${(recordProduct_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</recordProduct.productName>
				<#assign isRef = false >
				<#assign actualUse_defaultValue=''>
						 						<#assign actualUse_defaultValue=''>
				<#assign actualUse_defaultText=''>
				<actualUse
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (actualUse_defaultValue)?? &&(actualUse_defaultValue)?has_content>
							defaultValue='${(actualUse_defaultValue!)?string}'
						</#if>
						<#if (actualUse_defaultText)?? &&(actualUse_defaultText)?has_content>
							defaultText='${(actualUse_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">实际投料量</actualUse>
				<#assign isRef = false >
				<#assign recordProduct_productBaseUnit_name_defaultValue=''>
												<#assign recordProduct_productBaseUnit_name_defaultValue=''>
				<#if (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentUser">
					<#assign recordProduct_productBaseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentPost">
					<#assign recordProduct_productBaseUnit_name_defaultValue='${postJson!}'>
				<#elseif (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign recordProduct_productBaseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (recordProduct_productBaseUnit_name_defaultValue!)?string=="currentComp">
					<#assign recordProduct_productBaseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign recordProduct_productBaseUnit_name_defaultText=''>
				<recordProduct.productBaseUnit.name
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (recordProduct_productBaseUnit_name_defaultValue)?? &&(recordProduct_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(recordProduct_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (recordProduct_productBaseUnit_name_defaultText)?? &&(recordProduct_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(recordProduct_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位名称</recordProduct.productBaseUnit.name>
				<#assign isRef = false >
				<#assign startTime_defaultValue=''>
						 						<#assign startTime_defaultValue=''>
				<#assign startTime_defaultText=''>
					<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
					</#if>
				<startTime
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(AdjustOrTempRecords_dg1542100698339Widget,'AdjustOrTempRecords_dg1542100698339Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(AdjustOrTempRecords_dg1542100698339Widget,'AdjustOrTempRecords_dg1542100698339Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							defaultValue='${(startTime_defaultValue!)?string}'
						</#if>
						<#if (startTime_defaultText)?? &&(startTime_defaultText)?has_content>
							defaultText='${(startTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">开始时间</startTime>
				<#assign isRef = false >
				<#assign endTime_defaultValue=''>
						 						<#assign endTime_defaultValue=''>
				<#assign endTime_defaultText=''>
					<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
					</#if>
				<endTime
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(AdjustOrTempRecords_dg1542100698339Widget,'AdjustOrTempRecords_dg1542100698339Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(AdjustOrTempRecords_dg1542100698339Widget,'AdjustOrTempRecords_dg1542100698339Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							defaultValue='${(endTime_defaultValue!)?string}'
						</#if>
						<#if (endTime_defaultText)?? &&(endTime_defaultText)?has_content>
							defaultText='${(endTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">结束时间</endTime>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (remark_defaultValue)?? &&(remark_defaultValue)?has_content>
							defaultValue='${(remark_defaultValue!)?string}'
						</#if>
						<#if (remark_defaultText)?? &&(remark_defaultText)?has_content>
							defaultText='${(remark_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</remark>
				<#assign isRef = false >
				<#assign processID_defaultValue=''>
						 						<#assign processID_defaultValue=''>
				<#assign processID_defaultText=''>
				<processID
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542100698339Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="30">工序ID</processID>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="AdjustOrTempRecords_dg1542100698339Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.recordProduct.id)!}</c>
			<#if cpObjHideKey?? && cpObjHideKey?has_content>
				<#list cpObjHideKey?split(',') as key>
					<#assign cpvmHideVal = ''>
					<#assign keyArr = key?split('.')>
					<#if row[keyArr[0]]??>
						<#assign cpvmHideVal = row[keyArr[0]]>
						<#if keyArr?size gt 1>
							<#list 1..(keyArr?size - 1) as i>
								<#if cpvmHideVal?? && cpvmHideVal[keyArr[i]]??>
									<#assign cpvmHideVal = cpvmHideVal[keyArr[i]]>
								<#else>
									<#assign cpvmHideVal = ''>
									<#break>
								</#if>
							</#list>
						</#if>
					</#if>
					<c>${cpvmHideVal!}</c>
				</#list>
			</#if>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>
