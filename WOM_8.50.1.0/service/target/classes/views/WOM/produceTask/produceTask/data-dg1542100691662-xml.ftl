<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1542100691662" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
					onFocus="CUI.toggleClearBtn_DG_IE(AdjustOrTempHead_dg1542100691662Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(AdjustOrTempHead_dg1542100691662Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTaskProcess/taskProcessExelogRef.action','dg1542100691662processId.name','${getText("WOM.viewtitle.randon1495700893633")}',sPTGridID,nRow,sFieldName,AdjustOrTempHead_dg1542100691662Widget,null,false,false,'','WOM_7.5.0.0_produceTask_taskProcessExelogRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">工序名称</processId.name>
				<#assign isRef = false >
				<#assign activeName_defaultValue=''>
						 						<#assign activeName_defaultValue=''>
				<#assign activeName_defaultText=''>
				<activeName
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (activeName_defaultValue)?? &&(activeName_defaultValue)?has_content>
							defaultValue='${(activeName_defaultValue!)?string}'
						</#if>
						<#if (activeName_defaultText)?? &&(activeName_defaultText)?has_content>
							defaultText='${(activeName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">活动名称</activeName>
				<#assign isRef = false >
				<#assign activeType_defaultValue=''>
						 						<#assign activeType_defaultValue=''>
				<#assign activeType_defaultText=''>
				<activeType.id
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动类型</activeType.id>
				<#assign isRef = false >
				<#assign dataSource_defaultValue=''>
						 						<#assign dataSource_defaultValue=''>
				<#assign dataSource_defaultText=''>
				<dataSource.id
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('womActiveSource')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (dataSource_defaultValue)?? &&(dataSource_defaultValue)?has_content>
							defaultValue='${(dataSource_defaultValue!)?string}'
						</#if>
						<#if (dataSource_defaultText)?? &&(dataSource_defaultText)?has_content>
							defaultText='${(dataSource_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动来源</dataSource.id>
				<#assign isRef = false >
				<#assign isAgile_defaultValue=''>
						 						<#assign isAgile_defaultValue=''>
				<#assign isAgile_defaultText=''>
				<isAgile
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">灵活投料</isAgile>
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
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品编码</product.productCode>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(AdjustOrTempHead_dg1542100691662Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(AdjustOrTempHead_dg1542100691662Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/customRef.action','dg1542100691662product.productName','${getText("MESBasic.viewtitle.randon1506341311049")}',sPTGridID,nRow,sFieldName,AdjustOrTempHead_dg1542100691662Widget,null,false,false,'','MESBasic_1_product_customRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (product_productName_defaultValue)?? &&(product_productName_defaultValue)?has_content>
							defaultValue='${(product_productName_defaultValue!)?string}'
						</#if>
						<#if (product_productName_defaultText)?? &&(product_productName_defaultText)?has_content>
							defaultText='${(product_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品名称</product.productName>
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
					onFocus="CUI.toggleClearBtn_DG_IE(AdjustOrTempHead_dg1542100691662Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(AdjustOrTempHead_dg1542100691662Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/qualityStandard/stand/standRef.action','dg1542100691662qualityStandard.name','${getText("RM.viewtitle.randon1487596068024")}',sPTGridID,nRow,sFieldName,AdjustOrTempHead_dg1542100691662Widget,null,false,false,'','RM_7.5.0.0_qualityStandard_standRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (qualityStandard_name_defaultValue)?? &&(qualityStandard_name_defaultValue)?has_content>
							defaultValue='${(qualityStandard_name_defaultValue!)?string}'
						</#if>
						<#if (qualityStandard_name_defaultText)?? &&(qualityStandard_name_defaultText)?has_content>
							defaultText='${(qualityStandard_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">质量标准</qualityStandard.name>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="AdjustOrTempHead_dg1542100691662Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="AdjustOrTempHead_dg1542100691662Widget._DT._autoAddNewRow(nRow)" >
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
