<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1490749384962" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<processType.id IsHiddenField="true"></processType.id>
				<factoryId.id IsHiddenField="true"></factoryId.id>
				<formularProcess.id IsHiddenField="true"></formularProcess.id>
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
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="150">工序名称</name>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1490749384962Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1490749384962Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/processType/processType/processTypeRef.action','dg1490749384962processType.name','${getText("RM.viewtitle.randon1487220867598")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1490749384962Widget,null,false,false,'','RM_7.5.0.0_processType_processTypeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (processType_name_defaultValue)?? &&(processType_name_defaultValue)?has_content>
							defaultValue='${(processType_name_defaultValue!)?string}'
						</#if>
						<#if (processType_name_defaultText)?? &&(processType_name_defaultText)?has_content>
							defaultText='${(processType_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="150">工序类型</processType.name>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					width="150">标准时长</longTime>
				<#assign isRef = false >
				<#assign isFirstProcess_defaultValue=''>
						 						<#assign isFirstProcess_defaultValue=''>
				<#assign isFirstProcess_defaultText=''>
				<isFirstProcess
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">首道工序</isFirstProcess>
				<#assign isRef = false >
				<#assign isLastProcess_defaultValue=''>
						 						<#assign isLastProcess_defaultValue=''>
				<#assign isLastProcess_defaultText=''>
				<isLastProcess
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">末道工序</isLastProcess>
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
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1490749384962Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1490749384962Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factroyRef1.action','dg1490749384962factoryId.name','${getText("MESBasic.viewtitle.radion1419491307826")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1490749384962Widget,null,false,false,'','MESBasic_1_factoryModel_factroyRef1')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (factoryId_name_defaultValue)?? &&(factoryId_name_defaultValue)?has_content>
							defaultValue='${(factoryId_name_defaultValue!)?string}'
						</#if>
						<#if (factoryId_name_defaultText)?? &&(factoryId_name_defaultText)?has_content>
							defaultText='${(factoryId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="150">工作单元</factoryId.name>
				<#assign isRef = false >
				<#assign afterRatio_defaultValue=''>
						 						<#assign afterRatio_defaultValue=''>
				<#assign afterRatio_defaultText=''>
				<afterRatio
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (afterRatio_defaultValue)?? &&(afterRatio_defaultValue)?has_content>
							defaultValue='${(afterRatio_defaultValue!)?string}'
						</#if>
						<#if (afterRatio_defaultText)?? &&(afterRatio_defaultText)?has_content>
							defaultText='${(afterRatio_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="150">投料比例(%)</afterRatio>
				<#assign isRef = false >
				<#assign exeOrder_defaultValue=''>
						 						<#assign exeOrder_defaultValue=''>
				<#assign exeOrder_defaultText=''>
				<exeOrder
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						 dataType="float" decLength="0"
						<#if (exeOrder_defaultValue)?? &&(exeOrder_defaultValue)?has_content>
							defaultValue='${(exeOrder_defaultValue!)?string}'
						</#if>
						<#if (exeOrder_defaultText)?? &&(exeOrder_defaultText)?has_content>
							defaultText='${(exeOrder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">执行顺序</exeOrder>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
				<#assign isRef = false >
				<#assign formularProcess_id_defaultValue=''>
												<#assign formularProcess_id_defaultValue=''>
				<#if (formularProcess_id_defaultValue!)?string=="currentUser">
					<#assign formularProcess_id_defaultValue='${staffJson!}'>
				<#elseif (formularProcess_id_defaultValue!)?string=="currentPost">
					<#assign formularProcess_id_defaultValue='${postJson!}'>
				<#elseif (formularProcess_id_defaultValue!)?string=="currentDepart">
					<#assign formularProcess_id_defaultValue='${deptJson!}'>
				<#elseif (formularProcess_id_defaultValue!)?string=="currentComp">
					<#assign formularProcess_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formularProcess_id_defaultText=''>
				<formularProcess.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1490749384962Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1490749384962Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processReference.action','dg1490749384962formularProcess.id','${getText("RM.viewtitle.randon1488596828660")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1490749384962Widget,null,false,false,'','RM_7.5.0.0_formula_processReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskProcess_dg1490749384962Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">配方工序ID</formularProcess.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.processType.id)!}</c>
					<c>${(row.factoryId.id)!}</c>
					<c>${(row.formularProcess.id)!}</c>
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
