<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487242802285" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<processType.id IsHiddenField="true"></processType.id>
				<formulaId.id IsHiddenField="true"></formulaId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign processCode_defaultValue=''>
						 						<#assign processCode_defaultValue=''>
				<#assign processCode_defaultText=''>
				<processCode
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (processCode_defaultValue)?? &&(processCode_defaultValue)?has_content>
							defaultValue='${(processCode_defaultValue!)?string}'
						</#if>
						<#if (processCode_defaultText)?? &&(processCode_defaultText)?has_content>
							defaultText='${(processCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">工序编码</processCode>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcess_dg1487242802285Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcess_dg1487242802285Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/processType/processType/processTypeRef.action','dg1487242802285processType.name','${getText("RM.viewtitle.randon1487220867598")}',sPTGridID,nRow,sFieldName,FormulaProcess_dg1487242802285Widget,null,false,false,'','RM_7.5.0.0_processType_processTypeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">工序类型</processType.name>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">标准时长(分)</longTime>
				<#assign isRef = false >
				<#assign isFirstProcess_defaultValue=''>
						 						<#assign isFirstProcess_defaultValue=''>
				<#assign isFirstProcess_defaultText=''>
				<isFirstProcess
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">末道工序</isLastProcess>
				<#assign isRef = false >
				<#assign cmdType_defaultValue='RM_cmdType/02'>
						 						<#assign cmdType_defaultValue='RM_cmdType/02'>
				<#assign cmdType_defaultText=''>
				<cmdType.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('RM_cmdType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (cmdType_defaultValue)?? &&(cmdType_defaultValue)?has_content>
							defaultValue='${(cmdType_defaultValue!)?string}'
						</#if>
						<#if (cmdType_defaultText)?? &&(cmdType_defaultText)?has_content>
							defaultText='${(cmdType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">指令类型</cmdType.id>
				<#assign isRef = false >
				<#assign procSort_defaultValue=''>
						 						<#assign procSort_defaultValue=''>
				<#assign procSort_defaultText=''>
				<procSort
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (procSort_defaultValue)?? &&(procSort_defaultValue)?has_content>
							defaultValue='${(procSort_defaultValue!)?string}'
						</#if>
						<#if (procSort_defaultText)?? &&(procSort_defaultText)?has_content>
							defaultText='${(procSort_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">执行顺序</procSort>
				<#assign isRef = false >
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="200">备注</meno>
				<#assign isRef = false >
				<#assign batchUnitID_defaultValue=''>
						 						<#assign batchUnitID_defaultValue=''>
				<#assign batchUnitID_defaultText=''>
				<batchUnitID
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">批控UnitID</batchUnitID>
				<#assign isRef = false >
				<#assign formulaId_id_defaultValue=''>
												<#assign formulaId_id_defaultValue=''>
				<#if (formulaId_id_defaultValue!)?string=="currentUser">
					<#assign formulaId_id_defaultValue='${staffJson!}'>
				<#elseif (formulaId_id_defaultValue!)?string=="currentPost">
					<#assign formulaId_id_defaultValue='${postJson!}'>
				<#elseif (formulaId_id_defaultValue!)?string=="currentDepart">
					<#assign formulaId_id_defaultValue='${deptJson!}'>
				<#elseif (formulaId_id_defaultValue!)?string=="currentComp">
					<#assign formulaId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formulaId_id_defaultText=''>
				<formulaId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcess_dg1487242802285Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcess_dg1487242802285Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formula/formulaForSuitLine.action','dg1487242802285formulaId.id','${getText("RM.viewtitle.randon1514372721087")}',sPTGridID,nRow,sFieldName,FormulaProcess_dg1487242802285Widget,null,false,false,'','RM_7.5.0.0_formula_formulaForSuitLine')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</formulaId.id>
				<#assign isRef = false >
				<#assign persistMode_defaultValue=''>
						 						<#assign persistMode_defaultValue=''>
				<#assign persistMode_defaultText=''>
				<persistMode.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('RM_persistMode')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (persistMode_defaultValue)?? &&(persistMode_defaultValue)?has_content>
							defaultValue='${(persistMode_defaultValue!)?string}'
						</#if>
						<#if (persistMode_defaultText)?? &&(persistMode_defaultText)?has_content>
							defaultText='${(persistMode_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">接续方式</persistMode.id>
				<#assign isRef = false >
				<#assign transTime_defaultValue=''>
						 						<#assign transTime_defaultValue=''>
				<#assign transTime_defaultText=''>
				<transTime
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaProcess_dg1487242802285Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (transTime_defaultValue)?? &&(transTime_defaultValue)?has_content>
							defaultValue='${(transTime_defaultValue!)?string}'
						</#if>
						<#if (transTime_defaultText)?? &&(transTime_defaultText)?has_content>
							defaultText='${(transTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">工序间隔时间</transTime>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaProcess_dg1487242802285Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.processType.id)!}</c>
					<c>${(row.formulaId.id)!}</c>
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
