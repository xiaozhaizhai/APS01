<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1416558291086" pageSize="${dg1416558291086Page.pageSize}" totalCount="${dg1416558291086Page.totalCount}" totalPages="${dg1416558291086Page.totalPages}" pageNo="${dg1416558291086Page.pageNo}" hasPre="${dg1416558291086Page.hasPre?string}" hasNext="${dg1416558291086Page.hasNext?string}" prePage="${dg1416558291086Page.prePage}" nextPage="${dg1416558291086Page.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<sort IsHiddenField="true"></sort>
				<switcher.id IsHiddenField="true"></switcher.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign stype_defaultValue='MES_SWITHER/2'>
						 				<#assign stype_defaultText=''>
				<stype.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="SwitcherModel_dg1416558291086Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_routine_SwitcherModel_stype_permit = checkFieldPermission('stype','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_stype')>
						<#if MESBasic_1_routine_SwitcherModel_stype_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_routine_SwitcherModel_stype_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('MES_SWITHER')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (stype_defaultValue)?? &&(stype_defaultValue)?has_content>
							defaultValue='${(stype_defaultValue!)?string}'
						</#if>
						<#if (stype_defaultText)?? &&(stype_defaultText)?has_content>
							defaultText='${(stype_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">类型</stype.id>
				<#assign isRef = false >
				<#assign switcher_code_defaultValue=''>
												<#assign switcher_code_defaultValue=''>
				<#if (switcher_code_defaultValue!)?string=="currentUser">
					<#assign switcher_code_defaultValue='${staffJson!}'>
				<#elseif (switcher_code_defaultValue!)?string=="currentPost">
					<#assign switcher_code_defaultValue='${postJson!}'>
				<#elseif (switcher_code_defaultValue!)?string=="currentDepart">
					<#assign switcher_code_defaultValue='${deptJson!}'>
				<#elseif (switcher_code_defaultValue!)?string=="currentComp">
					<#assign switcher_code_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_code_defaultText=''>
				<switcher.code
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(SwitcherModel_dg1416558291086Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(SwitcherModel_dg1416558291086Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/switcherOnlyRef.action','dg1416558291086switcher.code','${getText("MESBasic.viewtitle.radion1417920493220")}',sPTGridID,nRow,sFieldName,SwitcherModel_dg1416558291086Widget,null,false,false,'','MESBasic_1_itemManage_switcherOnlyRef')"
								onKeyUp="MESBasic.routine.routine.routineEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':SwitcherModel_dg1416558291086Widget,
										'sGridName':'SwitcherModel_dg1416558291086Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/itemManage/itemSetup/switcherOnlyRef.action',
										'displayfieldname':'code',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.routine.routine.routineEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.routine.routine.routineEdit._querycustomFunc(\'dg1416558291086switcher.code\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="SwitcherModel_dg1416558291086Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_code_permit = checkFieldPermission('switcher.code','MESBasic_1_routine_SwitcherModel','MESBasic_1_itemManage_ItemSetup_code')>
						<#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_code_permit == 0>
						readOnly="true" hideEditOnReadOnly="true" 
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_code_permit == 1>
						readOnly="true" hideEditOnReadOnly="true" 
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (switcher_code_defaultValue)?? &&(switcher_code_defaultValue)?has_content>
							defaultValue='${(switcher_code_defaultValue!)?string}'
						</#if>
						<#if (switcher_code_defaultText)?? &&(switcher_code_defaultText)?has_content>
							defaultText='${(switcher_code_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点编码</switcher.code>
				<#assign isRef = false >
				<#assign switcher_itemNumber_defaultValue=''>
												<#assign switcher_itemNumber_defaultValue=''>
				<#if (switcher_itemNumber_defaultValue!)?string=="currentUser">
					<#assign switcher_itemNumber_defaultValue='${staffJson!}'>
				<#elseif (switcher_itemNumber_defaultValue!)?string=="currentPost">
					<#assign switcher_itemNumber_defaultValue='${postJson!}'>
				<#elseif (switcher_itemNumber_defaultValue!)?string=="currentDepart">
					<#assign switcher_itemNumber_defaultValue='${deptJson!}'>
				<#elseif (switcher_itemNumber_defaultValue!)?string=="currentComp">
					<#assign switcher_itemNumber_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_itemNumber_defaultText=''>
				<switcher.itemNumber
					sort="false"  onPropertyChange="SwitcherModel_dg1416558291086Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemNumber_permit = checkFieldPermission('switcher.itemNumber','MESBasic_1_routine_SwitcherModel','MESBasic_1_itemManage_ItemSetup_itemNumber')>
						<#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemNumber_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemNumber_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (switcher_itemNumber_defaultValue)?? &&(switcher_itemNumber_defaultValue)?has_content>
							defaultValue='${(switcher_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (switcher_itemNumber_defaultText)?? &&(switcher_itemNumber_defaultText)?has_content>
							defaultText='${(switcher_itemNumber_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">生产位号</switcher.itemNumber>
				<#assign isRef = false >
				<#assign switcher_itemName_defaultValue=''>
												<#assign switcher_itemName_defaultValue=''>
				<#if (switcher_itemName_defaultValue!)?string=="currentUser">
					<#assign switcher_itemName_defaultValue='${staffJson!}'>
				<#elseif (switcher_itemName_defaultValue!)?string=="currentPost">
					<#assign switcher_itemName_defaultValue='${postJson!}'>
				<#elseif (switcher_itemName_defaultValue!)?string=="currentDepart">
					<#assign switcher_itemName_defaultValue='${deptJson!}'>
				<#elseif (switcher_itemName_defaultValue!)?string=="currentComp">
					<#assign switcher_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_itemName_defaultText=''>
				<switcher.itemName
					sort="false"  onPropertyChange="SwitcherModel_dg1416558291086Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemName_permit = checkFieldPermission('switcher.itemName','MESBasic_1_routine_SwitcherModel','MESBasic_1_itemManage_ItemSetup_itemName')>
						<#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (switcher_itemName_defaultValue)?? &&(switcher_itemName_defaultValue)?has_content>
							defaultValue='${(switcher_itemName_defaultValue!)?string}'
						</#if>
						<#if (switcher_itemName_defaultText)?? &&(switcher_itemName_defaultText)?has_content>
							defaultText='${(switcher_itemName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">位号名称</switcher.itemName>
				<#assign isRef = false >
				<#assign forword_defaultValue='false'>
						 				<#assign forword_defaultText=''>
				<forword
					sort="false"  onPropertyChange="SwitcherModel_dg1416558291086Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_routine_SwitcherModel_forword_permit = checkFieldPermission('forword','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_forword')>
						<#if MESBasic_1_routine_SwitcherModel_forword_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_routine_SwitcherModel_forword_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">正向</forword>
				<#assign isRef = false >
				<#assign backword_defaultValue='false'>
						 				<#assign backword_defaultText=''>
				<backword
					sort="false"  onPropertyChange="SwitcherModel_dg1416558291086Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_routine_SwitcherModel_backword_permit = checkFieldPermission('backword','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_backword')>
						<#if MESBasic_1_routine_SwitcherModel_backword_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_routine_SwitcherModel_backword_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">反向</backword>
	</thead>
	<tbody>
		<#list dg1416558291086Page.result as row>
		<row  onClick="SwitcherModel_dg1416558291086Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.sort)!}</c>
					<c>${(row.switcher.id)!}</c>
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
					<#if !MESBasic_1_routine_SwitcherModel_stype_permit??>
					<#assign MESBasic_1_routine_SwitcherModel_stype_permit = checkFieldPermission('stype','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_stype')>
					</#if>
							<c><#if MESBasic_1_routine_SwitcherModel_stype_permit != 0><#if (row.stype.id)?has_content>${(row.stype.id)!}</#if></#if></c>
					<#if !MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_code_permit??>
					<#assign MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_code_permit = checkFieldPermission('switcher.code','MESBasic_1_routine_SwitcherModel','MESBasic_1_itemManage_ItemSetup_code')>
					</#if>
							<c><#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_code_permit != 0><#if (row.switcher.code)?has_content>${(row.switcher.code)!}</#if></#if></c>
					<#if !MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemNumber_permit??>
					<#assign MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemNumber_permit = checkFieldPermission('switcher.itemNumber','MESBasic_1_routine_SwitcherModel','MESBasic_1_itemManage_ItemSetup_itemNumber')>
					</#if>
							<c><#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemNumber_permit != 0><#if (row.switcher.itemNumber)?has_content>${(row.switcher.itemNumber)!}</#if></#if></c>
					<#if !MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemName_permit??>
					<#assign MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemName_permit = checkFieldPermission('switcher.itemName','MESBasic_1_routine_SwitcherModel','MESBasic_1_itemManage_ItemSetup_itemName')>
					</#if>
							<c><#if MESBasic_1_routine_SwitcherModel_switcher_MESBasic_1_itemManage_ItemSetup_itemName_permit != 0><#if (row.switcher.itemName)?has_content>${(row.switcher.itemName)!}</#if></#if></c>
					<#if !MESBasic_1_routine_SwitcherModel_forword_permit??>
					<#assign MESBasic_1_routine_SwitcherModel_forword_permit = checkFieldPermission('forword','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_forword')>
					</#if>
							<c><#if MESBasic_1_routine_SwitcherModel_forword_permit != 0><#if (row.forword)?has_content>${(row.forword?string)!}<#else>false</#if></#if></c>
					<#if !MESBasic_1_routine_SwitcherModel_backword_permit??>
					<#assign MESBasic_1_routine_SwitcherModel_backword_permit = checkFieldPermission('backword','MESBasic_1_routine_SwitcherModel','MESBasic_1_routine_SwitcherModel_backword')>
					</#if>
							<c><#if MESBasic_1_routine_SwitcherModel_backword_permit != 0><#if (row.backword)?has_content>${(row.backword?string)!}<#else>false</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>