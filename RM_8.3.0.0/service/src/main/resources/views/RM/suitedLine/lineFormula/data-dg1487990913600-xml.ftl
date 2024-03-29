<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487990913600" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<sort IsHiddenField="true"></sort>
				<processId.id IsHiddenField="true"></processId.id>
				<unitId.id IsHiddenField="true"></unitId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign processId_name_defaultValue=''>
												<#assign processId_name_defaultValue=''>
				<#if (processId_name_defaultValue!)?string=="currentUser">
					<#assign processId_name_defaultValue='${staffJson!}'>
				<#elseif (processId_name_defaultValue!)?string=="currentPost">
					<#assign processId_name_defaultValue='${postJson!}'>
				<#elseif (processId_name_defaultValue!)?string=="currentDepart">
					<#assign processId_name_defaultValue='${deptJson!}'>
				<#elseif (processId_name_defaultValue!)?string=="currentComp">
					<#assign processId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign processId_name_defaultText=''>
				<processId.name
						style="font-color:0303B3"
						showFormatFunc="laId=$" 
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessUnit_dg1487990913600Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessUnit_dg1487990913600Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processLineReference.action','dg1487990913600processId.name','${getText("RM.viewtitle.randon1488977430659")}',sPTGridID,nRow,sFieldName,ProcessUnit_dg1487990913600Widget,null,false,false,'','RM_7.5.0.0_formula_processLineReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessUnit_dg1487990913600Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_suitedLine_ProcessUnit_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('processId.name','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_formula_FormulaProcess_name')>
						<#if RM_7_5_0_0_suitedLine_ProcessUnit_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessUnit_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (processId_name_defaultValue)?? &&(processId_name_defaultValue)?has_content>
							defaultValue='${(processId_name_defaultValue!)?string}'
						</#if>
						<#if (processId_name_defaultText)?? &&(processId_name_defaultText)?has_content>
							defaultText='${(processId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序名称</processId.name>
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
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProcessUnit_dg1487990913600Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_suitedLine_ProcessUnit_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('unitId.name','RM_7.5.0.0_suitedLine_ProcessUnit','MESBasic_1_factoryModel_FactoryModel_name')>
						<#if RM_7_5_0_0_suitedLine_ProcessUnit_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessUnit_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
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
				<#assign pmemo_defaultValue=''>
						 						<#assign pmemo_defaultValue=''>
				<#assign pmemo_defaultText=''>
				<pmemo
					sort="false"  onPropertyChange="ProcessUnit_dg1487990913600Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_suitedLine_ProcessUnit_pmemo_permit = checkFieldPermission('pmemo','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_ProcessUnit_pmemo')>
						<#if RM_7_5_0_0_suitedLine_ProcessUnit_pmemo_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_suitedLine_ProcessUnit_pmemo_permit == 1>
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
					width="100">备注</pmemo>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProcessUnit_dg1487990913600Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.sort)!}</c>
					<c>${(row.processId.id)!}</c>
					<c>${(row.unitId.id)!}</c>
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
					<#if !RM_7_5_0_0_suitedLine_ProcessUnit_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessUnit_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('processId.name','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_formula_FormulaProcess_name')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessUnit_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit != 0><#if (row.processId.name)?has_content>${(row.processId.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_suitedLine_ProcessUnit_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessUnit_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('unitId.name','RM_7.5.0.0_suitedLine_ProcessUnit','MESBasic_1_factoryModel_FactoryModel_name')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessUnit_unitId_MESBasic_1_factoryModel_FactoryModel_name_permit != 0><#if (row.unitId.name)?has_content>${(row.unitId.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_suitedLine_ProcessUnit_pmemo_permit??>
					<#assign RM_7_5_0_0_suitedLine_ProcessUnit_pmemo_permit = checkFieldPermission('pmemo','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_ProcessUnit_pmemo')>
					</#if>
							<c><#if RM_7_5_0_0_suitedLine_ProcessUnit_pmemo_permit != 0><#if (row.pmemo)?has_content>${(row.pmemo)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>