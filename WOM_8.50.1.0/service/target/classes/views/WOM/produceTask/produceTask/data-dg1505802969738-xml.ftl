<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1505802969738" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<headId.id IsHiddenField="true"></headId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
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
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">物料编码</productId.productCode>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceMaterialSum_dg1505802969738Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceMaterialSum_dg1505802969738Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1505802969738productId.productName','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceMaterialSum_dg1505802969738Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign property_defaultValue=''>
						 						<#assign property_defaultValue=''>
				<#assign property_defaultText=''>
				<property.id
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('RMproperty')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (property_defaultValue)?? &&(property_defaultValue)?has_content>
							defaultValue='${(property_defaultValue!)?string}'
						</#if>
						<#if (property_defaultText)?? &&(property_defaultText)?has_content>
							defaultText='${(property_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">性质</property.id>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="120">计划数量</planNum>
				<#assign isRef = false >
				<#assign productId_productBaseUnit_name_defaultValue=''>
												<#assign productId_productBaseUnit_name_defaultValue=''>
				<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
					<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
					<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
					<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productBaseUnit_name_defaultText=''>
				<productId.productBaseUnit.name
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productBaseUnit_name_defaultValue)?? &&(productId_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(productId_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (productId_productBaseUnit_name_defaultText)?? &&(productId_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(productId_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="60">单位</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (batchNum_defaultValue)?? &&(batchNum_defaultValue)?has_content>
							defaultValue='${(batchNum_defaultValue!)?string}'
						</#if>
						<#if (batchNum_defaultText)?? &&(batchNum_defaultText)?has_content>
							defaultText='${(batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</batchNum>
				<#assign isRef = false >
				<#assign headId_formularId_setProcess_defaultValue=''>
												<#assign headId_formularId_setProcess_defaultValue=''>
				<#if (headId_formularId_setProcess_defaultValue!)?string=="currentUser">
					<#assign headId_formularId_setProcess_defaultValue='${staffJson!}'>
				<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentPost">
					<#assign headId_formularId_setProcess_defaultValue='${postJson!}'>
				<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentDepart">
					<#assign headId_formularId_setProcess_defaultValue='${deptJson!}'>
				<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentComp">
					<#assign headId_formularId_setProcess_defaultValue='${compJson!}'>
				</#if>
				<#assign headId_formularId_setProcess_defaultText=''>
				<headId.formularId.setProcess.id
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1505802969738Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('formulaProperty')>
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
					width="100">配方属性</headId.formularId.setProcess.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProduceMaterialSum_dg1505802969738Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.headId.id)!}</c>
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
