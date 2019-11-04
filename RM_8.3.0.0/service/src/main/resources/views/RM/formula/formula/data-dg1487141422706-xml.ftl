<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487141422706" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
					sort="false"  onPropertyChange="FormulaProcess_dg1487141422706Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('name','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_name')>
						<#if RM_7_5_0_0_formula_FormulaProcess_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="center" 
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
					sort="false"  onPropertyChange="FormulaProcess_dg1487141422706Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_processType_ProcessType_name')>
						<#if RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (processType_name_defaultValue)?? &&(processType_name_defaultValue)?has_content>
							defaultValue='${(processType_name_defaultValue!)?string}'
						</#if>
						<#if (processType_name_defaultText)?? &&(processType_name_defaultText)?has_content>
							defaultText='${(processType_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序类型</processType.name>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="false"  onPropertyChange="FormulaProcess_dg1487141422706Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaProcess_longTime_permit = checkFieldPermission('longTime','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_longTime')>
						<#if RM_7_5_0_0_formula_FormulaProcess_longTime_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaProcess_longTime_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
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
					width="100">标准时长</longTime>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaProcess_dg1487141422706Widget._DT._autoAddNewRow(nRow)" >
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
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>