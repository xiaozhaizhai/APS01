<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1460955592809" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<objPos.id IsHiddenField="true"></objPos.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign objPos_name_defaultValue=''>
												<#assign objPos_name_defaultValue=''>
				<#if (objPos_name_defaultValue!)?string=="currentUser">
					<#assign objPos_name_defaultValue='${staffJson!}'>
				<#elseif (objPos_name_defaultValue!)?string=="currentPost">
					<#assign objPos_name_defaultValue='${postJson!}'>
				<#elseif (objPos_name_defaultValue!)?string=="currentDepart">
					<#assign objPos_name_defaultValue='${deptJson!}'>
				<#elseif (objPos_name_defaultValue!)?string=="currentComp">
					<#assign objPos_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objPos_name_defaultText=''>
				<objPos.name
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjPostion_dg1460955592809Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjPostion_dg1460955592809Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/position/common/positionListFrame.action','dg1460955592809objPos.name','${getText("ec.edit.refPos")}',sPTGridID,nRow,sFieldName,ObjPostion_dg1460955592809Widget,null,false,false,'','sysbase_1.0_position_position')"
								onKeyUp="MESBasic.factoryModel.factoryModel.factoryEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':ObjPostion_dg1460955592809Widget,
										'sGridName':'ObjPostion_dg1460955592809Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/foundation/position/common/positionListFrame.action',
										'displayfieldname':'name',
										'type':'Position',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(\'dg1460955592809objPos.name\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="ObjPostion_dg1460955592809Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (objPos_name_defaultValue)?? &&(objPos_name_defaultValue)?has_content>
							defaultValue='${(objPos_name_defaultValue!)?string}'
						</#if>
						<#if (objPos_name_defaultText)?? &&(objPos_name_defaultText)?has_content>
							defaultText='${(objPos_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">岗位名称</objPos.name>
				<#assign isRef = false >
				<#assign objPos_code_defaultValue=''>
												<#assign objPos_code_defaultValue=''>
				<#if (objPos_code_defaultValue!)?string=="currentUser">
					<#assign objPos_code_defaultValue='${staffJson!}'>
				<#elseif (objPos_code_defaultValue!)?string=="currentPost">
					<#assign objPos_code_defaultValue='${postJson!}'>
				<#elseif (objPos_code_defaultValue!)?string=="currentDepart">
					<#assign objPos_code_defaultValue='${deptJson!}'>
				<#elseif (objPos_code_defaultValue!)?string=="currentComp">
					<#assign objPos_code_defaultValue='${compJson!}'>
				</#if>
				<#assign objPos_code_defaultText=''>
				<objPos.code
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ObjPostion_dg1460955592809Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objPos_code_defaultValue)?? &&(objPos_code_defaultValue)?has_content>
							defaultValue='${(objPos_code_defaultValue!)?string}'
						</#if>
						<#if (objPos_code_defaultText)?? &&(objPos_code_defaultText)?has_content>
							defaultText='${(objPos_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">岗位编码</objPos.code>
				<#assign isRef = false >
				<#assign objPos_department_name_defaultValue=''>
												<#assign objPos_department_name_defaultValue=''>
				<#if (objPos_department_name_defaultValue!)?string=="currentUser">
					<#assign objPos_department_name_defaultValue='${staffJson!}'>
				<#elseif (objPos_department_name_defaultValue!)?string=="currentPost">
					<#assign objPos_department_name_defaultValue='${postJson!}'>
				<#elseif (objPos_department_name_defaultValue!)?string=="currentDepart">
					<#assign objPos_department_name_defaultValue='${deptJson!}'>
				<#elseif (objPos_department_name_defaultValue!)?string=="currentComp">
					<#assign objPos_department_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objPos_department_name_defaultText=''>
				<objPos.department.name
					sort="false"  onPropertyChange="ObjPostion_dg1460955592809Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objPos_department_name_defaultValue)?? &&(objPos_department_name_defaultValue)?has_content>
							defaultValue='${(objPos_department_name_defaultValue!)?string}'
						</#if>
						<#if (objPos_department_name_defaultText)?? &&(objPos_department_name_defaultText)?has_content>
							defaultText='${(objPos_department_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">部门名称</objPos.department.name>
				<#assign isRef = false >
				<#assign objPos_department_fullPathName_defaultValue=''>
												<#assign objPos_department_fullPathName_defaultValue=''>
				<#if (objPos_department_fullPathName_defaultValue!)?string=="currentUser">
					<#assign objPos_department_fullPathName_defaultValue='${staffJson!}'>
				<#elseif (objPos_department_fullPathName_defaultValue!)?string=="currentPost">
					<#assign objPos_department_fullPathName_defaultValue='${postJson!}'>
				<#elseif (objPos_department_fullPathName_defaultValue!)?string=="currentDepart">
					<#assign objPos_department_fullPathName_defaultValue='${deptJson!}'>
				<#elseif (objPos_department_fullPathName_defaultValue!)?string=="currentComp">
					<#assign objPos_department_fullPathName_defaultValue='${compJson!}'>
				</#if>
				<#assign objPos_department_fullPathName_defaultText=''>
				<objPos.department.fullPathName
					sort="false"  onPropertyChange="ObjPostion_dg1460955592809Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objPos_department_fullPathName_defaultValue)?? &&(objPos_department_fullPathName_defaultValue)?has_content>
							defaultValue='${(objPos_department_fullPathName_defaultValue!)?string}'
						</#if>
						<#if (objPos_department_fullPathName_defaultText)?? &&(objPos_department_fullPathName_defaultText)?has_content>
							defaultText='${(objPos_department_fullPathName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="140">层级全路径</objPos.department.fullPathName>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ObjPostion_dg1460955592809Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.objPos.id)!}</c>
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
