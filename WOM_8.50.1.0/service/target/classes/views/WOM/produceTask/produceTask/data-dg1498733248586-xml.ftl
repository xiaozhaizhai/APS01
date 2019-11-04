<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1498733248586" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<taskProcessID.id IsHiddenField="true"></taskProcessID.id>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProdTaskProcExelog_dg1498733248586Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdTaskProcExelog_dg1498733248586Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTaskProcess/taskProcessRef.action','dg1498733248586taskProcessID.name','${getText("WOM.viewtitle.randon1490685207348")}',sPTGridID,nRow,sFieldName,ProdTaskProcExelog_dg1498733248586Widget,null,false,false,'','WOM_7.5.0.0_produceTask_taskProcessRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign taskProcessID_factoryId_name_defaultValue=''>
												<#assign taskProcessID_factoryId_name_defaultValue=''>
				<#if (taskProcessID_factoryId_name_defaultValue!)?string=="currentUser">
					<#assign taskProcessID_factoryId_name_defaultValue='${staffJson!}'>
				<#elseif (taskProcessID_factoryId_name_defaultValue!)?string=="currentPost">
					<#assign taskProcessID_factoryId_name_defaultValue='${postJson!}'>
				<#elseif (taskProcessID_factoryId_name_defaultValue!)?string=="currentDepart">
					<#assign taskProcessID_factoryId_name_defaultValue='${deptJson!}'>
				<#elseif (taskProcessID_factoryId_name_defaultValue!)?string=="currentComp">
					<#assign taskProcessID_factoryId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessID_factoryId_name_defaultText=''>
				<taskProcessID.factoryId.name
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskProcessID_factoryId_name_defaultValue)?? &&(taskProcessID_factoryId_name_defaultValue)?has_content>
							defaultValue='${(taskProcessID_factoryId_name_defaultValue!)?string}'
						</#if>
						<#if (taskProcessID_factoryId_name_defaultText)?? &&(taskProcessID_factoryId_name_defaultText)?has_content>
							defaultText='${(taskProcessID_factoryId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">工作单元</taskProcessID.factoryId.name>
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
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign taskProcessID_processState_defaultValue='processState/state01'>
												<#assign taskProcessID_processState_defaultValue='processState/state01'>
				<#if (taskProcessID_processState_defaultValue!)?string=="currentUser">
					<#assign taskProcessID_processState_defaultValue='${staffJson!}'>
				<#elseif (taskProcessID_processState_defaultValue!)?string=="currentPost">
					<#assign taskProcessID_processState_defaultValue='${postJson!}'>
				<#elseif (taskProcessID_processState_defaultValue!)?string=="currentDepart">
					<#assign taskProcessID_processState_defaultValue='${deptJson!}'>
				<#elseif (taskProcessID_processState_defaultValue!)?string=="currentComp">
					<#assign taskProcessID_processState_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessID_processState_defaultText=''>
				<taskProcessID.processState.id
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序状态</taskProcessID.processState.id>
				<#assign isRef = false >
				<#assign state_defaultValue=''>
						 						<#assign state_defaultValue=''>
				<#assign state_defaultText=''>
				<state.id
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">工序状态</state.id>
				<#assign isRef = false >
				<#assign startTime_defaultValue=''>
						 						<#assign startTime_defaultValue=''>
				<#assign startTime_defaultText=''>
					<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
					</#if>
				<startTime
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProdTaskProcExelog_dg1498733248586Widget,'ProdTaskProcExelog_dg1498733248586Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProdTaskProcExelog_dg1498733248586Widget,'ProdTaskProcExelog_dg1498733248586Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							defaultValue='${(startTime_defaultValue!)?string}'
						</#if>
						<#if (startTime_defaultText)?? &&(startTime_defaultText)?has_content>
							defaultText='${(startTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="175">开始时间</startTime>
				<#assign isRef = false >
				<#assign endTime_defaultValue=''>
						 						<#assign endTime_defaultValue=''>
				<#assign endTime_defaultText=''>
					<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
					</#if>
				<endTime
					sort="true"  onPropertyChange="ProdTaskProcExelog_dg1498733248586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProdTaskProcExelog_dg1498733248586Widget,'ProdTaskProcExelog_dg1498733248586Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProdTaskProcExelog_dg1498733248586Widget,'ProdTaskProcExelog_dg1498733248586Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							defaultValue='${(endTime_defaultValue!)?string}'
						</#if>
						<#if (endTime_defaultText)?? &&(endTime_defaultText)?has_content>
							defaultText='${(endTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="175">结束时间</endTime>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.taskProcessID.id)!}</c>
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
