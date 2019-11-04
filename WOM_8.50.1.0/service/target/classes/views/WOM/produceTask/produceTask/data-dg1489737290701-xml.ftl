<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489737290701" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<processType.id IsHiddenField="true"></processType.id>
				<factoryId.id IsHiddenField="true"></factoryId.id>
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
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1489737290701Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit = checkFieldPermission('name','WOM_7.5.0.0_produceTask_ProduceTaskProcess','WOM_7.5.0.0_produceTask_ProduceTaskProcess_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit == 1>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1489737290701Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1489737290701Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/processType/processType/processTypeRef.action','dg1489737290701processType.name','${getText("RM.viewtitle.randon1487220867598")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1489737290701Widget,null,false,false,'','RM_7.5.0.0_processType_processTypeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1489737290701Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','WOM_7.5.0.0_produceTask_ProduceTaskProcess','RM_7.5.0.0_processType_ProcessType_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit == 1>
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
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1489737290701Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_longTime_permit = checkFieldPermission('longTime','WOM_7.5.0.0_produceTask_ProduceTaskProcess','WOM_7.5.0.0_produceTask_ProduceTaskProcess_longTime')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_longTime_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_longTime_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
				<#assign isRef = false >
				<#assign factoryId_name_defaultValue=''>
												<#assign factoryId_name_defaultValue=''>
				<#if (factoryId_name_defaultValue!)?string=="currentUser">
					<#assign factoryId_name_defaultValue='${staffJson!}'>
				<#elseif (factoryId_name_defaultValue!)?string=="currentPost">
					<#assign factoryId_name_defaultValue='${postJson!}'>
				<#elseif (factoryId_name_defaultValue!)?string=="currentDepart">
					<#assign factoryId_name_defaultValue='${deptJson!}'>
				<#elseif (factoryId_name_defaultValue!)?string=="currentComp">
					<#assign factoryId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign factoryId_name_defaultText=''>
				<factoryId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1489737290701Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1489737290701Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factroyRef1.action','dg1489737290701factoryId.name','${getText("MESBasic.viewtitle.radion1419491307826")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1489737290701Widget,null,false,false,'','MESBasic_1_factoryModel_factroyRef1')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1489737290701Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_factoryId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('factoryId.name','WOM_7.5.0.0_produceTask_ProduceTaskProcess','MESBasic_1_factoryModel_FactoryModel_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_factoryId_MESBasic_1_factoryModel_FactoryModel_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_factoryId_MESBasic_1_factoryModel_FactoryModel_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (factoryId_name_defaultValue)?? &&(factoryId_name_defaultValue)?has_content>
							defaultValue='${(factoryId_name_defaultValue!)?string}'
						</#if>
						<#if (factoryId_name_defaultText)?? &&(factoryId_name_defaultText)?has_content>
							defaultText='${(factoryId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工作单元</factoryId.name>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1489737290701Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskProcess','WOM_7.5.0.0_produceTask_ProduceTaskProcess_remark')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_remark_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_remark_permit == 1>
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
					<c>${(row.processType.id)!}</c>
					<c>${(row.factoryId.id)!}</c>
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
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit = checkFieldPermission('name','WOM_7.5.0.0_produceTask_ProduceTaskProcess','WOM_7.5.0.0_produceTask_ProduceTaskProcess_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit != 0><#if (row.name)?has_content>${(row.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit = checkFieldPermission('processType.name','WOM_7.5.0.0_produceTask_ProduceTaskProcess','RM_7.5.0.0_processType_ProcessType_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_processType_RM_7_5_0_0_processType_ProcessType_name_permit != 0><#if (row.processType.name)?has_content>${(row.processType.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskProcess_longTime_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_longTime_permit = checkFieldPermission('longTime','WOM_7.5.0.0_produceTask_ProduceTaskProcess','WOM_7.5.0.0_produceTask_ProduceTaskProcess_longTime')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_longTime_permit != 0><#if (row.longTime)?has_content>#{(row.longTime)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskProcess_factoryId_MESBasic_1_factoryModel_FactoryModel_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_factoryId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('factoryId.name','WOM_7.5.0.0_produceTask_ProduceTaskProcess','MESBasic_1_factoryModel_FactoryModel_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_factoryId_MESBasic_1_factoryModel_FactoryModel_name_permit != 0><#if (row.factoryId.name)?has_content>${(row.factoryId.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskProcess_remark_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskProcess_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskProcess','WOM_7.5.0.0_produceTask_ProduceTaskProcess_remark')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskProcess_remark_permit != 0><#if (row.remark)?has_content>${(row.remark)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>