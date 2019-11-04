<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("MESBasic_1_container_PropertyTags", "MESBasic_1_container_newContainerEditdg1551701917640", "DATAGRID", "propertyTags")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"  MultiSelect="checkbox"  dgName="dg1551701917640" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<property.id IsHiddenField="true"></property.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemSelfList.action','dg1551701917640property.code','${getText("MESBasic.viewtitle.radion1421223012419")}',sPTGridID,nRow,sFieldName,PropertyTags_dg1551701917640Widget,null,false,false,'','MESBasic_1_itemManage_itemSelfList')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (property_code_defaultValue)?? &&(property_code_defaultValue)?has_content>
							defaultValue='${(property_code_defaultValue!)?string}'
						</#if>
						<#if (property_code_defaultText)?? &&(property_code_defaultText)?has_content>
							defaultText='${(property_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点编码</property.code>
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
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">测点名称</property.itemName>
				<#assign isRef = false >
				<#assign property_tagType_defaultValue=''>
												<#assign property_tagType_defaultValue=''>
				<#if (property_tagType_defaultValue!)?string=="currentUser">
					<#assign property_tagType_defaultValue='${staffJson!}'>
				<#elseif (property_tagType_defaultValue!)?string=="currentPost">
					<#assign property_tagType_defaultValue='${postJson!}'>
				<#elseif (property_tagType_defaultValue!)?string=="currentDepart">
					<#assign property_tagType_defaultValue='${deptJson!}'>
				<#elseif (property_tagType_defaultValue!)?string=="currentComp">
					<#assign property_tagType_defaultValue='${compJson!}'>
				</#if>
				<#assign property_tagType_defaultText=''>
				<property.tagType.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRefForContainer.action','dg1551701917640property.tagType','${getText("MESBasic.viewtitle.randon1422422463756")}',sPTGridID,nRow,sFieldName,PropertyTags_dg1551701917640Widget,null,false,false,'','MESBasic_1_itemManage_itemRefForContainer')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('TAG_TYPE')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (property_tagType_defaultValue)?? &&(property_tagType_defaultValue)?has_content>
							defaultValue='${(property_tagType_defaultValue!)?string}'
						</#if>
						<#if (property_tagType_defaultText)?? &&(property_tagType_defaultText)?has_content>
							defaultText='${(property_tagType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">类型</property.tagType.id>
				<#assign isRef = false >
				<#assign property_itemClass_defaultValue=''>
												<#assign property_itemClass_defaultValue=''>
				<#if (property_itemClass_defaultValue!)?string=="currentUser">
					<#assign property_itemClass_defaultValue='${staffJson!}'>
				<#elseif (property_itemClass_defaultValue!)?string=="currentPost">
					<#assign property_itemClass_defaultValue='${postJson!}'>
				<#elseif (property_itemClass_defaultValue!)?string=="currentDepart">
					<#assign property_itemClass_defaultValue='${deptJson!}'>
				<#elseif (property_itemClass_defaultValue!)?string=="currentComp">
					<#assign property_itemClass_defaultValue='${compJson!}'>
				</#if>
				<#assign property_itemClass_defaultText=''>
				<property.itemClass.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRefForContainer.action','dg1551701917640property.itemClass','${getText("MESBasic.viewtitle.randon1422422463756")}',sPTGridID,nRow,sFieldName,PropertyTags_dg1551701917640Widget,null,false,false,'','MESBasic_1_itemManage_itemRefForContainer')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (property_itemClass_defaultValue)?? &&(property_itemClass_defaultValue)?has_content>
							defaultValue='${(property_itemClass_defaultValue!)?string}'
						</#if>
						<#if (property_itemClass_defaultText)?? &&(property_itemClass_defaultText)?has_content>
							defaultText='${(property_itemClass_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">位号属性</property.itemClass.id>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemSelfList.action','dg1551701917640property.itemNumber','${getText("MESBasic.viewtitle.radion1421223012419")}',sPTGridID,nRow,sFieldName,PropertyTags_dg1551701917640Widget,null,false,false,'','MESBasic_1_itemManage_itemSelfList')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">生产位号</property.itemNumber>
				<#assign isRef = false >
				<#assign primary_defaultValue=''>
						 						<#assign primary_defaultValue=''>
				<#assign primary_defaultText=''>
				<primary
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">主计量</primary>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign customPropViewMappings = getShowCustomProps("MESBasic_1_container_PropertyTags", "MESBasic_1_container_newContainerEditdg1551701917640", "DATAGRID", "propertyTags")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1551701917640Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1551701917640${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',PropertyTags_dg1551701917640Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="PropertyTags_dg1551701917640Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(PropertyTags_dg1551701917640Widget,'PropertyTags_dg1551701917640Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(PropertyTags_dg1551701917640Widget,'PropertyTags_dg1551701917640Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="PropertyTags_dg1551701917640Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("MESBasic_1_container_PropertyTags", "MESBasic_1_container_newContainerEditdg1551701917640", "DATAGRID", "propertyTags")>
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
