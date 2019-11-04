<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1488001671553" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<unitId.id IsHiddenField="true"></unitId.id>
				<activeId.id IsHiddenField="true"></activeId.id>
				<precessStandards.id IsHiddenField="true"></precessStandards.id>
				<itemId.id IsHiddenField="true"></itemId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign unitId_name_defaultValue=''>
												<#assign unitId_name_defaultValue=''>
				<#if (unitId_name_defaultValue!)?string=="currentUser">
					<#assign unitId_name_defaultValue='${staffJson!}'>
				<#elseif (unitId_name_defaultValue!)?string=="currentPost">
					<#assign unitId_name_defaultValue='${postJson!}'>
				<#elseif (unitId_name_defaultValue!)?string=="currentDepart">
					<#assign unitId_name_defaultValue='${deptJson!}'>
				<#elseif (unitId_name_defaultValue!)?string=="currentComp">
					<#assign unitId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign unitId_name_defaultText=''>
				<unitId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factroyRef1.action','dg1488001671553unitId.name','${getText("MESBasic.viewtitle.radion1419491307826")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1488001671553Widget,null,false,false,'','MESBasic_1_factoryModel_factroyRef1')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1488001671553Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_suitedLine_ProcessPoint_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('unitId.name','RM_7.5.0.0_suitedLine_ProcessPoint','MESBasic_1_factoryModel_FactoryModel_name')>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (unitId_name_defaultValue)?? &&(unitId_name_defaultValue)?has_content>
							defaultValue='${(unitId_name_defaultValue!)?string}'
						</#if>
						<#if (unitId_name_defaultText)?? &&(unitId_name_defaultText)?has_content>
							defaultText='${(unitId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工作单元</unitId.name>
				<#assign isRef = false >
				<#assign activeId_name_defaultValue=''>
												<#assign activeId_name_defaultValue=''>
				<#if (activeId_name_defaultValue!)?string=="currentUser">
					<#assign activeId_name_defaultValue='${staffJson!}'>
				<#elseif (activeId_name_defaultValue!)?string=="currentPost">
					<#assign activeId_name_defaultValue='${postJson!}'>
				<#elseif (activeId_name_defaultValue!)?string=="currentDepart">
					<#assign activeId_name_defaultValue='${deptJson!}'>
				<#elseif (activeId_name_defaultValue!)?string=="currentComp">
					<#assign activeId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_name_defaultText=''>
				<activeId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeRef.action','dg1488001671553activeId.name','${getText("RM.viewtitle.randon1489564694469")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1488001671553Widget,null,false,false,'','RM_7.5.0.0_formula_activeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1488001671553Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_suitedLine_ProcessPoint_activeId_RM_7_5_0_0_formula_FormulaProcessActive_name_permit = checkFieldPermission('activeId.name','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_formula_FormulaProcessActive_name')>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_activeId_RM_7_5_0_0_formula_FormulaProcessActive_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_activeId_RM_7_5_0_0_formula_FormulaProcessActive_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (activeId_name_defaultValue)?? &&(activeId_name_defaultValue)?has_content>
							defaultValue='${(activeId_name_defaultValue!)?string}'
						</#if>
						<#if (activeId_name_defaultText)?? &&(activeId_name_defaultText)?has_content>
							defaultText='${(activeId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序活动</activeId.name>
				<#assign isRef = false >
				<#assign precessStandards_quota_defaultValue=''>
												<#assign precessStandards_quota_defaultValue=''>
				<#if (precessStandards_quota_defaultValue!)?string=="currentUser">
					<#assign precessStandards_quota_defaultValue='${staffJson!}'>
				<#elseif (precessStandards_quota_defaultValue!)?string=="currentPost">
					<#assign precessStandards_quota_defaultValue='${postJson!}'>
				<#elseif (precessStandards_quota_defaultValue!)?string=="currentDepart">
					<#assign precessStandards_quota_defaultValue='${deptJson!}'>
				<#elseif (precessStandards_quota_defaultValue!)?string=="currentComp">
					<#assign precessStandards_quota_defaultValue='${compJson!}'>
				</#if>
				<#assign precessStandards_quota_defaultText=''>
				<precessStandards.quota
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/precessStandards/precessStandardsRef.action','dg1488001671553precessStandards.quota','${getText("RM.viewtitle.randon1489564893234")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1488001671553Widget,null,false,false,'','RM_7.5.0.0_formula_precessStandardsRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1488001671553Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_suitedLine_ProcessPoint_precessStandards_RM_7_5_0_0_formula_PrecessStandards_quota_permit = checkFieldPermission('precessStandards.quota','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_formula_PrecessStandards_quota')>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_precessStandards_RM_7_5_0_0_formula_PrecessStandards_quota_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_precessStandards_RM_7_5_0_0_formula_PrecessStandards_quota_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (precessStandards_quota_defaultValue)?? &&(precessStandards_quota_defaultValue)?has_content>
							defaultValue='${(precessStandards_quota_defaultValue!)?string}'
						</#if>
						<#if (precessStandards_quota_defaultText)?? &&(precessStandards_quota_defaultText)?has_content>
							defaultText='${(precessStandards_quota_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">指标</precessStandards.quota>
				<#assign isRef = false >
				<#assign itemId_crtValue_defaultValue=''>
												<#assign itemId_crtValue_defaultValue=''>
				<#if (itemId_crtValue_defaultValue!)?string=="currentUser">
					<#assign itemId_crtValue_defaultValue='${staffJson!}'>
				<#elseif (itemId_crtValue_defaultValue!)?string=="currentPost">
					<#assign itemId_crtValue_defaultValue='${postJson!}'>
				<#elseif (itemId_crtValue_defaultValue!)?string=="currentDepart">
					<#assign itemId_crtValue_defaultValue='${deptJson!}'>
				<#elseif (itemId_crtValue_defaultValue!)?string=="currentComp">
					<#assign itemId_crtValue_defaultValue='${compJson!}'>
				</#if>
				<#assign itemId_crtValue_defaultText=''>
				<itemId.crtValue
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1488001671553Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRefForContainer.action','dg1488001671553itemId.crtValue','${getText("MESBasic.viewtitle.randon1422422463756")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1488001671553Widget,null,false,false,'','MESBasic_1_itemManage_itemRefForContainer')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1488001671553Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_suitedLine_ProcessPoint_itemId_MESBasic_1_itemManage_ItemSetup_crtValue_permit = checkFieldPermission('itemId.crtValue','RM_7.5.0.0_suitedLine_ProcessPoint','MESBasic_1_itemManage_ItemSetup_crtValue')>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_itemId_MESBasic_1_itemManage_ItemSetup_crtValue_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_itemId_MESBasic_1_itemManage_ItemSetup_crtValue_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="4"
						
						 dataType="float"
						
						<#if (itemId_crtValue_defaultValue)?? &&(itemId_crtValue_defaultValue)?has_content>
							defaultValue='${(itemId_crtValue_defaultValue!)?string}'
						</#if>
						<#if (itemId_crtValue_defaultText)?? &&(itemId_crtValue_defaultText)?has_content>
							defaultText='${(itemId_crtValue_defaultText!)?string}'
						</#if>
						
					align="left" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="DECIMAL" 
					width="100">测点</itemId.crtValue>
				<#assign isRef = false >
				<#assign pmemo_defaultValue=''>
						 						<#assign pmemo_defaultValue=''>
				<#assign pmemo_defaultText=''>
				<pmemo
					sort="false"  onPropertyChange="ProcessPoint_dg1488001671553Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_suitedLine_ProcessPoint_pmemo_permit = checkFieldPermission('pmemo','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_pmemo')>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_pmemo_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessPoint_pmemo_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (pmemo_defaultValue)?? &&(pmemo_defaultValue)?has_content>
							defaultValue='${(pmemo_defaultValue!)?string}'
						</#if>
						<#if (pmemo_defaultText)?? &&(pmemo_defaultText)?has_content>
							defaultText='${(pmemo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="150">备注</pmemo>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProcessPoint_dg1488001671553Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.unitId.id)!}</c>
					<c>${(row.activeId.id)!}</c>
					<c>${(row.precessStandards.id)!}</c>
					<c>${(row.itemId.id)!}</c>
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
					<#if !RM_7_5_0_0_suitedLine_ProcessPoint_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessPoint_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('unitId.name','RM_7.5.0.0_suitedLine_ProcessPoint','MESBasic_1_factoryModel_FactoryModel_name')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessPoint_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit != 0><#if (row.unitId.name)?has_content>${(row.unitId.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_suitedLine_ProcessPoint_activeId_RM_7_5_0_0_formula_FormulaProcessActive_name_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessPoint_activeId_RM_7_5_0_0_formula_FormulaProcessActive_name_permit = checkFieldPermission('activeId.name','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_formula_FormulaProcessActive_name')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessPoint_activeId_RM_7_5_0_0_formula_FormulaProcessActive_name_permit != 0><#if (row.activeId.name)?has_content>${(row.activeId.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_suitedLine_ProcessPoint_precessStandards_RM_7_5_0_0_formula_PrecessStandards_quota_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessPoint_precessStandards_RM_7_5_0_0_formula_PrecessStandards_quota_permit = checkFieldPermission('precessStandards.quota','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_formula_PrecessStandards_quota')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessPoint_precessStandards_RM_7_5_0_0_formula_PrecessStandards_quota_permit != 0><#if (row.precessStandards.quota)?has_content>${(row.precessStandards.quota)!}</#if></#if></c>
					<#if !RM_7_5_0_0_suitedLine_ProcessPoint_itemId_MESBasic_1_itemManage_ItemSetup_crtValue_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessPoint_itemId_MESBasic_1_itemManage_ItemSetup_crtValue_permit = checkFieldPermission('itemId.crtValue','RM_7.5.0.0_suitedLine_ProcessPoint','MESBasic_1_itemManage_ItemSetup_crtValue')>
					</#if>
						<c><#if RM_7_5_0_0_suitedLine_ProcessPoint_itemId_MESBasic_1_itemManage_ItemSetup_crtValue_permit != 0><#if (row.itemId.crtValue)?has_content>#{(row.itemId.crtValue)!; m4M4}</#if></#if></c>
					<#if !RM_7_5_0_0_suitedLine_ProcessPoint_pmemo_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessPoint_pmemo_permit = checkFieldPermission('pmemo','RM_7.5.0.0_suitedLine_ProcessPoint','RM_7.5.0.0_suitedLine_ProcessPoint_pmemo')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessPoint_pmemo_permit != 0><#if (row.pmemo)?has_content>${(row.pmemo)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>