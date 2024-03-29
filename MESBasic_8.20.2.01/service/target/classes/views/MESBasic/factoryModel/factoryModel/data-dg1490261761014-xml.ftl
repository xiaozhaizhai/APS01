<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1490261761014" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<objTeam.id IsHiddenField="true"></objTeam.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign objTeam_name_defaultValue=''>
												<#assign objTeam_name_defaultValue=''>
				<#if (objTeam_name_defaultValue!)?string=="currentUser">
					<#assign objTeam_name_defaultValue='${staffJson!}'>
				<#elseif (objTeam_name_defaultValue!)?string=="currentPost">
					<#assign objTeam_name_defaultValue='${postJson!}'>
				<#elseif (objTeam_name_defaultValue!)?string=="currentDepart">
					<#assign objTeam_name_defaultValue='${deptJson!}'>
				<#elseif (objTeam_name_defaultValue!)?string=="currentComp">
					<#assign objTeam_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objTeam_name_defaultText=''>
				<objTeam.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjTeam_dg1490261761014Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjTeam_dg1490261761014Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/X6Basic/teamManage/teamInfo/ref.action','dg1490261761014objTeam.name','${getText("X6Basic.viewtitle.radion1398316764087")}',sPTGridID,nRow,sFieldName,ObjTeam_dg1490261761014Widget,null,false,false,'','X6Basic_1.0_teamManage_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjTeam_dg1490261761014Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (objTeam_name_defaultValue)?? &&(objTeam_name_defaultValue)?has_content>
							defaultValue='${(objTeam_name_defaultValue!)?string}'
						</#if>
						<#if (objTeam_name_defaultText)?? &&(objTeam_name_defaultText)?has_content>
							defaultText='${(objTeam_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">班组名称</objTeam.name>
				<#assign isRef = false >
				<#assign objTeam_code_defaultValue=''>
												<#assign objTeam_code_defaultValue=''>
				<#if (objTeam_code_defaultValue!)?string=="currentUser">
					<#assign objTeam_code_defaultValue='${staffJson!}'>
				<#elseif (objTeam_code_defaultValue!)?string=="currentPost">
					<#assign objTeam_code_defaultValue='${postJson!}'>
				<#elseif (objTeam_code_defaultValue!)?string=="currentDepart">
					<#assign objTeam_code_defaultValue='${deptJson!}'>
				<#elseif (objTeam_code_defaultValue!)?string=="currentComp">
					<#assign objTeam_code_defaultValue='${compJson!}'>
				</#if>
				<#assign objTeam_code_defaultText=''>
				<objTeam.code
					sort="false"  onPropertyChange="ObjTeam_dg1490261761014Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objTeam_code_defaultValue)?? &&(objTeam_code_defaultValue)?has_content>
							defaultValue='${(objTeam_code_defaultValue!)?string}'
						</#if>
						<#if (objTeam_code_defaultText)?? &&(objTeam_code_defaultText)?has_content>
							defaultText='${(objTeam_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">班组编码</objTeam.code>
				<#assign isRef = false >
				<#assign objTeam_dept_name_defaultValue=''>
												<#assign objTeam_dept_name_defaultValue=''>
				<#if (objTeam_dept_name_defaultValue!)?string=="currentUser">
					<#assign objTeam_dept_name_defaultValue='${staffJson!}'>
				<#elseif (objTeam_dept_name_defaultValue!)?string=="currentPost">
					<#assign objTeam_dept_name_defaultValue='${postJson!}'>
				<#elseif (objTeam_dept_name_defaultValue!)?string=="currentDepart">
					<#assign objTeam_dept_name_defaultValue='${deptJson!}'>
				<#elseif (objTeam_dept_name_defaultValue!)?string=="currentComp">
					<#assign objTeam_dept_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objTeam_dept_name_defaultText=''>
				<objTeam.dept.name
					sort="false"  onPropertyChange="ObjTeam_dg1490261761014Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objTeam_dept_name_defaultValue)?? &&(objTeam_dept_name_defaultValue)?has_content>
							defaultValue='${(objTeam_dept_name_defaultValue!)?string}'
						</#if>
						<#if (objTeam_dept_name_defaultText)?? &&(objTeam_dept_name_defaultText)?has_content>
							defaultText='${(objTeam_dept_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">部门名称</objTeam.dept.name>
				<#assign isRef = false >
				<#assign objTeam_principal_name_defaultValue=''>
												<#assign objTeam_principal_name_defaultValue=''>
				<#if (objTeam_principal_name_defaultValue!)?string=="currentUser">
					<#assign objTeam_principal_name_defaultValue='${staffJson!}'>
				<#elseif (objTeam_principal_name_defaultValue!)?string=="currentPost">
					<#assign objTeam_principal_name_defaultValue='${postJson!}'>
				<#elseif (objTeam_principal_name_defaultValue!)?string=="currentDepart">
					<#assign objTeam_principal_name_defaultValue='${deptJson!}'>
				<#elseif (objTeam_principal_name_defaultValue!)?string=="currentComp">
					<#assign objTeam_principal_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objTeam_principal_name_defaultText=''>
				<objTeam.principal.name
					sort="false"  onPropertyChange="ObjTeam_dg1490261761014Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objTeam_principal_name_defaultValue)?? &&(objTeam_principal_name_defaultValue)?has_content>
							defaultValue='${(objTeam_principal_name_defaultValue!)?string}'
						</#if>
						<#if (objTeam_principal_name_defaultText)?? &&(objTeam_principal_name_defaultText)?has_content>
							defaultText='${(objTeam_principal_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">员工姓名</objTeam.principal.name>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ObjTeam_dg1490261761014Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.objTeam.id)!}</c>
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
