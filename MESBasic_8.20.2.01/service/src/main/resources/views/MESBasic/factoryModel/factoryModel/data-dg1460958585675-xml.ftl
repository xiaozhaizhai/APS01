<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1460958585675" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<objDepartment.id IsHiddenField="true"></objDepartment.id>
				<objEqu.id IsHiddenField="true"></objEqu.id>
				<clearItem.id IsHiddenField="true"></clearItem.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign objDepartment_name_defaultValue=''>
												<#assign objDepartment_name_defaultValue=''>
				<#if (objDepartment_name_defaultValue!)?string=="currentUser">
					<#assign objDepartment_name_defaultValue='${staffJson!}'>
				<#elseif (objDepartment_name_defaultValue!)?string=="currentPost">
					<#assign objDepartment_name_defaultValue='${postJson!}'>
				<#elseif (objDepartment_name_defaultValue!)?string=="currentDepart">
					<#assign objDepartment_name_defaultValue='${deptJson!}'>
				<#elseif (objDepartment_name_defaultValue!)?string=="currentComp">
					<#assign objDepartment_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objDepartment_name_defaultText=''>
				<objDepartment.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjEquipment_dg1460958585675Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjEquipment_dg1460958585675Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self','dg1460958585675objDepartment.name','${getText("foundation.ec.entity.department.reference")}',sPTGridID,nRow,sFieldName,ObjEquipment_dg1460958585675Widget,null,false,false,'','sysbase_1.0_department_departmentRefCustom')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">部门</objDepartment.name>
				<#assign isRef = false >
				<#assign isFixed_defaultValue=''>
						 						<#assign isFixed_defaultValue=''>
				<#assign isFixed_defaultText=''>
				<isFixed
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'ChangeisFixed()');"
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isFixed_defaultValue)?? &&(isFixed_defaultValue)?has_content>
							defaultValue='${(isFixed_defaultValue!)?string}'
						</#if>
						<#if (isFixed_defaultText)?? &&(isFixed_defaultText)?has_content>
							defaultText='${(isFixed_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">固定安装</isFixed>
				<#assign isRef = false >
				<#assign equipmentNum_defaultValue=''>
						 						<#assign equipmentNum_defaultValue=''>
				<#assign equipmentNum_defaultText=''>
				<equipmentNum
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (equipmentNum_defaultValue)?? &&(equipmentNum_defaultValue)?has_content>
							defaultValue='${(equipmentNum_defaultValue!)?string}'
						</#if>
						<#if (equipmentNum_defaultText)?? &&(equipmentNum_defaultText)?has_content>
							defaultText='${(equipmentNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">设备位号</equipmentNum>
				<#assign isRef = false >
				<#assign objEqu_name_defaultValue=''>
												<#assign objEqu_name_defaultValue=''>
				<#if (objEqu_name_defaultValue!)?string=="currentUser">
					<#assign objEqu_name_defaultValue='${staffJson!}'>
				<#elseif (objEqu_name_defaultValue!)?string=="currentPost">
					<#assign objEqu_name_defaultValue='${postJson!}'>
				<#elseif (objEqu_name_defaultValue!)?string=="currentDepart">
					<#assign objEqu_name_defaultValue='${deptJson!}'>
				<#elseif (objEqu_name_defaultValue!)?string=="currentComp">
					<#assign objEqu_name_defaultValue='${compJson!}'>
				</#if>
				<#assign objEqu_name_defaultText=''>
				<objEqu.name
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjEquipment_dg1460958585675Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjEquipment_dg1460958585675Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/equipManage/equipment/ref.action','dg1460958585675objEqu.name','${getText("MESBasic.viewtitle.randon1423967959681")}',sPTGridID,nRow,sFieldName,ObjEquipment_dg1460958585675Widget,null,false,false,'','MESBasic_1_equipManage_ref')"
								onKeyUp="MESBasic.factoryModel.factoryModel.factoryEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':ObjEquipment_dg1460958585675Widget,
										'sGridName':'ObjEquipment_dg1460958585675Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/equipManage/equipment/ref.action',
										'displayfieldname':'name',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(\'dg1460958585675objEqu.name\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (objEqu_name_defaultValue)?? &&(objEqu_name_defaultValue)?has_content>
							defaultValue='${(objEqu_name_defaultValue!)?string}'
						</#if>
						<#if (objEqu_name_defaultText)?? &&(objEqu_name_defaultText)?has_content>
							defaultText='${(objEqu_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">设备名称</objEqu.name>
				<#assign isRef = false >
				<#assign equipmentType_defaultValue=''>
						 						<#assign equipmentType_defaultValue=''>
				<#assign equipmentType_defaultText=''>
				<equipmentType.id
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'ChooseSysCode(nRow)');"
				    
								<#assign optionMap = getSystemCodeList('MESEquipmentType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (equipmentType_defaultValue)?? &&(equipmentType_defaultValue)?has_content>
							defaultValue='${(equipmentType_defaultValue!)?string}'
						</#if>
						<#if (equipmentType_defaultText)?? &&(equipmentType_defaultText)?has_content>
							defaultText='${(equipmentType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">设备类别</equipmentType.id>
				<#assign isRef = false >
				<#assign isContainer_defaultValue=''>
						 						<#assign isContainer_defaultValue=''>
				<#assign isContainer_defaultText=''>
				<isContainer
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'isFixedChange()');"
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isContainer_defaultValue)?? &&(isContainer_defaultValue)?has_content>
							defaultValue='${(isContainer_defaultValue!)?string}'
						</#if>
						<#if (isContainer_defaultText)?? &&(isContainer_defaultText)?has_content>
							defaultText='${(isContainer_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">是否容器</isContainer>
				<#assign isRef = false >
				<#assign clearType_defaultValue=''>
						 						<#assign clearType_defaultValue=''>
				<#assign clearType_defaultText=''>
				<clearType.id
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ObjEquipment_dg1460958585675Widget.evalCustomFunction(nRow,sFieldName,'ClearTypeChange(nRow)');"
				    
								<#assign optionMap = getSystemCodeList('MESClearSignat')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (clearType_defaultValue)?? &&(clearType_defaultValue)?has_content>
							defaultValue='${(clearType_defaultValue!)?string}'
						</#if>
						<#if (clearType_defaultText)?? &&(clearType_defaultText)?has_content>
							defaultText='${(clearType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">清空类型</clearType.id>
				<#assign isRef = false >
				<#assign clearItem_itemName_defaultValue=''>
												<#assign clearItem_itemName_defaultValue=''>
				<#if (clearItem_itemName_defaultValue!)?string=="currentUser">
					<#assign clearItem_itemName_defaultValue='${staffJson!}'>
				<#elseif (clearItem_itemName_defaultValue!)?string=="currentPost">
					<#assign clearItem_itemName_defaultValue='${postJson!}'>
				<#elseif (clearItem_itemName_defaultValue!)?string=="currentDepart">
					<#assign clearItem_itemName_defaultValue='${deptJson!}'>
				<#elseif (clearItem_itemName_defaultValue!)?string=="currentComp">
					<#assign clearItem_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign clearItem_itemName_defaultText=''>
				<clearItem.itemName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjEquipment_dg1460958585675Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjEquipment_dg1460958585675Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemSelfList.action','dg1460958585675clearItem.itemName','${getText("MESBasic.viewtitle.radion1421223012419")}',sPTGridID,nRow,sFieldName,ObjEquipment_dg1460958585675Widget,null,false,false,'','MESBasic_1_itemManage_itemSelfList')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjEquipment_dg1460958585675Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (clearItem_itemName_defaultValue)?? &&(clearItem_itemName_defaultValue)?has_content>
							defaultValue='${(clearItem_itemName_defaultValue!)?string}'
						</#if>
						<#if (clearItem_itemName_defaultText)?? &&(clearItem_itemName_defaultText)?has_content>
							defaultText='${(clearItem_itemName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">清空位号</clearItem.itemName>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ObjEquipment_dg1460958585675Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.objDepartment.id)!}</c>
					<c>${(row.objEqu.id)!}</c>
					<c>${(row.clearItem.id)!}</c>
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
