<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1509359955601" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<processId.id IsHiddenField="true"></processId.id>
				<product.id IsHiddenField="true"></product.id>
				<qualityStandard.id IsHiddenField="true"></qualityStandard.id>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1509359955601Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1509359955601Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processReference.action','dg1509359955601processId.name','${getText("RM.viewtitle.randon1488596828660")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1509359955601Widget,null,false,false,'','RM_7.5.0.0_formula_processReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (processId_name_defaultValue)?? &&(processId_name_defaultValue)?has_content>
							defaultValue='${(processId_name_defaultValue!)?string}'
						</#if>
						<#if (processId_name_defaultText)?? &&(processId_name_defaultText)?has_content>
							defaultText='${(processId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">工序名称</processId.name>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
						style="font-color:0303B3"
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">活动名称</name>
				<#assign isRef = false >
				<#assign activeType_defaultValue=''>
						 						<#assign activeType_defaultValue=''>
				<#assign activeType_defaultText=''>
				<activeType.id
						style="font-color:0303B3"
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
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
					width="60">类型</activeType.id>
				<#assign isRef = false >
				<#assign isAgile_defaultValue=''>
						 						<#assign isAgile_defaultValue=''>
				<#assign isAgile_defaultText=''>
				<isAgile
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isAgile_defaultValue)?? &&(isAgile_defaultValue)?has_content>
							defaultValue='${(isAgile_defaultValue!)?string}'
						</#if>
						<#if (isAgile_defaultText)?? &&(isAgile_defaultText)?has_content>
							defaultText='${(isAgile_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="50">灵活投料</isAgile>
				<#assign isRef = false >
				<#assign product_productCode_defaultValue=''>
												<#assign product_productCode_defaultValue=''>
				<#if (product_productCode_defaultValue!)?string=="currentUser">
					<#assign product_productCode_defaultValue='${staffJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentPost">
					<#assign product_productCode_defaultValue='${postJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
					<#assign product_productCode_defaultValue='${deptJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentComp">
					<#assign product_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productCode_defaultText=''>
				<product.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1509359955601Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1509359955601Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1509359955601product.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1509359955601Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">物料编码</product.productCode>
				<#assign isRef = false >
				<#assign product_productName_defaultValue=''>
												<#assign product_productName_defaultValue=''>
				<#if (product_productName_defaultValue!)?string=="currentUser">
					<#assign product_productName_defaultValue='${staffJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentPost">
					<#assign product_productName_defaultValue='${postJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentDepart">
					<#assign product_productName_defaultValue='${deptJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentComp">
					<#assign product_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productName_defaultText=''>
				<product.productName
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productName_defaultValue)?? &&(product_productName_defaultValue)?has_content>
							defaultValue='${(product_productName_defaultValue!)?string}'
						</#if>
						<#if (product_productName_defaultText)?? &&(product_productName_defaultText)?has_content>
							defaultText='${(product_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料名称</product.productName>
				<#assign isRef = false >
				<#assign product_id_defaultValue=''>
												<#assign product_id_defaultValue=''>
				<#if (product_id_defaultValue!)?string=="currentUser">
					<#assign product_id_defaultValue='${staffJson!}'>
				<#elseif (product_id_defaultValue!)?string=="currentPost">
					<#assign product_id_defaultValue='${postJson!}'>
				<#elseif (product_id_defaultValue!)?string=="currentDepart">
					<#assign product_id_defaultValue='${deptJson!}'>
				<#elseif (product_id_defaultValue!)?string=="currentComp">
					<#assign product_id_defaultValue='${compJson!}'>
				</#if>
				<#assign product_id_defaultText=''>
				<product.id
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</product.id>
				<#assign isRef = false >
				<#assign mobileTerminal_defaultValue='true'>
						 				<#assign mobileTerminal_defaultText=''>
				<mobileTerminal
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (mobileTerminal_defaultValue)?? &&(mobileTerminal_defaultValue)?has_content>
							defaultValue='${(mobileTerminal_defaultValue!)?string}'
						</#if>
						<#if (mobileTerminal_defaultText)?? &&(mobileTerminal_defaultText)?has_content>
							defaultText='${(mobileTerminal_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">移动端执行</mobileTerminal>
				<#assign isRef = false >
				<#assign qualityStandard_name_defaultValue=''>
												<#assign qualityStandard_name_defaultValue=''>
				<#if (qualityStandard_name_defaultValue!)?string=="currentUser">
					<#assign qualityStandard_name_defaultValue='${staffJson!}'>
				<#elseif (qualityStandard_name_defaultValue!)?string=="currentPost">
					<#assign qualityStandard_name_defaultValue='${postJson!}'>
				<#elseif (qualityStandard_name_defaultValue!)?string=="currentDepart">
					<#assign qualityStandard_name_defaultValue='${deptJson!}'>
				<#elseif (qualityStandard_name_defaultValue!)?string=="currentComp">
					<#assign qualityStandard_name_defaultValue='${compJson!}'>
				</#if>
				<#assign qualityStandard_name_defaultText=''>
				<qualityStandard.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1509359955601Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1509359955601Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/qualityStandard/stand/standRef.action','dg1509359955601qualityStandard.name','${getText("RM.viewtitle.randon1487596068024")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1509359955601Widget,null,false,false,'','RM_7.5.0.0_qualityStandard_standRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (qualityStandard_name_defaultValue)?? &&(qualityStandard_name_defaultValue)?has_content>
							defaultValue='${(qualityStandard_name_defaultValue!)?string}'
						</#if>
						<#if (qualityStandard_name_defaultText)?? &&(qualityStandard_name_defaultText)?has_content>
							defaultText='${(qualityStandard_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">质量标准</qualityStandard.name>
				<#assign isRef = false >
				<#assign qualityStandard_id_defaultValue=''>
												<#assign qualityStandard_id_defaultValue=''>
				<#if (qualityStandard_id_defaultValue!)?string=="currentUser">
					<#assign qualityStandard_id_defaultValue='${staffJson!}'>
				<#elseif (qualityStandard_id_defaultValue!)?string=="currentPost">
					<#assign qualityStandard_id_defaultValue='${postJson!}'>
				<#elseif (qualityStandard_id_defaultValue!)?string=="currentDepart">
					<#assign qualityStandard_id_defaultValue='${deptJson!}'>
				<#elseif (qualityStandard_id_defaultValue!)?string=="currentComp">
					<#assign qualityStandard_id_defaultValue='${compJson!}'>
				</#if>
				<#assign qualityStandard_id_defaultText=''>
				<qualityStandard.id
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</qualityStandard.id>
				<#assign isRef = false >
				<#assign isForAdjust_defaultValue=''>
						 						<#assign isForAdjust_defaultValue=''>
				<#assign isForAdjust_defaultText=''>
				<isForAdjust
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isForAdjust_defaultValue)?? &&(isForAdjust_defaultValue)?has_content>
							defaultValue='${(isForAdjust_defaultValue!)?string}'
						</#if>
						<#if (isForAdjust_defaultText)?? &&(isForAdjust_defaultText)?has_content>
							defaultText='${(isForAdjust_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">可用于调整</isForAdjust>
				<#assign isRef = false >
				<#assign isForTemp_defaultValue=''>
						 						<#assign isForTemp_defaultValue=''>
				<#assign isForTemp_defaultText=''>
				<isForTemp
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isForTemp_defaultValue)?? &&(isForTemp_defaultValue)?has_content>
							defaultValue='${(isForTemp_defaultValue!)?string}'
						</#if>
						<#if (isForTemp_defaultText)?? &&(isForTemp_defaultText)?has_content>
							defaultText='${(isForTemp_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">可机动执行</isForTemp>
				<#assign isRef = false >
				<#assign isMoreOther_defaultValue='true'>
						 				<#assign isMoreOther_defaultText=''>
				<isMoreOther
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">是否其它活动</isMoreOther>
				<#assign isRef = false >
				<#assign occurTurn_defaultValue='occurTurn/occurTurn2'>
						 				<#assign occurTurn_defaultText=''>
				<occurTurn.id
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
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
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">发生于</occurTurn.id>
				<#assign isRef = false >
				<#assign isWatchActive_defaultValue=''>
						 						<#assign isWatchActive_defaultValue=''>
				<#assign isWatchActive_defaultText=''>
				<isWatchActive
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">工艺监测</isWatchActive>
				<#assign isRef = false >
				<#assign exeSystem_defaultValue='RMsystem/system2'>
						 				<#assign exeSystem_defaultText=''>
				<exeSystem.id
					sort="true"  onPropertyChange="FormulaProcessActive_dg1509359955601Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
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
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">系统</exeSystem.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.processId.id)!}</c>
					<c>${(row.product.id)!}</c>
					<c>${(row.qualityStandard.id)!}</c>
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
