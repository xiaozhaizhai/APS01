<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1496370446748" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<orderProcessId.id IsHiddenField="true"></orderProcessId.id>
				<activeId.id IsHiddenField="true"></activeId.id>
				<productId.id IsHiddenField="true"></productId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign orderProcessId_name_defaultValue=''>
												<#assign orderProcessId_name_defaultValue=''>
				<#if (orderProcessId_name_defaultValue!)?string=="currentUser">
					<#assign orderProcessId_name_defaultValue='${staffJson!}'>
				<#elseif (orderProcessId_name_defaultValue!)?string=="currentPost">
					<#assign orderProcessId_name_defaultValue='${postJson!}'>
				<#elseif (orderProcessId_name_defaultValue!)?string=="currentDepart">
					<#assign orderProcessId_name_defaultValue='${deptJson!}'>
				<#elseif (orderProcessId_name_defaultValue!)?string=="currentComp">
					<#assign orderProcessId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign orderProcessId_name_defaultText=''>
				<orderProcessId.name
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit = checkFieldPermission('orderProcessId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskProcess_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (orderProcessId_name_defaultValue)?? &&(orderProcessId_name_defaultValue)?has_content>
							defaultValue='${(orderProcessId_name_defaultValue!)?string}'
						</#if>
						<#if (orderProcessId_name_defaultText)?? &&(orderProcessId_name_defaultText)?has_content>
							defaultText='${(orderProcessId_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序名称</orderProcessId.name>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit = checkFieldPermission('name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">活动名称</name>
				<#assign isRef = false >
				<#assign activeType_defaultValue=''>
						 						<#assign activeType_defaultValue=''>
				<#assign activeType_defaultText=''>
				<activeType.id
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit = checkFieldPermission('activeType','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('activeType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeType_defaultValue)?? &&(activeType_defaultValue)?has_content>
							defaultValue='${(activeType_defaultValue!)?string}'
						</#if>
						<#if (activeType_defaultText)?? &&(activeType_defaultText)?has_content>
							defaultText='${(activeType_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动类型</activeType.id>
				<#assign isRef = false >
				<#assign activeId_batchSite_defaultValue=''>
												<#assign activeId_batchSite_defaultValue=''>
				<#if (activeId_batchSite_defaultValue!)?string=="currentUser">
					<#assign activeId_batchSite_defaultValue='${staffJson!}'>
				<#elseif (activeId_batchSite_defaultValue!)?string=="currentPost">
					<#assign activeId_batchSite_defaultValue='${postJson!}'>
				<#elseif (activeId_batchSite_defaultValue!)?string=="currentDepart">
					<#assign activeId_batchSite_defaultValue='${deptJson!}'>
				<#elseif (activeId_batchSite_defaultValue!)?string=="currentComp">
					<#assign activeId_batchSite_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_batchSite_defaultText=''>
				<activeId.batchSite.id
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit = checkFieldPermission('activeId.batchSite','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_batchSite')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('batchSite')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeId_batchSite_defaultValue)?? &&(activeId_batchSite_defaultValue)?has_content>
							defaultValue='${(activeId_batchSite_defaultValue!)?string}'
						</#if>
						<#if (activeId_batchSite_defaultText)?? &&(activeId_batchSite_defaultText)?has_content>
							defaultText='${(activeId_batchSite_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配料方式</activeId.batchSite.id>
				<#assign isRef = false >
				<#assign activeId_fromContainer_defaultValue=''>
												<#assign activeId_fromContainer_defaultValue=''>
				<#if (activeId_fromContainer_defaultValue!)?string=="currentUser">
					<#assign activeId_fromContainer_defaultValue='${staffJson!}'>
				<#elseif (activeId_fromContainer_defaultValue!)?string=="currentPost">
					<#assign activeId_fromContainer_defaultValue='${postJson!}'>
				<#elseif (activeId_fromContainer_defaultValue!)?string=="currentDepart">
					<#assign activeId_fromContainer_defaultValue='${deptJson!}'>
				<#elseif (activeId_fromContainer_defaultValue!)?string=="currentComp">
					<#assign activeId_fromContainer_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_fromContainer_defaultText=''>
				<activeId.fromContainer.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1496370446748Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1496370446748Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeRef.action','dg1496370446748activeId.fromContainer','${getText("RM.viewtitle.randon1489564694469")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1496370446748Widget,null,false,false,'','RM_7.5.0.0_formula_activeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit = checkFieldPermission('activeId.fromContainer','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_fromContainer')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('fromContainer')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeId_fromContainer_defaultValue)?? &&(activeId_fromContainer_defaultValue)?has_content>
							defaultValue='${(activeId_fromContainer_defaultValue!)?string}'
						</#if>
						<#if (activeId_fromContainer_defaultText)?? &&(activeId_fromContainer_defaultText)?has_content>
							defaultText='${(activeId_fromContainer_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">来自容器</activeId.fromContainer.id>
				<#assign isRef = false >
				<#assign activeId_container_defaultValue=''>
												<#assign activeId_container_defaultValue=''>
				<#if (activeId_container_defaultValue!)?string=="currentUser">
					<#assign activeId_container_defaultValue='${staffJson!}'>
				<#elseif (activeId_container_defaultValue!)?string=="currentPost">
					<#assign activeId_container_defaultValue='${postJson!}'>
				<#elseif (activeId_container_defaultValue!)?string=="currentDepart">
					<#assign activeId_container_defaultValue='${deptJson!}'>
				<#elseif (activeId_container_defaultValue!)?string=="currentComp">
					<#assign activeId_container_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_container_defaultText=''>
				<activeId.container
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit = checkFieldPermission('activeId.container','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_container')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (activeId_container_defaultValue)?? &&(activeId_container_defaultValue)?has_content>
							defaultValue='${(activeId_container_defaultValue!)?string}'
						</#if>
						<#if (activeId_container_defaultText)?? &&(activeId_container_defaultText)?has_content>
							defaultText='${(activeId_container_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">容器</activeId.container>
				<#assign isRef = false >
				<#assign activeId_occurTurn_defaultValue=''>
												<#assign activeId_occurTurn_defaultValue=''>
				<#if (activeId_occurTurn_defaultValue!)?string=="currentUser">
					<#assign activeId_occurTurn_defaultValue='${staffJson!}'>
				<#elseif (activeId_occurTurn_defaultValue!)?string=="currentPost">
					<#assign activeId_occurTurn_defaultValue='${postJson!}'>
				<#elseif (activeId_occurTurn_defaultValue!)?string=="currentDepart">
					<#assign activeId_occurTurn_defaultValue='${deptJson!}'>
				<#elseif (activeId_occurTurn_defaultValue!)?string=="currentComp">
					<#assign activeId_occurTurn_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_occurTurn_defaultText=''>
				<activeId.occurTurn.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1496370446748Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1496370446748Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeRef.action','dg1496370446748activeId.occurTurn','${getText("RM.viewtitle.randon1489564694469")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1496370446748Widget,null,false,false,'','RM_7.5.0.0_formula_activeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit = checkFieldPermission('activeId.occurTurn','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_occurTurn')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('occurTurn')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeId_occurTurn_defaultValue)?? &&(activeId_occurTurn_defaultValue)?has_content>
							defaultValue='${(activeId_occurTurn_defaultValue!)?string}'
						</#if>
						<#if (activeId_occurTurn_defaultText)?? &&(activeId_occurTurn_defaultText)?has_content>
							defaultText='${(activeId_occurTurn_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">发生于</activeId.occurTurn.id>
				<#assign isRef = false >
				<#assign activeId_auto_defaultValue=''>
												<#assign activeId_auto_defaultValue=''>
				<#if (activeId_auto_defaultValue!)?string=="currentUser">
					<#assign activeId_auto_defaultValue='${staffJson!}'>
				<#elseif (activeId_auto_defaultValue!)?string=="currentPost">
					<#assign activeId_auto_defaultValue='${postJson!}'>
				<#elseif (activeId_auto_defaultValue!)?string=="currentDepart">
					<#assign activeId_auto_defaultValue='${deptJson!}'>
				<#elseif (activeId_auto_defaultValue!)?string=="currentComp">
					<#assign activeId_auto_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_auto_defaultText=''>
				<activeId.auto
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit = checkFieldPermission('activeId.auto','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_auto')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (activeId_auto_defaultValue)?? &&(activeId_auto_defaultValue)?has_content>
							defaultValue='${(activeId_auto_defaultValue!)?string}'
						</#if>
						<#if (activeId_auto_defaultText)?? &&(activeId_auto_defaultText)?has_content>
							defaultText='${(activeId_auto_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">控制系统执行</activeId.auto>
				<#assign isRef = false >
				<#assign exeSystem_defaultValue=''>
						 						<#assign exeSystem_defaultValue=''>
				<#assign exeSystem_defaultText=''>
				<exeSystem.id
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit = checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('RMsystem')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (exeSystem_defaultValue)?? &&(exeSystem_defaultValue)?has_content>
							defaultValue='${(exeSystem_defaultValue!)?string}'
						</#if>
						<#if (exeSystem_defaultText)?? &&(exeSystem_defaultText)?has_content>
							defaultText='${(exeSystem_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">执行系统</exeSystem.id>
				<#assign isRef = false >
				<#assign activeId_longTime_defaultValue=''>
												<#assign activeId_longTime_defaultValue=''>
				<#if (activeId_longTime_defaultValue!)?string=="currentUser">
					<#assign activeId_longTime_defaultValue='${staffJson!}'>
				<#elseif (activeId_longTime_defaultValue!)?string=="currentPost">
					<#assign activeId_longTime_defaultValue='${postJson!}'>
				<#elseif (activeId_longTime_defaultValue!)?string=="currentDepart">
					<#assign activeId_longTime_defaultValue='${deptJson!}'>
				<#elseif (activeId_longTime_defaultValue!)?string=="currentComp">
					<#assign activeId_longTime_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_longTime_defaultText=''>
				<activeId.longTime
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit = checkFieldPermission('activeId.longTime','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_longTime')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (activeId_longTime_defaultValue)?? &&(activeId_longTime_defaultValue)?has_content>
							defaultValue='${(activeId_longTime_defaultValue!)?string}'
						</#if>
						<#if (activeId_longTime_defaultText)?? &&(activeId_longTime_defaultText)?has_content>
							defaultText='${(activeId_longTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准时长</activeId.longTime>
				<#assign isRef = false >
				<#assign productId_productCode_defaultValue=''>
												<#assign productId_productCode_defaultValue=''>
				<#if (productId_productCode_defaultValue!)?string=="currentUser">
					<#assign productId_productCode_defaultValue='${staffJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
					<#assign productId_productCode_defaultValue='${postJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
					<#assign productId_productCode_defaultValue='${deptJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
					<#assign productId_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productCode_defaultText=''>
				<productId.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1496370446748Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1496370446748Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1496370446748productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1496370446748Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料编码</productId.productCode>
				<#assign isRef = false >
				<#assign productId_productName_defaultValue=''>
												<#assign productId_productName_defaultValue=''>
				<#if (productId_productName_defaultValue!)?string=="currentUser">
					<#assign productId_productName_defaultValue='${staffJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentPost">
					<#assign productId_productName_defaultValue='${postJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
					<#assign productId_productName_defaultValue='${deptJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentComp">
					<#assign productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productName_defaultText=''>
				<productId.productName
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign isReplace_defaultValue=''>
						 						<#assign isReplace_defaultValue=''>
				<#assign isReplace_defaultText=''>
				<isReplace
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit = checkFieldPermission('isReplace','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isReplace')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isReplace_defaultValue)?? &&(isReplace_defaultValue)?has_content>
							defaultValue='${(isReplace_defaultValue!)?string}'
						</#if>
						<#if (isReplace_defaultText)?? &&(isReplace_defaultText)?has_content>
							defaultText='${(isReplace_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">替代料</isReplace>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isMixQuality_defaultValue)?? &&(isMixQuality_defaultValue)?has_content>
							defaultValue='${(isMixQuality_defaultValue!)?string}'
						</#if>
						<#if (isMixQuality_defaultText)?? &&(isMixQuality_defaultText)?has_content>
							defaultText='${(isMixQuality_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign standardNum_defaultValue=''>
						 						<#assign standardNum_defaultValue=''>
				<#assign standardNum_defaultText=''>
				<standardNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit = checkFieldPermission('standardNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_standardNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (standardNum_defaultValue)?? &&(standardNum_defaultValue)?has_content>
							defaultValue='${(standardNum_defaultValue!)?string}'
						</#if>
						<#if (standardNum_defaultText)?? &&(standardNum_defaultText)?has_content>
							defaultText='${(standardNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">理论用量</standardNum>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (minQuality_defaultValue)?? &&(minQuality_defaultValue)?has_content>
							defaultValue='${(minQuality_defaultValue!)?string}'
						</#if>
						<#if (minQuality_defaultText)?? &&(minQuality_defaultText)?has_content>
							defaultText='${(minQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">理论下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (maxQuality_defaultValue)?? &&(maxQuality_defaultValue)?has_content>
							defaultValue='${(maxQuality_defaultValue!)?string}'
						</#if>
						<#if (maxQuality_defaultText)?? &&(maxQuality_defaultText)?has_content>
							defaultText='${(maxQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">理论上限</maxQuality>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (planNum_defaultValue)?? &&(planNum_defaultValue)?has_content>
							defaultValue='${(planNum_defaultValue!)?string}'
						</#if>
						<#if (planNum_defaultText)?? &&(planNum_defaultText)?has_content>
							defaultText='${(planNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">计划用量</planNum>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (lossRate_defaultValue)?? &&(lossRate_defaultValue)?has_content>
							defaultValue='${(lossRate_defaultValue!)?string}'
						</#if>
						<#if (lossRate_defaultText)?? &&(lossRate_defaultText)?has_content>
							defaultText='${(lossRate_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">损耗率</lossRate>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="ProduceTaskActive_dg1496370446748Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (remark_defaultValue)?? &&(remark_defaultValue)?has_content>
							defaultValue='${(remark_defaultValue!)?string}'
						</#if>
						<#if (remark_defaultText)?? &&(remark_defaultText)?has_content>
							defaultText='${(remark_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.orderProcessId.id)!}</c>
					<c>${(row.activeId.id)!}</c>
					<c>${(row.productId.id)!}</c>
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
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit = checkFieldPermission('orderProcessId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskProcess_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit != 0><#if (row.orderProcessId.name)?has_content>${(row.orderProcessId.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit = checkFieldPermission('name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit != 0><#if (row.name)?has_content>${(row.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit = checkFieldPermission('activeType','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit != 0><#if (row.activeType.id)?has_content>${(row.activeType.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit = checkFieldPermission('activeId.batchSite','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_batchSite')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit != 0><#if (row.activeId.batchSite.id)?has_content>${(row.activeId.batchSite.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit = checkFieldPermission('activeId.fromContainer','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_fromContainer')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit != 0><#if (row.activeId.fromContainer.id)?has_content>${(row.activeId.fromContainer.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit = checkFieldPermission('activeId.container','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_container')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit != 0><#if (row.activeId.container)?has_content>${(row.activeId.container)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit = checkFieldPermission('activeId.occurTurn','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_occurTurn')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit != 0><#if (row.activeId.occurTurn.id)?has_content>${(row.activeId.occurTurn.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit = checkFieldPermission('activeId.auto','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_auto')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit != 0><#if (row.activeId.auto)?has_content>${(row.activeId.auto?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit = checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit != 0><#if (row.exeSystem.id)?has_content>${(row.exeSystem.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit = checkFieldPermission('activeId.longTime','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_longTime')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit != 0><#if (row.activeId.longTime)?has_content>#{(row.activeId.longTime)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit = checkFieldPermission('isReplace','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isReplace')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit != 0><#if (row.isReplace)?has_content>${(row.isReplace?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit != 0><#if (row.isMixQuality)?has_content>${(row.isMixQuality?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit = checkFieldPermission('standardNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_standardNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit != 0><#if (row.standardNum)?has_content>#{(row.standardNum)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit != 0><#if (row.minQuality)?has_content>#{(row.minQuality)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit != 0><#if (row.maxQuality)?has_content>#{(row.maxQuality)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit != 0><#if (row.lossRate)?has_content>#{(row.lossRate)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit != 0><#if (row.remark)?has_content>${(row.remark)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>