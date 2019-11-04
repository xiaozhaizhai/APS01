<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1416532238441" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<sort IsHiddenField="true"></sort>
				<property.id IsHiddenField="true"></property.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign property_itemNumber_defaultValue=''>
												<#assign property_itemNumber_defaultValue=''>
				<#if (property_itemNumber_defaultValue!)?string=="currentUser">
					<#assign property_itemNumber_defaultValue='${staffJson!}'>
				<#elseif (property_itemNumber_defaultValue!)?string=="currentPost">
					<#assign property_itemNumber_defaultValue='${postJson!}'>
				<#elseif (property_itemNumber_defaultValue!)?string=="currentDepart">
					<#assign property_itemNumber_defaultValue='${deptJson!}'>
				<#elseif (property_itemNumber_defaultValue!)?string=="currentComp">
					<#assign property_itemNumber_defaultValue='${compJson!}'>
				</#if>
				<#assign property_itemNumber_defaultText=''>
				<property.itemNumber
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1416532238441Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1416532238441Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRefForContainer.action','dg1416532238441property.itemNumber','${getText("MESBasic.viewtitle.randon1422422463756")}',sPTGridID,nRow,sFieldName,PropertyTags_dg1416532238441Widget,null,false,false,'','MESBasic_1_itemManage_itemRefForContainer')"
								onKeyUp="MESBasic.container.container.containerEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':PropertyTags_dg1416532238441Widget,
										'sGridName':'PropertyTags_dg1416532238441Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/itemManage/itemSetup/itemRefForContainer.action',
										'displayfieldname':'itemNumber',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.container.container.containerEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.container.container.containerEdit._querycustomFunc(\'dg1416532238441property.itemNumber\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="PropertyTags_dg1416532238441Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (property_itemNumber_defaultValue)?? &&(property_itemNumber_defaultValue)?has_content>
							defaultValue='${(property_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (property_itemNumber_defaultText)?? &&(property_itemNumber_defaultText)?has_content>
							defaultText='${(property_itemNumber_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">位号</property.itemNumber>
				<#assign isRef = false >
				<#assign property_code_defaultValue=''>
												<#assign property_code_defaultValue=''>
				<#if (property_code_defaultValue!)?string=="currentUser">
					<#assign property_code_defaultValue='${staffJson!}'>
				<#elseif (property_code_defaultValue!)?string=="currentPost">
					<#assign property_code_defaultValue='${postJson!}'>
				<#elseif (property_code_defaultValue!)?string=="currentDepart">
					<#assign property_code_defaultValue='${deptJson!}'>
				<#elseif (property_code_defaultValue!)?string=="currentComp">
					<#assign property_code_defaultValue='${compJson!}'>
				</#if>
				<#assign property_code_defaultText=''>
				<property.code
					sort="false"  onPropertyChange="PropertyTags_dg1416532238441Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (property_code_defaultValue)?? &&(property_code_defaultValue)?has_content>
							defaultValue='${(property_code_defaultValue!)?string}'
						</#if>
						<#if (property_code_defaultText)?? &&(property_code_defaultText)?has_content>
							defaultText='${(property_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">测点编码</property.code>
				<#assign isRef = false >
				<#assign property_itemName_defaultValue=''>
												<#assign property_itemName_defaultValue=''>
				<#if (property_itemName_defaultValue!)?string=="currentUser">
					<#assign property_itemName_defaultValue='${staffJson!}'>
				<#elseif (property_itemName_defaultValue!)?string=="currentPost">
					<#assign property_itemName_defaultValue='${postJson!}'>
				<#elseif (property_itemName_defaultValue!)?string=="currentDepart">
					<#assign property_itemName_defaultValue='${deptJson!}'>
				<#elseif (property_itemName_defaultValue!)?string=="currentComp">
					<#assign property_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign property_itemName_defaultText=''>
				<property.itemName
					sort="false"  onPropertyChange="PropertyTags_dg1416532238441Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (property_itemName_defaultValue)?? &&(property_itemName_defaultValue)?has_content>
							defaultValue='${(property_itemName_defaultValue!)?string}'
						</#if>
						<#if (property_itemName_defaultText)?? &&(property_itemName_defaultText)?has_content>
							defaultText='${(property_itemName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">测点名称</property.itemName>
				<#assign isRef = false >
				<#assign property_measureClass_defaultValue=''>
												<#assign property_measureClass_defaultValue=''>
				<#if (property_measureClass_defaultValue!)?string=="currentUser">
					<#assign property_measureClass_defaultValue='${staffJson!}'>
				<#elseif (property_measureClass_defaultValue!)?string=="currentPost">
					<#assign property_measureClass_defaultValue='${postJson!}'>
				<#elseif (property_measureClass_defaultValue!)?string=="currentDepart">
					<#assign property_measureClass_defaultValue='${deptJson!}'>
				<#elseif (property_measureClass_defaultValue!)?string=="currentComp">
					<#assign property_measureClass_defaultValue='${compJson!}'>
				</#if>
				<#assign property_measureClass_defaultText=''>
				<property.measureClass.id
					sort="false"  onPropertyChange="PropertyTags_dg1416532238441Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('ITEM_PROPERTY')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (property_measureClass_defaultValue)?? &&(property_measureClass_defaultValue)?has_content>
							defaultValue='${(property_measureClass_defaultValue!)?string}'
						</#if>
						<#if (property_measureClass_defaultText)?? &&(property_measureClass_defaultText)?has_content>
							defaultText='${(property_measureClass_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">位号属性</property.measureClass.id>
				<#assign isRef = false >
				<#assign primary_defaultValue=''>
						 						<#assign primary_defaultValue=''>
				<#assign primary_defaultText=''>
				<primary
					sort="false"  onPropertyChange="PropertyTags_dg1416532238441Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (primary_defaultValue)?? &&(primary_defaultValue)?has_content>
							defaultValue='${(primary_defaultValue!)?string}'
						</#if>
						<#if (primary_defaultText)?? &&(primary_defaultText)?has_content>
							defaultText='${(primary_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">主计量</primary>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="PropertyTags_dg1416532238441Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.sort)!}</c>
					<c>${(row.property.id)!}</c>
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
