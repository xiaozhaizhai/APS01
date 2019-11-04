<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("MESBasic_1_product_Product", "MESBasic_1_product_productEditnewdg1471522536506", "DATAGRID", "prodLevel.productID||S2BASE_PRODUCT,PRODUCT_ID,S2BASE_PRODLEVEL,PRODLEVEL_PRODUCTID")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1471522536506" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<compareID.id IsHiddenField="true"></compareID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign clevel_defaultValue=''>
						 						<#assign clevel_defaultValue=''>
				<#assign clevel_defaultText=''>
				<clevel
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (clevel_defaultValue)?? &&(clevel_defaultValue)?has_content>
							defaultValue='${(clevel_defaultValue!)?string}'
						</#if>
						<#if (clevel_defaultText)?? &&(clevel_defaultText)?has_content>
							defaultText='${(clevel_defaultText!)?string}'
						</#if>
						
					align="right" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">等级</clevel>
				<#assign isRef = false >
				<#assign corder_defaultValue=''>
						 						<#assign corder_defaultValue=''>
				<#assign corder_defaultText=''>
				<corder
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (corder_defaultValue)?? &&(corder_defaultValue)?has_content>
							defaultValue='${(corder_defaultValue!)?string}'
						</#if>
						<#if (corder_defaultText)?? &&(corder_defaultText)?has_content>
							defaultText='${(corder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">顺序</corder>
				<#assign isRef = false >
				<#assign rejectLvl_defaultValue=''>
						 						<#assign rejectLvl_defaultValue=''>
				<#assign rejectLvl_defaultText=''>
				<rejectLvl
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (rejectLvl_defaultValue)?? &&(rejectLvl_defaultValue)?has_content>
							defaultValue='${(rejectLvl_defaultValue!)?string}'
						</#if>
						<#if (rejectLvl_defaultText)?? &&(rejectLvl_defaultText)?has_content>
							defaultText='${(rejectLvl_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">不合格</rejectLvl>
				<#assign isRef = false >
				<#assign levelMemo_defaultValue=''>
						 						<#assign levelMemo_defaultValue=''>
				<#assign levelMemo_defaultText=''>
				<levelMemo
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (levelMemo_defaultValue)?? &&(levelMemo_defaultValue)?has_content>
							defaultValue='${(levelMemo_defaultValue!)?string}'
						</#if>
						<#if (levelMemo_defaultText)?? &&(levelMemo_defaultText)?has_content>
							defaultText='${(levelMemo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="200">备注</levelMemo>
				<#assign isRef = false >
				<#assign itemChange_defaultValue=''>
						 						<#assign itemChange_defaultValue=''>
				<#assign itemChange_defaultText=''>
				<itemChange
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ProdLevel_dg1471522536506Widget.evalCustomFunction(nRow,sFieldName,'isChange()');"
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (itemChange_defaultValue)?? &&(itemChange_defaultValue)?has_content>
							defaultValue='${(itemChange_defaultValue!)?string}'
						</#if>
						<#if (itemChange_defaultText)?? &&(itemChange_defaultText)?has_content>
							defaultText='${(itemChange_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">变更物品</itemChange>
				<#assign isRef = false >
				<#assign compareID_productCode_defaultValue=''>
												<#assign compareID_productCode_defaultValue=''>
				<#if (compareID_productCode_defaultValue!)?string=="currentUser">
					<#assign compareID_productCode_defaultValue='${staffJson!}'>
				<#elseif (compareID_productCode_defaultValue!)?string=="currentPost">
					<#assign compareID_productCode_defaultValue='${postJson!}'>
				<#elseif (compareID_productCode_defaultValue!)?string=="currentDepart">
					<#assign compareID_productCode_defaultValue='${deptJson!}'>
				<#elseif (compareID_productCode_defaultValue!)?string=="currentComp">
					<#assign compareID_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign compareID_productCode_defaultText=''>
				<compareID.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdLevel_dg1471522536506Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdLevel_dg1471522536506Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout.action','dg1471522536506compareID.productCode','${getText("MESBasic.viewtitle.randon1450085069587")}',sPTGridID,nRow,sFieldName,ProdLevel_dg1471522536506Widget,null,false,false,'','MESBasic_1_product_refProductLayout')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (compareID_productCode_defaultValue)?? &&(compareID_productCode_defaultValue)?has_content>
							defaultValue='${(compareID_productCode_defaultValue!)?string}'
						</#if>
						<#if (compareID_productCode_defaultText)?? &&(compareID_productCode_defaultText)?has_content>
							defaultText='${(compareID_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</compareID.productCode>
				<#assign isRef = false >
				<#assign compareID_productName_defaultValue=''>
												<#assign compareID_productName_defaultValue=''>
				<#if (compareID_productName_defaultValue!)?string=="currentUser">
					<#assign compareID_productName_defaultValue='${staffJson!}'>
				<#elseif (compareID_productName_defaultValue!)?string=="currentPost">
					<#assign compareID_productName_defaultValue='${postJson!}'>
				<#elseif (compareID_productName_defaultValue!)?string=="currentDepart">
					<#assign compareID_productName_defaultValue='${deptJson!}'>
				<#elseif (compareID_productName_defaultValue!)?string=="currentComp">
					<#assign compareID_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign compareID_productName_defaultText=''>
				<compareID.productName
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (compareID_productName_defaultValue)?? &&(compareID_productName_defaultValue)?has_content>
							defaultValue='${(compareID_productName_defaultValue!)?string}'
						</#if>
						<#if (compareID_productName_defaultText)?? &&(compareID_productName_defaultText)?has_content>
							defaultText='${(compareID_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</compareID.productName>
				<#assign isRef = false >
				<#assign isUsed_defaultValue=''>
						 						<#assign isUsed_defaultValue=''>
				<#assign isUsed_defaultText=''>
				<isUsed
					sort="false"  onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">等级引用标志</isUsed>
				<#assign customPropViewMappings = getShowCustomProps("MESBasic_1_product_Product", "MESBasic_1_product_productEditnewdg1471522536506", "DATAGRID", "prodLevel.productID||S2BASE_PRODUCT,PRODUCT_ID,S2BASE_PRODLEVEL,PRODLEVEL_PRODUCTID")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(ProdLevel_dg1471522536506Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(ProdLevel_dg1471522536506Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1471522536506${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',ProdLevel_dg1471522536506Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="ProdLevel_dg1471522536506Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(ProdLevel_dg1471522536506Widget,'ProdLevel_dg1471522536506Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(ProdLevel_dg1471522536506Widget,'ProdLevel_dg1471522536506Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
		<row  onClick="ProdLevel_dg1471522536506Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.compareID.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("MESBasic_1_product_Product", "MESBasic_1_product_productEditnewdg1471522536506", "DATAGRID", "prodLevel.productID||S2BASE_PRODUCT,PRODUCT_ID,S2BASE_PRODLEVEL,PRODLEVEL_PRODUCTID")>
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
