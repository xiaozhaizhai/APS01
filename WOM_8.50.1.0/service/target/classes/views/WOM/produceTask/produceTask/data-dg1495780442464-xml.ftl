<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProdTaskProcExelog", "WOM_7.5.0.0_produceTask_taskExecRecordViewdg1495780442464", "DATAGRID", "prodTaskProcExelog")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1495780442464" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<taskProcessID.id IsHiddenField="true"></taskProcessID.id>
				<taskID.id IsHiddenField="true"></taskID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign taskProcessID_name_defaultValue=''>
												<#assign taskProcessID_name_defaultValue=''>
				<#if (taskProcessID_name_defaultValue!)?string=="currentUser">
					<#assign taskProcessID_name_defaultValue='${staffJson!}'>
				<#elseif (taskProcessID_name_defaultValue!)?string=="currentPost">
					<#assign taskProcessID_name_defaultValue='${postJson!}'>
				<#elseif (taskProcessID_name_defaultValue!)?string=="currentDepart">
					<#assign taskProcessID_name_defaultValue='${deptJson!}'>
				<#elseif (taskProcessID_name_defaultValue!)?string=="currentComp">
					<#assign taskProcessID_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessID_name_defaultText=''>
				<taskProcessID.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdTaskProcExelog_dg1495780442464Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdTaskProcExelog_dg1495780442464Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTaskProcess/taskProcessRef.action','dg1495780442464taskProcessID.name','${getText("WOM.viewtitle.randon1490685207348")}',sPTGridID,nRow,sFieldName,ProdTaskProcExelog_dg1495780442464Widget,null,false,false,'','WOM_7.5.0.0_produceTask_taskProcessRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskProcessID_name_defaultValue)?? &&(taskProcessID_name_defaultValue)?has_content>
							defaultValue='${(taskProcessID_name_defaultValue!)?string}'
						</#if>
						<#if (taskProcessID_name_defaultText)?? &&(taskProcessID_name_defaultText)?has_content>
							defaultText='${(taskProcessID_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序名称</taskProcessID.name>
				<#assign isRef = false >
				<#assign taskProcessID_processType_name_defaultValue=''>
												<#assign taskProcessID_processType_name_defaultValue=''>
				<#if (taskProcessID_processType_name_defaultValue!)?string=="currentUser">
					<#assign taskProcessID_processType_name_defaultValue='${staffJson!}'>
				<#elseif (taskProcessID_processType_name_defaultValue!)?string=="currentPost">
					<#assign taskProcessID_processType_name_defaultValue='${postJson!}'>
				<#elseif (taskProcessID_processType_name_defaultValue!)?string=="currentDepart">
					<#assign taskProcessID_processType_name_defaultValue='${deptJson!}'>
				<#elseif (taskProcessID_processType_name_defaultValue!)?string=="currentComp">
					<#assign taskProcessID_processType_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessID_processType_name_defaultText=''>
				<taskProcessID.processType.name
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskProcessID_processType_name_defaultValue)?? &&(taskProcessID_processType_name_defaultValue)?has_content>
							defaultValue='${(taskProcessID_processType_name_defaultValue!)?string}'
						</#if>
						<#if (taskProcessID_processType_name_defaultText)?? &&(taskProcessID_processType_name_defaultText)?has_content>
							defaultText='${(taskProcessID_processType_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">工序类型</taskProcessID.processType.name>
				<#assign isRef = false >
				<#assign taskProcessID_longTime_defaultValue=''>
												<#assign taskProcessID_longTime_defaultValue=''>
				<#if (taskProcessID_longTime_defaultValue!)?string=="currentUser">
					<#assign taskProcessID_longTime_defaultValue='${staffJson!}'>
				<#elseif (taskProcessID_longTime_defaultValue!)?string=="currentPost">
					<#assign taskProcessID_longTime_defaultValue='${postJson!}'>
				<#elseif (taskProcessID_longTime_defaultValue!)?string=="currentDepart">
					<#assign taskProcessID_longTime_defaultValue='${deptJson!}'>
				<#elseif (taskProcessID_longTime_defaultValue!)?string=="currentComp">
					<#assign taskProcessID_longTime_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessID_longTime_defaultText=''>
				<taskProcessID.longTime
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (taskProcessID_longTime_defaultValue)?? &&(taskProcessID_longTime_defaultValue)?has_content>
							defaultValue='${(taskProcessID_longTime_defaultValue!)?string}'
						</#if>
						<#if (taskProcessID_longTime_defaultText)?? &&(taskProcessID_longTime_defaultText)?has_content>
							defaultText='${(taskProcessID_longTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准时长</taskProcessID.longTime>
				<#assign isRef = false >
				<#assign taskID_factoryId_name_defaultValue=''>
												<#assign taskID_factoryId_name_defaultValue=''>
				<#if (taskID_factoryId_name_defaultValue!)?string=="currentUser">
					<#assign taskID_factoryId_name_defaultValue='${staffJson!}'>
				<#elseif (taskID_factoryId_name_defaultValue!)?string=="currentPost">
					<#assign taskID_factoryId_name_defaultValue='${postJson!}'>
				<#elseif (taskID_factoryId_name_defaultValue!)?string=="currentDepart">
					<#assign taskID_factoryId_name_defaultValue='${deptJson!}'>
				<#elseif (taskID_factoryId_name_defaultValue!)?string=="currentComp">
					<#assign taskID_factoryId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskID_factoryId_name_defaultText=''>
				<taskID.factoryId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdTaskProcExelog_dg1495780442464Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdTaskProcExelog_dg1495780442464Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTask/taskRef.action','dg1495780442464taskID.factoryId.name','${getText("WOM.viewtitle.randon1489737198145")}',sPTGridID,nRow,sFieldName,ProdTaskProcExelog_dg1495780442464Widget,null,false,false,'','WOM_7.5.0.0_produceTask_taskRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskID_factoryId_name_defaultValue)?? &&(taskID_factoryId_name_defaultValue)?has_content>
							defaultValue='${(taskID_factoryId_name_defaultValue!)?string}'
						</#if>
						<#if (taskID_factoryId_name_defaultText)?? &&(taskID_factoryId_name_defaultText)?has_content>
							defaultText='${(taskID_factoryId_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工作单元（执行）</taskID.factoryId.name>
				<#assign isRef = false >
				<#assign startTime_defaultValue=''>
						 						<#assign startTime_defaultValue=''>
				<#assign startTime_defaultText=''>
					<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
					</#if>
				<startTime
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProdTaskProcExelog_dg1495780442464Widget,'ProdTaskProcExelog_dg1495780442464Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProdTaskProcExelog_dg1495780442464Widget,'ProdTaskProcExelog_dg1495780442464Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							defaultValue='${(startTime_defaultValue!)?string}'
						</#if>
						<#if (startTime_defaultText)?? &&(startTime_defaultText)?has_content>
							defaultText='${(startTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">开始时间</startTime>
				<#assign isRef = false >
				<#assign endTime_defaultValue=''>
						 						<#assign endTime_defaultValue=''>
				<#assign endTime_defaultText=''>
					<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
					</#if>
				<endTime
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProdTaskProcExelog_dg1495780442464Widget,'ProdTaskProcExelog_dg1495780442464Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProdTaskProcExelog_dg1495780442464Widget,'ProdTaskProcExelog_dg1495780442464Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							defaultValue='${(endTime_defaultValue!)?string}'
						</#if>
						<#if (endTime_defaultText)?? &&(endTime_defaultText)?has_content>
							defaultText='${(endTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">结束时间</endTime>
				<#assign isRef = false >
				<#assign state_defaultValue=''>
						 						<#assign state_defaultValue=''>
				<#assign state_defaultText=''>
				<state.id
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('womProActiveType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (state_defaultValue)?? &&(state_defaultValue)?has_content>
							defaultValue='${(state_defaultValue!)?string}'
						</#if>
						<#if (state_defaultText)?? &&(state_defaultText)?has_content>
							defaultText='${(state_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">状态</state.id>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProdTaskProcExelog", "WOM_7.5.0.0_produceTask_taskExecRecordViewdg1495780442464", "DATAGRID", "prodTaskProcExelog")>
				<#list customPropViewMappings as cpvm>
					<#assign cpvmReadOnly = true>
					<#if !cpvmReadOnly && cpvm.propertyLayRec?index_of('.') gt -1>
						<#assign cpvmReadOnly = true>
					</#if>
					<${cpvm.propertyLayRec}<#if cpvm.property.type == 'OBJECT'>MainDisplay</#if> <#if !(cpvm.nullable!true)>style="font-color:0303B3"</#if>
					<#if cpvm.property.type == 'OBJECT'>
						<#assign viewCode = ''>
						<#assign viewUrl = ''>
						<#assign viewTitle = ''>
						<#assign mainDisplayName = ''>
						<#assign pkName = ''>
						<#assign mainDisplayName = ''>
						<#list cpvm.property.associatedProperty.model.properties as p>
							<#if !pkName?has_content && p.isPk?? && p.isPk>
								<#assign pkName = p.name>
							</#if>
							<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
								<#assign mainDisplayName = p.name>
							</#if>
						</#list>
						<#if cpvm.refView??>
							<#assign viewUrl = (cpvm.refView.url)!''>
							<#assign viewTitle = (cpvm.refView.title)!''>
							<#assign viewCode = (cpvm.refView.code)!''>
							onFocus="CUI.toggleClearBtn_DG_IE(ProdTaskProcExelog_dg1495780442464Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(ProdTaskProcExelog_dg1495780442464Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1495780442464${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',ProdTaskProcExelog_dg1495780442464Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="true"
						onPropertyChange="ProdTaskProcExelog_dg1495780442464Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
						<#if cpvmReadOnly || cpvm.property.type == 'OBJECT'>
						readOnly="true"
						</#if>
						<#if cpvmReadOnly>
						hideButtonsOnReadOnly="true"
						</#if>
					<#if cpvm.property.type == 'SYSTEMCODE'>
						<#assign optionMap = getSystemCodeList('${(cpvm.property.fillcontentMap.fillContent)!}')>
						<#assign itemList = '' >
						<#assign valueList = '' >
						<#if optionMap??>
							<#list optionMap?keys as mapKey>
								<#assign itemList = itemList + ',' + optionMap[mapKey] >
								<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode?string('true','false')=='true'>
								<#assign arr=(mapKey?split("/"))>
								<#assign valueList = valueList + ',' + arr[1] >
								<#else>
								<#assign valueList = valueList + ',' + mapKey >
								</#if>
							</#list>
						</#if>
						control="ComboBox" items="${itemList!}" values="${valueList!}"
					<#elseif cpvm.property.type == 'DATETIME'>
						onBlur="document.body.click()" buttonImg="Calendar"
						onClick="initCalender(ProdTaskProcExelog_dg1495780442464Widget,'ProdTaskProcExelog_dg1495780442464Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(ProdTaskProcExelog_dg1495780442464Widget,'ProdTaskProcExelog_dg1495780442464Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						control="Text"
					<#elseif cpvm.property.type == 'DECIMAL'>
						<#if cpvm.property.decimalNum?? && cpvm.property.decimalNum gt -1> 
							decLength="${cpvm.property.decimalNum}"
						</#if>
						 dataType="float"
					<#elseif cpvm.property.type == 'INTEGER'>
						dataType="float" decLength="0"
					<#else>
						<#if !cpvmReadOnly>
						control="Text"
						</#if>
					</#if>
					<#if cpvm.property.type == 'INTEGER' || cpvm.property.type == 'DECIMAL'>
						align="right"
					<#else>
						align="center"
					</#if>
					<#if cpvm.property.type == 'DECIMAL' || cpvm.property.type == 'INTEGER'>
						control="NumericEdit"
						<#if cpvm.format?? && cpvm.format == 'THOUSAND'>
							format="#,##0.00" 
						<#elseif cpvm.format?? && cpvm.format == 'TEN_THOUSAND'>
						</#if>
					</#if>
					showFormat="${cpvm.format}"
					<#if cpvm.property.type == 'DATETIME'>
						<#if cpvm.format == 'YMD_H'>
							type="dateTimeHour"
						<#elseif cpvm.format == 'YMD_HM'>
							type="dateTimeMin" 
						<#elseif cpvm.format == 'YMD_HMS'>
							type="datetime" 
						<#else>
							type="date" 
						</#if>
					<#elseif cpvm.property.type == 'DECIMAL' || cpvm.property.type == 'INTEGER'>
						type="${cpvm.property.type}"
					<#else>
						type="${cpvm.fieldType}"
					</#if>
					<#if cpvm.property.type == 'DATETIME'>
						width="130"
					<#elseif cpvm.fieldType == 'TEXTAREA'>
						width="200"
					<#else>
						width="100"
					</#if>
					>${getText('${cpvm.displayName}')}</${cpvm.propertyLayRec}<#if cpvm.property.type == 'OBJECT'>MainDisplay</#if>>
				</#list>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.taskProcessID.id)!}</c>
					<c>${(row.taskID.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProdTaskProcExelog", "WOM_7.5.0.0_produceTask_taskExecRecordViewdg1495780442464", "DATAGRID", "prodTaskProcExelog")>
				<#list customPropViewMappings as cpvm>
					<#assign cpvmKey = cpvm.propertyLayRec>
					<#if cpvm.property.type == 'OBJECT'>
						<#assign cpvmKey = cpvm.propertyLayRec + 'MainDisplay'>
					</#if>
					<#assign cpvmResult = ''>
					<#assign cpvmKeyArr = cpvmKey?split('.')>
					<#if row[cpvmKeyArr[0]]??>
						<#assign cpvmResult = row[cpvmKeyArr[0]]>
						<#if cpvmKeyArr?size gt 1>
							<#list 1..(cpvmKeyArr?size - 1) as i>
								<#if cpvmResult?? && cpvmResult[cpvmKeyArr[i]]??>
									<#assign cpvmResult = cpvmResult[cpvmKeyArr[i]]>
								<#else>
									<#assign cpvmResult = ''>
									<#break>
								</#if>
							</#list>
						</#if>
					</#if>
					<#assign cpvmDecimalNum = cpvm.property.decimalNum!-1>
					<#if cpvm.property.type == 'DECIMAL'>
						<#if cpvmDecimalNum?? && cpvmDecimalNum gt -1>
							<#assign cpvmPrecision = '#'>
							<#if cpvmDecimalNum gt 0>
								<#assign cpvmPrecision = cpvmPrecision + '.'>
								<#list 1..cpvmDecimalNum as i>
									<#assign cpvmPrecision = cpvmPrecision + '0'>
								</#list>
							</#if>
							<#if cpvmResult?? && cpvmResult?has_content>
								<c>${cpvmResult?string("${cpvmPrecision}")}</c>
							<#else>
								<c></c>
							</#if>
						<#else>
							<c>${cpvmResult!}</c>
						</#if>
					<#elseif cpvm.property.type == 'DATETIME'>
						<#if cpvmResult?? && cpvmResult?has_content>
							<c>${cpvmResult?datetime?string('yyyy-MM-dd HH:mm:ss')}</c>
						<#else>
							<c></c>
						</#if>
					<#else>
						<c>${cpvmResult!}</c>
					</#if>
				</#list>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>
