<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489296259250" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<processType.id IsHiddenField="true"></processType.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
						style="font-color:0303B3"
					sort="true"  onPropertyChange="FormulaProcess_dg1489296259250Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('name','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_name')>
						<#if RM_7_5_0_0_formula_FormulaProcess_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">工序名称</name>
				<#assign isRef = false >
				<#assign processType_name_defaultValue=''>
												<#assign processType_name_defaultValue=''>
				<#if (processType_name_defaultValue!)?string=="currentUser">
					<#assign processType_name_defaultValue='${staffJson!}'>
				<#elseif (processType_name_defaultValue!)?string=="currentPost">
					<#assign processType_name_defaultValue='${postJson!}'>
				<#elseif (processType_name_defaultValue!)?string=="currentDepart">
					<#assign processType_name_defaultValue='${deptJson!}'>
				<#elseif (processType_name_defaultValue!)?string=="currentComp">
					<#assign processType_name_defaultValue='${compJson!}'>
				</#if>
				<#assign processType_name_defaultText=''>
				<processType.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcess_dg1489296259250Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcess_dg1489296259250Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/processType/processType/processTypeRef.action','dg1489296259250processType.name','${getText("RM.viewtitle.randon1487220867598")}',sPTGridID,nRow,sFieldName,FormulaProcess_dg1489296259250Widget,null,false,false,'','RM_7.5.0.0_processType_processTypeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="FormulaProcess_dg1489296259250Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_processType_ProcessType_name')>
						<#if RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (processType_name_defaultValue)?? &&(processType_name_defaultValue)?has_content>
							defaultValue='${(processType_name_defaultValue!)?string}'
						</#if>
						<#if (processType_name_defaultText)?? &&(processType_name_defaultText)?has_content>
							defaultText='${(processType_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序类型</processType.name>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="true"  onPropertyChange="FormulaProcess_dg1489296259250Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaProcess_longTime_permit = checkFieldPermission('longTime','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_longTime')>
						<#if RM_7_5_0_0_formula_FormulaProcess_longTime_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_longTime_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (longTime_defaultValue)?? &&(longTime_defaultValue)?has_content>
							defaultValue='${(longTime_defaultValue!)?string}'
						</#if>
						<#if (longTime_defaultText)?? &&(longTime_defaultText)?has_content>
							defaultText='${(longTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准时长(分)</longTime>
				<#assign isRef = false >
				<#assign processIdBeforeProcessID_defaultValue=''>
				<#if (processIdBeforeProcessID_defaultValue!)?string=="currentUser">
					<#assign processIdBeforeProcessID_defaultValue='${staffJson!}'>
				<#elseif (processIdBeforeProcessID_defaultValue!)?string=="currentPost">
					<#assign processIdBeforeProcessID_defaultValue='${postJson!}'>
				<#elseif (processIdBeforeProcessID_defaultValue!)?string=="currentDepart">
					<#assign processIdBeforeProcessID_defaultValue='${deptJson!}'>
				<#elseif (processIdBeforeProcessID_defaultValue!)?string=="currentComp">
					<#assign processIdBeforeProcessID_defaultValue='${compJson!}'>
				</#if>
				<#assign processIdBeforeProcessID_defaultText=''>
				<processIdBeforeProcessID
						style="font-color:0303B3"
					sort="true"  onPropertyChange="FormulaProcess_dg1489296259250Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign _RM_7_5_0_0_formula_FormulaProcess_id_RM_7_5_0_0_formula_FormulaBeforeProcess_processId__RM_7_5_0_0_formula_FormulaBeforeProcess_beforeProcessID_RM_7_5_0_0_formula_FormulaProcess_permit = checkFieldPermission('processIdBeforeProcessID','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaBeforeProcess_beforeProcessID-RM_7.5.0.0_formula_FormulaProcess')>
						<#if _RM_7_5_0_0_formula_FormulaProcess_id_RM_7_5_0_0_formula_FormulaBeforeProcess_processId__RM_7_5_0_0_formula_FormulaBeforeProcess_beforeProcessID_RM_7_5_0_0_formula_FormulaProcess_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if _RM_7_5_0_0_formula_FormulaProcess_id_RM_7_5_0_0_formula_FormulaBeforeProcess_processId__RM_7_5_0_0_formula_FormulaBeforeProcess_beforeProcessID_RM_7_5_0_0_formula_FormulaProcess_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
						 dataType="float"
						
						<#if (processIdBeforeProcessID_defaultValue)?? &&(processIdBeforeProcessID_defaultValue)?has_content>
							defaultValue='${(processIdBeforeProcessID_defaultValue!)?string}'
						</#if>
						<#if (processIdBeforeProcessID_defaultText)?? &&(processIdBeforeProcessID_defaultText)?has_content>
							defaultText='${(processIdBeforeProcessID_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="" 
						type="DECIMAL" 
					width="200">前置工序</processIdBeforeProcessID>
				<#assign isRef = false >
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="true"  onPropertyChange="FormulaProcess_dg1489296259250Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaProcess_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_meno')>
						<#if RM_7_5_0_0_formula_FormulaProcess_meno_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_meno_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</meno>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.processType.id)!}</c>
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
					<#if !RM_7_5_0_0_formula_FormulaProcess_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('name','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_name')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaProcess_name_permit != 0><#if (row.name)?has_content>${(row.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_processType_ProcessType_name')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit != 0><#if (row.processType.name)?has_content>${(row.processType.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaProcess_longTime_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_longTime_permit = checkFieldPermission('longTime','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_longTime')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaProcess_longTime_permit != 0><#if (row.longTime)?has_content>#{(row.longTime)!; m2M2}</#if></#if></c>
					<#if !_RM_7_5_0_0_formula_FormulaProcess_id_RM_7_5_0_0_formula_FormulaBeforeProcess_processId__RM_7_5_0_0_formula_FormulaBeforeProcess_beforeProcessID_RM_7_5_0_0_formula_FormulaProcess_permit??>
					<#assign _RM_7_5_0_0_formula_FormulaProcess_id_RM_7_5_0_0_formula_FormulaBeforeProcess_processId__RM_7_5_0_0_formula_FormulaBeforeProcess_beforeProcessID_RM_7_5_0_0_formula_FormulaProcess_permit = checkFieldPermission('processIdBeforeProcessID','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaBeforeProcess_beforeProcessID-RM_7.5.0.0_formula_FormulaProcess')>
					</#if>
						<c><#if _RM_7_5_0_0_formula_FormulaProcess_id_RM_7_5_0_0_formula_FormulaBeforeProcess_processId__RM_7_5_0_0_formula_FormulaBeforeProcess_beforeProcessID_RM_7_5_0_0_formula_FormulaProcess_permit != 0><#if (row.processIdBeforeProcessID)?has_content>#{(row.processIdBeforeProcessID)!; m6M6}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaProcess_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_meno')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaProcess_meno_permit != 0><#if (row.meno)?has_content>${(row.meno)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>