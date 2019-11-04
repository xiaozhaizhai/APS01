<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1502700759865" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<taskReportPart.id IsHiddenField="true"></taskReportPart.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign taskReportPart_headId_tableNo_defaultValue=''>
												<#assign taskReportPart_headId_tableNo_defaultValue=''>
				<#if (taskReportPart_headId_tableNo_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_headId_tableNo_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_headId_tableNo_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_headId_tableNo_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_headId_tableNo_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_headId_tableNo_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_headId_tableNo_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_headId_tableNo_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_headId_tableNo_defaultText=''>
				<taskReportPart.headId.tableNo
						showFormatFunc="taskReport_showFormatFunc" 
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(TaskReportManage_dg1502700759865Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(TaskReportManage_dg1502700759865Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/taskReporting/taskReportingPart/reportDetaliRef.action','dg1502700759865taskReportPart.headId.tableNo','${getText("WOM.viewtitle.randon1495093620878")}',sPTGridID,nRow,sFieldName,TaskReportManage_dg1502700759865Widget,null,false,false,'','WOM_7.5.0.0_taskReporting_reportDetaliRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_headId_tableNo_defaultValue)?? &&(taskReportPart_headId_tableNo_defaultValue)?has_content>
							defaultValue='${(taskReportPart_headId_tableNo_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_headId_tableNo_defaultText)?? &&(taskReportPart_headId_tableNo_defaultText)?has_content>
							defaultText='${(taskReportPart_headId_tableNo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="180">报工单</taskReportPart.headId.tableNo>
				<#assign isRef = false >
				<#assign taskReportUrl_defaultValue=''>
						 						<#assign taskReportUrl_defaultValue=''>
				<#assign taskReportUrl_defaultText=''>
				<taskReportUrl
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">报工单URL</taskReportUrl>
				<#assign isRef = false >
				<#assign taskReportPart_reportStaff_name_defaultValue=''>
												<#assign taskReportPart_reportStaff_name_defaultValue=''>
				<#if (taskReportPart_reportStaff_name_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_reportStaff_name_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_reportStaff_name_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_reportStaff_name_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_reportStaff_name_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_reportStaff_name_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_reportStaff_name_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_reportStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_reportStaff_name_defaultText=''>
				<taskReportPart.reportStaff.name
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_reportStaff_name_defaultValue)?? &&(taskReportPart_reportStaff_name_defaultValue)?has_content>
							defaultValue='${(taskReportPart_reportStaff_name_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_reportStaff_name_defaultText)?? &&(taskReportPart_reportStaff_name_defaultText)?has_content>
							defaultText='${(taskReportPart_reportStaff_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">报工人</taskReportPart.reportStaff.name>
				<#assign isRef = false >
				<#assign taskReportPart_reportNum_defaultValue=''>
												<#assign taskReportPart_reportNum_defaultValue=''>
				<#if (taskReportPart_reportNum_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_reportNum_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_reportNum_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_reportNum_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_reportNum_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_reportNum_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_reportNum_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_reportNum_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_reportNum_defaultText=''>
				<taskReportPart.reportNum
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (taskReportPart_reportNum_defaultValue)?? &&(taskReportPart_reportNum_defaultValue)?has_content>
							defaultValue='${(taskReportPart_reportNum_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_reportNum_defaultText)?? &&(taskReportPart_reportNum_defaultText)?has_content>
							defaultText='${(taskReportPart_reportNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">报工数量</taskReportPart.reportNum>
				<#assign isRef = false >
				<#assign taskReportPart_reportType_defaultValue=''>
												<#assign taskReportPart_reportType_defaultValue=''>
				<#if (taskReportPart_reportType_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_reportType_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_reportType_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_reportType_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_reportType_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_reportType_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_reportType_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_reportType_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_reportType_defaultText=''>
				<taskReportPart.reportType.id
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('womReportType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (taskReportPart_reportType_defaultValue)?? &&(taskReportPart_reportType_defaultValue)?has_content>
							defaultValue='${(taskReportPart_reportType_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_reportType_defaultText)?? &&(taskReportPart_reportType_defaultText)?has_content>
							defaultText='${(taskReportPart_reportType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">报工类型</taskReportPart.reportType.id>
				<#assign isRef = false >
				<#assign taskReportPart_reportDate_defaultValue=''>
												<#assign taskReportPart_reportDate_defaultValue=''>
				<#if (taskReportPart_reportDate_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_reportDate_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_reportDate_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_reportDate_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_reportDate_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_reportDate_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_reportDate_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_reportDate_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_reportDate_defaultText=''>
					<#if (taskReportPart_reportDate_defaultValue)?? &&(taskReportPart_reportDate_defaultValue)?has_content>
							<#assign taskReportPart_reportDate_defaultValue  = getDefaultDateTime(taskReportPart_reportDate_defaultValue!)?datetime>
					</#if>
				<taskReportPart.reportDate
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_reportDate_defaultValue)?? &&(taskReportPart_reportDate_defaultValue)?has_content>
							defaultValue='${(taskReportPart_reportDate_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_reportDate_defaultText)?? &&(taskReportPart_reportDate_defaultText)?has_content>
							defaultText='${(taskReportPart_reportDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">报工时间</taskReportPart.reportDate>
				<#assign isRef = false >
				<#assign taskReportPart_batchNum_defaultValue=''>
												<#assign taskReportPart_batchNum_defaultValue=''>
				<#if (taskReportPart_batchNum_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_batchNum_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_batchNum_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_batchNum_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_batchNum_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_batchNum_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_batchNum_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_batchNum_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_batchNum_defaultText=''>
				<taskReportPart.batchNum
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_batchNum_defaultValue)?? &&(taskReportPart_batchNum_defaultValue)?has_content>
							defaultValue='${(taskReportPart_batchNum_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_batchNum_defaultText)?? &&(taskReportPart_batchNum_defaultText)?has_content>
							defaultText='${(taskReportPart_batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">入库批号</taskReportPart.batchNum>
				<#assign isRef = false >
				<#assign taskReportPart_wareId_wareName_defaultValue=''>
												<#assign taskReportPart_wareId_wareName_defaultValue=''>
				<#if (taskReportPart_wareId_wareName_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_wareId_wareName_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_wareId_wareName_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_wareId_wareName_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_wareId_wareName_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_wareId_wareName_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_wareId_wareName_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_wareId_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_wareId_wareName_defaultText=''>
				<taskReportPart.wareId.wareName
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_wareId_wareName_defaultValue)?? &&(taskReportPart_wareId_wareName_defaultValue)?has_content>
							defaultValue='${(taskReportPart_wareId_wareName_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_wareId_wareName_defaultText)?? &&(taskReportPart_wareId_wareName_defaultText)?has_content>
							defaultText='${(taskReportPart_wareId_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库</taskReportPart.wareId.wareName>
				<#assign isRef = false >
				<#assign taskReportPart_storeID_placeSetName_defaultValue=''>
												<#assign taskReportPart_storeID_placeSetName_defaultValue=''>
				<#if (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_storeID_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_storeID_placeSetName_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_storeID_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_storeID_placeSetName_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_storeID_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_storeID_placeSetName_defaultText=''>
				<taskReportPart.storeID.placeSetName
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_storeID_placeSetName_defaultValue)?? &&(taskReportPart_storeID_placeSetName_defaultValue)?has_content>
							defaultValue='${(taskReportPart_storeID_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_storeID_placeSetName_defaultText)?? &&(taskReportPart_storeID_placeSetName_defaultText)?has_content>
							defaultText='${(taskReportPart_storeID_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位</taskReportPart.storeID.placeSetName>
				<#assign isRef = false >
				<#assign taskReportPart_remark_defaultValue=''>
												<#assign taskReportPart_remark_defaultValue=''>
				<#if (taskReportPart_remark_defaultValue!)?string=="currentUser">
					<#assign taskReportPart_remark_defaultValue='${staffJson!}'>
				<#elseif (taskReportPart_remark_defaultValue!)?string=="currentPost">
					<#assign taskReportPart_remark_defaultValue='${postJson!}'>
				<#elseif (taskReportPart_remark_defaultValue!)?string=="currentDepart">
					<#assign taskReportPart_remark_defaultValue='${deptJson!}'>
				<#elseif (taskReportPart_remark_defaultValue!)?string=="currentComp">
					<#assign taskReportPart_remark_defaultValue='${compJson!}'>
				</#if>
				<#assign taskReportPart_remark_defaultText=''>
				<taskReportPart.remark
					sort="false"  onPropertyChange="TaskReportManage_dg1502700759865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskReportPart_remark_defaultValue)?? &&(taskReportPart_remark_defaultValue)?has_content>
							defaultValue='${(taskReportPart_remark_defaultValue!)?string}'
						</#if>
						<#if (taskReportPart_remark_defaultText)?? &&(taskReportPart_remark_defaultText)?has_content>
							defaultText='${(taskReportPart_remark_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="150">备注</taskReportPart.remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="TaskReportManage_dg1502700759865Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.taskReportPart.id)!}</c>
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
