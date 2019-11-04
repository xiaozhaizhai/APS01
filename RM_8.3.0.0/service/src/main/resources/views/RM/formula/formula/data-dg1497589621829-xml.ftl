<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_CheckDepartmentSet", "RM_7.5.0.0_formula_checkDepartEditdg1497589621829", "DATAGRID", "checkDepartmentSet")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1497589621829" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<activeID.id IsHiddenField="true"></activeID.id>
				<factoryID.id IsHiddenField="true"></factoryID.id>
				<applyCheckDept.id IsHiddenField="true"></applyCheckDept.id>
				<applyCheckStaff.id IsHiddenField="true"></applyCheckStaff.id>
				<exeCheckDept.id IsHiddenField="true"></exeCheckDept.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign activeID_processId_name_defaultValue=''>
												<#assign activeID_processId_name_defaultValue=''>
				<#if (activeID_processId_name_defaultValue!)?string=="currentUser">
					<#assign activeID_processId_name_defaultValue='${staffJson!}'>
				<#elseif (activeID_processId_name_defaultValue!)?string=="currentPost">
					<#assign activeID_processId_name_defaultValue='${postJson!}'>
				<#elseif (activeID_processId_name_defaultValue!)?string=="currentDepart">
					<#assign activeID_processId_name_defaultValue='${deptJson!}'>
				<#elseif (activeID_processId_name_defaultValue!)?string=="currentComp">
					<#assign activeID_processId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeID_processId_name_defaultText=''>
				<activeID.processId.name
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeCheckRef.action','dg1497589621829activeID.processId.name','${getText("RM.viewtitle.randon1497922173328")}',sPTGridID,nRow,sFieldName,CheckDepartmentSet_dg1497589621829Widget,null,false,false,'','RM_7.5.0.0_formula_activeCheckRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (activeID_processId_name_defaultValue)?? &&(activeID_processId_name_defaultValue)?has_content>
							defaultValue='${(activeID_processId_name_defaultValue!)?string}'
						</#if>
						<#if (activeID_processId_name_defaultText)?? &&(activeID_processId_name_defaultText)?has_content>
							defaultText='${(activeID_processId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序名称</activeID.processId.name>
				<#assign isRef = false >
				<#assign activeID_name_defaultValue=''>
												<#assign activeID_name_defaultValue=''>
				<#if (activeID_name_defaultValue!)?string=="currentUser">
					<#assign activeID_name_defaultValue='${staffJson!}'>
				<#elseif (activeID_name_defaultValue!)?string=="currentPost">
					<#assign activeID_name_defaultValue='${postJson!}'>
				<#elseif (activeID_name_defaultValue!)?string=="currentDepart">
					<#assign activeID_name_defaultValue='${deptJson!}'>
				<#elseif (activeID_name_defaultValue!)?string=="currentComp">
					<#assign activeID_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeID_name_defaultText=''>
				<activeID.name
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeID_name_defaultValue)?? &&(activeID_name_defaultValue)?has_content>
							defaultValue='${(activeID_name_defaultValue!)?string}'
						</#if>
						<#if (activeID_name_defaultText)?? &&(activeID_name_defaultText)?has_content>
							defaultText='${(activeID_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">检验活动</activeID.name>
				<#assign isRef = false >
				<#assign activeID_finalInspection_defaultValue=''>
												<#assign activeID_finalInspection_defaultValue=''>
				<#if (activeID_finalInspection_defaultValue!)?string=="currentUser">
					<#assign activeID_finalInspection_defaultValue='${staffJson!}'>
				<#elseif (activeID_finalInspection_defaultValue!)?string=="currentPost">
					<#assign activeID_finalInspection_defaultValue='${postJson!}'>
				<#elseif (activeID_finalInspection_defaultValue!)?string=="currentDepart">
					<#assign activeID_finalInspection_defaultValue='${deptJson!}'>
				<#elseif (activeID_finalInspection_defaultValue!)?string=="currentComp">
					<#assign activeID_finalInspection_defaultValue='${compJson!}'>
				</#if>
				<#assign activeID_finalInspection_defaultText=''>
				<activeID.finalInspection
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (activeID_finalInspection_defaultValue)?? &&(activeID_finalInspection_defaultValue)?has_content>
							defaultValue='${(activeID_finalInspection_defaultValue!)?string}'
						</#if>
						<#if (activeID_finalInspection_defaultText)?? &&(activeID_finalInspection_defaultText)?has_content>
							defaultText='${(activeID_finalInspection_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">完工检验</activeID.finalInspection>
				<#assign isRef = false >
				<#assign activeID_id_defaultValue=''>
												<#assign activeID_id_defaultValue=''>
				<#if (activeID_id_defaultValue!)?string=="currentUser">
					<#assign activeID_id_defaultValue='${staffJson!}'>
				<#elseif (activeID_id_defaultValue!)?string=="currentPost">
					<#assign activeID_id_defaultValue='${postJson!}'>
				<#elseif (activeID_id_defaultValue!)?string=="currentDepart">
					<#assign activeID_id_defaultValue='${deptJson!}'>
				<#elseif (activeID_id_defaultValue!)?string=="currentComp">
					<#assign activeID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign activeID_id_defaultText=''>
				<activeID.id
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</activeID.id>
				<#assign isRef = false >
				<#assign factoryID_name_defaultValue=''>
												<#assign factoryID_name_defaultValue=''>
				<#if (factoryID_name_defaultValue!)?string=="currentUser">
					<#assign factoryID_name_defaultValue='${staffJson!}'>
				<#elseif (factoryID_name_defaultValue!)?string=="currentPost">
					<#assign factoryID_name_defaultValue='${postJson!}'>
				<#elseif (factoryID_name_defaultValue!)?string=="currentDepart">
					<#assign factoryID_name_defaultValue='${deptJson!}'>
				<#elseif (factoryID_name_defaultValue!)?string=="currentComp">
					<#assign factoryID_name_defaultValue='${compJson!}'>
				</#if>
				<#assign factoryID_name_defaultText=''>
				<factoryID.name
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factroyRef1.action','dg1497589621829factoryID.name','${getText("MESBasic.viewtitle.radion1419491307826")}',sPTGridID,nRow,sFieldName,CheckDepartmentSet_dg1497589621829Widget,null,false,false,'','MESBasic_1_factoryModel_factroyRef1')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (factoryID_name_defaultValue)?? &&(factoryID_name_defaultValue)?has_content>
							defaultValue='${(factoryID_name_defaultValue!)?string}'
						</#if>
						<#if (factoryID_name_defaultText)?? &&(factoryID_name_defaultText)?has_content>
							defaultText='${(factoryID_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工作中心</factoryID.name>
				<#assign isRef = false >
				<#assign applyCheckDept_name_defaultValue=''>
												<#assign applyCheckDept_name_defaultValue=''>
				<#if (applyCheckDept_name_defaultValue!)?string=="currentUser">
					<#assign applyCheckDept_name_defaultValue='${staffJson!}'>
				<#elseif (applyCheckDept_name_defaultValue!)?string=="currentPost">
					<#assign applyCheckDept_name_defaultValue='${postJson!}'>
				<#elseif (applyCheckDept_name_defaultValue!)?string=="currentDepart">
					<#assign applyCheckDept_name_defaultValue='${deptJson!}'>
				<#elseif (applyCheckDept_name_defaultValue!)?string=="currentComp">
					<#assign applyCheckDept_name_defaultValue='${compJson!}'>
				</#if>
				<#assign applyCheckDept_name_defaultText=''>
				<applyCheckDept.name
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self','dg1497589621829applyCheckDept.name','${getText("foundation.ec.entity.department.reference")}',sPTGridID,nRow,sFieldName,CheckDepartmentSet_dg1497589621829Widget,null,false,false,'','sysbase_1.0_department_departmentRefCustom')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (applyCheckDept_name_defaultValue)?? &&(applyCheckDept_name_defaultValue)?has_content>
							defaultValue='${(applyCheckDept_name_defaultValue!)?string}'
						</#if>
						<#if (applyCheckDept_name_defaultText)?? &&(applyCheckDept_name_defaultText)?has_content>
							defaultText='${(applyCheckDept_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">申检部门</applyCheckDept.name>
				<#assign isRef = false >
				<#assign applyCheckStaff_name_defaultValue=''>
												<#assign applyCheckStaff_name_defaultValue=''>
				<#if (applyCheckStaff_name_defaultValue!)?string=="currentUser">
					<#assign applyCheckStaff_name_defaultValue='${staffJson!}'>
				<#elseif (applyCheckStaff_name_defaultValue!)?string=="currentPost">
					<#assign applyCheckStaff_name_defaultValue='${postJson!}'>
				<#elseif (applyCheckStaff_name_defaultValue!)?string=="currentDepart">
					<#assign applyCheckStaff_name_defaultValue='${deptJson!}'>
				<#elseif (applyCheckStaff_name_defaultValue!)?string=="currentComp">
					<#assign applyCheckStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign applyCheckStaff_name_defaultText=''>
				<applyCheckStaff.name
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/staff/common/staffListFrameset.action','dg1497589621829applyCheckStaff.name','${getText("foundation.ec.entity.view.reference")}',sPTGridID,nRow,sFieldName,CheckDepartmentSet_dg1497589621829Widget,null,false,false,'','sysbase_1.0_staff_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (applyCheckStaff_name_defaultValue)?? &&(applyCheckStaff_name_defaultValue)?has_content>
							defaultValue='${(applyCheckStaff_name_defaultValue!)?string}'
						</#if>
						<#if (applyCheckStaff_name_defaultText)?? &&(applyCheckStaff_name_defaultText)?has_content>
							defaultText='${(applyCheckStaff_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">申检人</applyCheckStaff.name>
				<#assign isRef = false >
				<#assign exeCheckDept_name_defaultValue=''>
												<#assign exeCheckDept_name_defaultValue=''>
				<#if (exeCheckDept_name_defaultValue!)?string=="currentUser">
					<#assign exeCheckDept_name_defaultValue='${staffJson!}'>
				<#elseif (exeCheckDept_name_defaultValue!)?string=="currentPost">
					<#assign exeCheckDept_name_defaultValue='${postJson!}'>
				<#elseif (exeCheckDept_name_defaultValue!)?string=="currentDepart">
					<#assign exeCheckDept_name_defaultValue='${deptJson!}'>
				<#elseif (exeCheckDept_name_defaultValue!)?string=="currentComp">
					<#assign exeCheckDept_name_defaultValue='${compJson!}'>
				</#if>
				<#assign exeCheckDept_name_defaultText=''>
				<exeCheckDept.name
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self','dg1497589621829exeCheckDept.name','${getText("foundation.ec.entity.department.reference")}',sPTGridID,nRow,sFieldName,CheckDepartmentSet_dg1497589621829Widget,null,false,false,'','sysbase_1.0_department_departmentRefCustom')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (exeCheckDept_name_defaultValue)?? &&(exeCheckDept_name_defaultValue)?has_content>
							defaultValue='${(exeCheckDept_name_defaultValue!)?string}'
						</#if>
						<#if (exeCheckDept_name_defaultText)?? &&(exeCheckDept_name_defaultText)?has_content>
							defaultText='${(exeCheckDept_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">检验部门</exeCheckDept.name>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_CheckDepartmentSet", "RM_7.5.0.0_formula_checkDepartEditdg1497589621829", "DATAGRID", "checkDepartmentSet")>
				<#list customPropViewMappings as cpvm>
					<#assign cpvmReadOnly = false>
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
							onFocus="CUI.toggleClearBtn_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(CheckDepartmentSet_dg1497589621829Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1497589621829${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',CheckDepartmentSet_dg1497589621829Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(CheckDepartmentSet_dg1497589621829Widget,'CheckDepartmentSet_dg1497589621829Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(CheckDepartmentSet_dg1497589621829Widget,'CheckDepartmentSet_dg1497589621829Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="CheckDepartmentSet_dg1497589621829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="200">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="CheckDepartmentSet_dg1497589621829Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.activeID.id)!}</c>
					<c>${(row.factoryID.id)!}</c>
					<c>${(row.applyCheckDept.id)!}</c>
					<c>${(row.applyCheckStaff.id)!}</c>
					<c>${(row.exeCheckDept.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_CheckDepartmentSet", "RM_7.5.0.0_formula_checkDepartEditdg1497589621829", "DATAGRID", "checkDepartmentSet")>
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
