<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskProcess", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489731937175", "DATAGRID", "produceTaskProcess")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489731937175" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/processType/processType/processTypeRef.action','dg1489731937175processType.name','${getText("RM.viewtitle.randon1487220867598")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1489731937175Widget,null,false,false,'','RM_7.5.0.0_processType_processTypeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign isFirstProcess_defaultValue=''>
						 						<#assign isFirstProcess_defaultValue=''>
				<#assign isFirstProcess_defaultText=''>
				<isFirstProcess
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">末道工序</isLastProcess>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factoryChoiceRef.action','dg1489731937175factoryId.name','${getText("MESBasic.viewtitle.randon1490322790398")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1489731937175Widget,null,false,false,'','MESBasic_1_factoryModel_factoryChoiceRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
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
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ProduceTaskProcess_dg1489731937175Widget.evalCustomFunction(nRow,sFieldName,'checkRatioChange()');"
				    
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
				<#assign beforeRatio_defaultValue=''>
						 						<#assign beforeRatio_defaultValue=''>
				<#assign beforeRatio_defaultText=''>
				<beforeRatio
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">前投料比例(%)</beforeRatio>
				<#assign isRef = false >
				<#assign exeOrder_defaultValue=''>
						 						<#assign exeOrder_defaultValue=''>
				<#assign exeOrder_defaultText=''>
				<exeOrder
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						 dataType="float" decLength="0"
						<#if (exeOrder_defaultValue)?? &&(exeOrder_defaultValue)?has_content>
							defaultValue='${(exeOrder_defaultValue!)?string}'
						</#if>
						<#if (exeOrder_defaultText)?? &&(exeOrder_defaultText)?has_content>
							defaultText='${(exeOrder_defaultText!)?string}'
						</#if>
						
					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">执行顺序</exeOrder>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskProcess", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489731937175", "DATAGRID", "produceTaskProcess")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1489731937175${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',ProduceTaskProcess_dg1489731937175Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(ProduceTaskProcess_dg1489731937175Widget,'ProduceTaskProcess_dg1489731937175Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(ProduceTaskProcess_dg1489731937175Widget,'ProduceTaskProcess_dg1489731937175Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskProcess_dg1489731937175Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processReference.action','dg1489731937175formularProcess.id','${getText("RM.viewtitle.randon1488596828660")}',sPTGridID,nRow,sFieldName,ProduceTaskProcess_dg1489731937175Widget,null,false,false,'','RM_7.5.0.0_formula_processReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskProcess_dg1489731937175Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">配方工序ID</formularProcess.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProduceTaskProcess_dg1489731937175Widget._DT._autoAddNewRow(nRow)" >
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskProcess", "WOM_7.5.0.0_produceTask_makeTaskEditdg1489731937175", "DATAGRID", "produceTaskProcess")>
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
