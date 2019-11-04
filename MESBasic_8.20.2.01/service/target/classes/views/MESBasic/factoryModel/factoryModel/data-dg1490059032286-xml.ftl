<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"  MultiSelect="checkbox"  dgName="dg1490059032286" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<ware.id IsHiddenField="true"></ware.id>
				<store.id IsHiddenField="true"></store.id>
				<product.id IsHiddenField="true"></product.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign ware_wareCode_defaultValue=''>
												<#assign ware_wareCode_defaultValue=''>
				<#if (ware_wareCode_defaultValue!)?string=="currentUser">
					<#assign ware_wareCode_defaultValue='${staffJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentPost">
					<#assign ware_wareCode_defaultValue='${postJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentDepart">
					<#assign ware_wareCode_defaultValue='${deptJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentComp">
					<#assign ware_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareCode_defaultText=''>
				<ware.wareCode
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjWareStore_dg1490059032286Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjWareStore_dg1490059032286Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1490059032286ware.wareCode','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,ObjWareStore_dg1490059032286Widget,'operatecallback(obj)',false,false,'','MESBasic_1_wareMan_wareRef')"
								onKeyUp="MESBasic.factoryModel.factoryModel.burdenWareEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':ObjWareStore_dg1490059032286Widget,
										'sGridName':'ObjWareStore_dg1490059032286Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/wareMan/ware/wareRef.action',
										'displayfieldname':'wareCode',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFunc(\'dg1490059032286ware.wareCode\'.replace(/\./g, \'_\'))'
										,'customCallBack' : 'operatecallback(obj)'
									})"
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (ware_wareCode_defaultValue)?? &&(ware_wareCode_defaultValue)?has_content>
							defaultValue='${(ware_wareCode_defaultValue!)?string}'
						</#if>
						<#if (ware_wareCode_defaultText)?? &&(ware_wareCode_defaultText)?has_content>
							defaultText='${(ware_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库编码</ware.wareCode>
				<#assign isRef = false >
				<#assign ware_wareName_defaultValue=''>
												<#assign ware_wareName_defaultValue=''>
				<#if (ware_wareName_defaultValue!)?string=="currentUser">
					<#assign ware_wareName_defaultValue='${staffJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentPost">
					<#assign ware_wareName_defaultValue='${postJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentDepart">
					<#assign ware_wareName_defaultValue='${deptJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentComp">
					<#assign ware_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareName_defaultText=''>
				<ware.wareName
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareName_defaultValue)?? &&(ware_wareName_defaultValue)?has_content>
							defaultValue='${(ware_wareName_defaultValue!)?string}'
						</#if>
						<#if (ware_wareName_defaultText)?? &&(ware_wareName_defaultText)?has_content>
							defaultText='${(ware_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库名称</ware.wareName>
				<#assign isRef = false >
				<#assign store_placeSetCode_defaultValue=''>
												<#assign store_placeSetCode_defaultValue=''>
				<#if (store_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign store_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign store_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign store_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign store_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign store_placeSetCode_defaultText=''>
				<store.placeSetCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjWareStore_dg1490059032286Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjWareStore_dg1490059032286Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1490059032286store.placeSetCode','${getText("MESBasic.viewtitle.randon1489735291062")}',sPTGridID,nRow,sFieldName,ObjWareStore_dg1490059032286Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (store_placeSetCode_defaultValue)?? &&(store_placeSetCode_defaultValue)?has_content>
							defaultValue='${(store_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetCode_defaultText)?? &&(store_placeSetCode_defaultText)?has_content>
							defaultText='${(store_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="150">货位编码</store.placeSetCode>
				<#assign isRef = false >
				<#assign store_placeSetName_defaultValue=''>
												<#assign store_placeSetName_defaultValue=''>
				<#if (store_placeSetName_defaultValue!)?string=="currentUser">
					<#assign store_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentPost">
					<#assign store_placeSetName_defaultValue='${postJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign store_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentComp">
					<#assign store_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign store_placeSetName_defaultText=''>
				<store.placeSetName
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (store_placeSetName_defaultValue)?? &&(store_placeSetName_defaultValue)?has_content>
							defaultValue='${(store_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetName_defaultText)?? &&(store_placeSetName_defaultText)?has_content>
							defaultText='${(store_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="150">货位名称</store.placeSetName>
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
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjWareStore_dg1490059032286Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjWareStore_dg1490059032286Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1490059032286product.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ObjWareStore_dg1490059032286Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
								onKeyUp="MESBasic.factoryModel.factoryModel.burdenWareEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':ObjWareStore_dg1490059032286Widget,
										'sGridName':'ObjWareStore_dg1490059032286Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/product/product/productRefNew.action',
										'displayfieldname':'productCode',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.factoryModel.factoryModel.burdenWareEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.factoryModel.factoryModel.burdenWareEdit._querycustomFunc(\'dg1490059032286product.productCode\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
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
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">物品名称</product.productName>
				<#assign isRef = false >
				<#assign ware_cargoStatue_defaultValue=''>
												<#assign ware_cargoStatue_defaultValue=''>
				<#if (ware_cargoStatue_defaultValue!)?string=="currentUser">
					<#assign ware_cargoStatue_defaultValue='${staffJson!}'>
				<#elseif (ware_cargoStatue_defaultValue!)?string=="currentPost">
					<#assign ware_cargoStatue_defaultValue='${postJson!}'>
				<#elseif (ware_cargoStatue_defaultValue!)?string=="currentDepart">
					<#assign ware_cargoStatue_defaultValue='${deptJson!}'>
				<#elseif (ware_cargoStatue_defaultValue!)?string=="currentComp">
					<#assign ware_cargoStatue_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_cargoStatue_defaultText=''>
				<ware.cargoStatue.id
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('storageState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位状态</ware.cargoStatue.id>
				<#assign isRef = false >
				<#assign store_wareId_wareCode_defaultValue=''>
												<#assign store_wareId_wareCode_defaultValue=''>
				<#if (store_wareId_wareCode_defaultValue!)?string=="currentUser">
					<#assign store_wareId_wareCode_defaultValue='${staffJson!}'>
				<#elseif (store_wareId_wareCode_defaultValue!)?string=="currentPost">
					<#assign store_wareId_wareCode_defaultValue='${postJson!}'>
				<#elseif (store_wareId_wareCode_defaultValue!)?string=="currentDepart">
					<#assign store_wareId_wareCode_defaultValue='${deptJson!}'>
				<#elseif (store_wareId_wareCode_defaultValue!)?string=="currentComp">
					<#assign store_wareId_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign store_wareId_wareCode_defaultText=''>
				<store.wareId.wareCode
					sort="false"  onPropertyChange="ObjWareStore_dg1490059032286Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库编码</store.wareId.wareCode>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ObjWareStore_dg1490059032286Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.ware.id)!}</c>
					<c>${(row.store.id)!}</c>
					<c>${(row.product.id)!}</c>
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
