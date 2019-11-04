<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_putInMaterial_PutInMaterialPart", "WOM_7.5.0.0_putInMaterial_putinEditdg1490605831075", "DATAGRID", "putInMaterialPart")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1490605831075" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<proBatch.id IsHiddenField="true"></proBatch.id>
				<wareID.id IsHiddenField="true"></wareID.id>
				<storeID.id IsHiddenField="true"></storeID.id>
				<formluActive.id IsHiddenField="true"></formluActive.id>
				<taskActiveId.id IsHiddenField="true"></taskActiveId.id>
				<factoryId.id IsHiddenField="true"></factoryId.id>
				<taskProcessId.id IsHiddenField="true"></taskProcessId.id>
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
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout_kc.action','dg1490605831075productId.productCode','${getText("MESBasic.viewtitle.randon1478746948423")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,'productCallBack(obj)',false,false,'','MESBasic_1_product_refProductLayout_kc')"
								onKeyUp="WOM.putInMaterial.putInMaterial.putinEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':PutInMaterialPart_dg1490605831075Widget,
										'sGridName':'PutInMaterialPart_dg1490605831075Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/product/product/refProductLayout_kc.action',
										'displayfieldname':'productCode',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'WOM.putInMaterial.putInMaterial.putinEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'WOM.putInMaterial.putInMaterial.putinEdit._querycustomFunc(\'dg1490605831075productId.productCode\'.replace(/\./g, \'_\'))'
										,'customCallBack' : 'productCallBack(obj)'
									})"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料编码</productId.productCode>
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
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign productId_id_defaultValue=''>
												<#assign productId_id_defaultValue=''>
				<#if (productId_id_defaultValue!)?string=="currentUser">
					<#assign productId_id_defaultValue='${staffJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentPost">
					<#assign productId_id_defaultValue='${postJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentDepart">
					<#assign productId_id_defaultValue='${deptJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentComp">
					<#assign productId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_id_defaultText=''>
				<productId.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</productId.id>
				<#assign isRef = false >
				<#assign proBatch_batchText_defaultValue=''>
												<#assign proBatch_batchText_defaultValue=''>
				<#if (proBatch_batchText_defaultValue!)?string=="currentUser">
					<#assign proBatch_batchText_defaultValue='${staffJson!}'>
				<#elseif (proBatch_batchText_defaultValue!)?string=="currentPost">
					<#assign proBatch_batchText_defaultValue='${postJson!}'>
				<#elseif (proBatch_batchText_defaultValue!)?string=="currentDepart">
					<#assign proBatch_batchText_defaultValue='${deptJson!}'>
				<#elseif (proBatch_batchText_defaultValue!)?string=="currentComp">
					<#assign proBatch_batchText_defaultValue='${compJson!}'>
				</#if>
				<#assign proBatch_batchText_defaultText=''>
				<proBatch.batchText
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/batchNumOneRef.action','dg1490605831075proBatch.batchText','${getText("WOM.viewtitle.randon1495109507430")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,'batchCallback(obj)',false,false,'','WOM_7.5.0.0_standingcropRef_batchNumOneRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (proBatch_batchText_defaultValue)?? &&(proBatch_batchText_defaultValue)?has_content>
							defaultValue='${(proBatch_batchText_defaultValue!)?string}'
						</#if>
						<#if (proBatch_batchText_defaultText)?? &&(proBatch_batchText_defaultText)?has_content>
							defaultText='${(proBatch_batchText_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料批号</proBatch.batchText>
				<#assign isRef = false >
				<#assign proBatch_id_defaultValue=''>
												<#assign proBatch_id_defaultValue=''>
				<#if (proBatch_id_defaultValue!)?string=="currentUser">
					<#assign proBatch_id_defaultValue='${staffJson!}'>
				<#elseif (proBatch_id_defaultValue!)?string=="currentPost">
					<#assign proBatch_id_defaultValue='${postJson!}'>
				<#elseif (proBatch_id_defaultValue!)?string=="currentDepart">
					<#assign proBatch_id_defaultValue='${deptJson!}'>
				<#elseif (proBatch_id_defaultValue!)?string=="currentComp">
					<#assign proBatch_id_defaultValue='${compJson!}'>
				</#if>
				<#assign proBatch_id_defaultText=''>
				<proBatch.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</proBatch.id>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign wareID_wareCode_defaultValue=''>
												<#assign wareID_wareCode_defaultValue=''>
				<#if (wareID_wareCode_defaultValue!)?string=="currentUser">
					<#assign wareID_wareCode_defaultValue='${staffJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentPost">
					<#assign wareID_wareCode_defaultValue='${postJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentDepart">
					<#assign wareID_wareCode_defaultValue='${deptJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentComp">
					<#assign wareID_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_wareCode_defaultText=''>
				<wareID.wareCode
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRefStore.action','dg1490605831075wareID.wareCode','${getText("MESBasic.viewtitle.randon1484032238590")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,'wareChange(obj)',false,false,'','MESBasic_1_wareMan_wareRefStore')"
								onKeyUp="WOM.putInMaterial.putInMaterial.putinEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':PutInMaterialPart_dg1490605831075Widget,
										'sGridName':'PutInMaterialPart_dg1490605831075Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/wareMan/ware/wareRefStore.action',
										'displayfieldname':'wareCode',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'WOM.putInMaterial.putInMaterial.putinEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'WOM.putInMaterial.putInMaterial.putinEdit._querycustomFunc(\'dg1490605831075wareID.wareCode\'.replace(/\./g, \'_\'))'
										,'customCallBack' : 'wareChange(obj)'
									})"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (wareID_wareCode_defaultValue)?? &&(wareID_wareCode_defaultValue)?has_content>
							defaultValue='${(wareID_wareCode_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareCode_defaultText)?? &&(wareID_wareCode_defaultText)?has_content>
							defaultText='${(wareID_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库编码</wareID.wareCode>
				<#assign isRef = false >
				<#assign wareID_wareName_defaultValue=''>
												<#assign wareID_wareName_defaultValue=''>
				<#if (wareID_wareName_defaultValue!)?string=="currentUser">
					<#assign wareID_wareName_defaultValue='${staffJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentPost">
					<#assign wareID_wareName_defaultValue='${postJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentDepart">
					<#assign wareID_wareName_defaultValue='${deptJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentComp">
					<#assign wareID_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_wareName_defaultText=''>
				<wareID.wareName
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (wareID_wareName_defaultValue)?? &&(wareID_wareName_defaultValue)?has_content>
							defaultValue='${(wareID_wareName_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareName_defaultText)?? &&(wareID_wareName_defaultText)?has_content>
							defaultText='${(wareID_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库名称</wareID.wareName>
				<#assign isRef = false >
				<#assign wareID_id_defaultValue=''>
												<#assign wareID_id_defaultValue=''>
				<#if (wareID_id_defaultValue!)?string=="currentUser">
					<#assign wareID_id_defaultValue='${staffJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentPost">
					<#assign wareID_id_defaultValue='${postJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentDepart">
					<#assign wareID_id_defaultValue='${deptJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentComp">
					<#assign wareID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_id_defaultText=''>
				<wareID.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</wareID.id>
				<#assign isRef = false >
				<#assign wareID_cargoStatue_defaultValue=''>
												<#assign wareID_cargoStatue_defaultValue=''>
				<#if (wareID_cargoStatue_defaultValue!)?string=="currentUser">
					<#assign wareID_cargoStatue_defaultValue='${staffJson!}'>
				<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentPost">
					<#assign wareID_cargoStatue_defaultValue='${postJson!}'>
				<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentDepart">
					<#assign wareID_cargoStatue_defaultValue='${deptJson!}'>
				<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentComp">
					<#assign wareID_cargoStatue_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_cargoStatue_defaultText=''>
				<wareID.cargoStatue.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (wareID_cargoStatue_defaultValue)?? &&(wareID_cargoStatue_defaultValue)?has_content>
							defaultValue='${(wareID_cargoStatue_defaultValue!)?string}'
						</#if>
						<#if (wareID_cargoStatue_defaultText)?? &&(wareID_cargoStatue_defaultText)?has_content>
							defaultText='${(wareID_cargoStatue_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">货位状态</wareID.cargoStatue.id>
				<#assign isRef = false >
				<#assign storeID_placeSetCode_defaultValue=''>
												<#assign storeID_placeSetCode_defaultValue=''>
				<#if (storeID_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign storeID_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign storeID_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign storeID_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign storeID_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_placeSetCode_defaultText=''>
				<storeID.placeSetCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1490605831075storeID.placeSetCode','${getText("MESBasic.viewtitle.randon1489735291062")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (storeID_placeSetCode_defaultValue)?? &&(storeID_placeSetCode_defaultValue)?has_content>
							defaultValue='${(storeID_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (storeID_placeSetCode_defaultText)?? &&(storeID_placeSetCode_defaultText)?has_content>
							defaultText='${(storeID_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位编码</storeID.placeSetCode>
				<#assign isRef = false >
				<#assign storeID_placeSetName_defaultValue=''>
												<#assign storeID_placeSetName_defaultValue=''>
				<#if (storeID_placeSetName_defaultValue!)?string=="currentUser">
					<#assign storeID_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentPost">
					<#assign storeID_placeSetName_defaultValue='${postJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign storeID_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentComp">
					<#assign storeID_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_placeSetName_defaultText=''>
				<storeID.placeSetName
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (storeID_placeSetName_defaultValue)?? &&(storeID_placeSetName_defaultValue)?has_content>
							defaultValue='${(storeID_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (storeID_placeSetName_defaultText)?? &&(storeID_placeSetName_defaultText)?has_content>
							defaultText='${(storeID_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">货位名称</storeID.placeSetName>
				<#assign isRef = false >
				<#assign storeID_id_defaultValue=''>
												<#assign storeID_id_defaultValue=''>
				<#if (storeID_id_defaultValue!)?string=="currentUser">
					<#assign storeID_id_defaultValue='${staffJson!}'>
				<#elseif (storeID_id_defaultValue!)?string=="currentPost">
					<#assign storeID_id_defaultValue='${postJson!}'>
				<#elseif (storeID_id_defaultValue!)?string=="currentDepart">
					<#assign storeID_id_defaultValue='${deptJson!}'>
				<#elseif (storeID_id_defaultValue!)?string=="currentComp">
					<#assign storeID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_id_defaultText=''>
				<storeID.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</storeID.id>
				<#assign isRef = false >
				<#assign formluActive_name_defaultValue=''>
												<#assign formluActive_name_defaultValue=''>
				<#if (formluActive_name_defaultValue!)?string=="currentUser">
					<#assign formluActive_name_defaultValue='${staffJson!}'>
				<#elseif (formluActive_name_defaultValue!)?string=="currentPost">
					<#assign formluActive_name_defaultValue='${postJson!}'>
				<#elseif (formluActive_name_defaultValue!)?string=="currentDepart">
					<#assign formluActive_name_defaultValue='${deptJson!}'>
				<#elseif (formluActive_name_defaultValue!)?string=="currentComp">
					<#assign formluActive_name_defaultValue='${compJson!}'>
				</#if>
				<#assign formluActive_name_defaultText=''>
				<formluActive.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeRef.action','dg1490605831075formluActive.name','${getText("RM.viewtitle.randon1489564694469")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,null,false,false,'','RM_7.5.0.0_formula_activeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动名称</formluActive.name>
				<#assign isRef = false >
				<#assign formluActive_id_defaultValue=''>
												<#assign formluActive_id_defaultValue=''>
				<#if (formluActive_id_defaultValue!)?string=="currentUser">
					<#assign formluActive_id_defaultValue='${staffJson!}'>
				<#elseif (formluActive_id_defaultValue!)?string=="currentPost">
					<#assign formluActive_id_defaultValue='${postJson!}'>
				<#elseif (formluActive_id_defaultValue!)?string=="currentDepart">
					<#assign formluActive_id_defaultValue='${deptJson!}'>
				<#elseif (formluActive_id_defaultValue!)?string=="currentComp">
					<#assign formluActive_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formluActive_id_defaultText=''>
				<formluActive.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeCheckRef.action','dg1490605831075formluActive.id','${getText("RM.viewtitle.randon1497922173328")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,null,false,false,'','RM_7.5.0.0_formula_activeCheckRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</formluActive.id>
				<#assign isRef = false >
				<#assign taskActiveId_name_defaultValue=''>
												<#assign taskActiveId_name_defaultValue=''>
				<#if (taskActiveId_name_defaultValue!)?string=="currentUser">
					<#assign taskActiveId_name_defaultValue='${staffJson!}'>
				<#elseif (taskActiveId_name_defaultValue!)?string=="currentPost">
					<#assign taskActiveId_name_defaultValue='${postJson!}'>
				<#elseif (taskActiveId_name_defaultValue!)?string=="currentDepart">
					<#assign taskActiveId_name_defaultValue='${deptJson!}'>
				<#elseif (taskActiveId_name_defaultValue!)?string=="currentComp">
					<#assign taskActiveId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiveId_name_defaultText=''>
				<taskActiveId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTaskActive/taskActiveRef.action','dg1490605831075taskActiveId.name','${getText("WOM.viewtitle.randon1490685335088")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,'taskActiveCallBack(obj)',false,false,'','WOM_7.5.0.0_produceTask_taskActiveRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动名称</taskActiveId.name>
				<#assign isRef = false >
				<#assign taskActiveId_id_defaultValue=''>
												<#assign taskActiveId_id_defaultValue=''>
				<#if (taskActiveId_id_defaultValue!)?string=="currentUser">
					<#assign taskActiveId_id_defaultValue='${staffJson!}'>
				<#elseif (taskActiveId_id_defaultValue!)?string=="currentPost">
					<#assign taskActiveId_id_defaultValue='${postJson!}'>
				<#elseif (taskActiveId_id_defaultValue!)?string=="currentDepart">
					<#assign taskActiveId_id_defaultValue='${deptJson!}'>
				<#elseif (taskActiveId_id_defaultValue!)?string=="currentComp">
					<#assign taskActiveId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiveId_id_defaultText=''>
				<taskActiveId.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</taskActiveId.id>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factroyRef1.action','dg1490605831075factoryId.name','${getText("MESBasic.viewtitle.radion1419491307826")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,null,false,false,'','MESBasic_1_factoryModel_factroyRef1')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">工作单元</factoryId.name>
				<#assign isRef = false >
				<#assign factoryId_id_defaultValue=''>
												<#assign factoryId_id_defaultValue=''>
				<#if (factoryId_id_defaultValue!)?string=="currentUser">
					<#assign factoryId_id_defaultValue='${staffJson!}'>
				<#elseif (factoryId_id_defaultValue!)?string=="currentPost">
					<#assign factoryId_id_defaultValue='${postJson!}'>
				<#elseif (factoryId_id_defaultValue!)?string=="currentDepart">
					<#assign factoryId_id_defaultValue='${deptJson!}'>
				<#elseif (factoryId_id_defaultValue!)?string=="currentComp">
					<#assign factoryId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign factoryId_id_defaultText=''>
				<factoryId.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</factoryId.id>
				<#assign isRef = false >
				<#assign taskProcessId_name_defaultValue=''>
												<#assign taskProcessId_name_defaultValue=''>
				<#if (taskProcessId_name_defaultValue!)?string=="currentUser">
					<#assign taskProcessId_name_defaultValue='${staffJson!}'>
				<#elseif (taskProcessId_name_defaultValue!)?string=="currentPost">
					<#assign taskProcessId_name_defaultValue='${postJson!}'>
				<#elseif (taskProcessId_name_defaultValue!)?string=="currentDepart">
					<#assign taskProcessId_name_defaultValue='${deptJson!}'>
				<#elseif (taskProcessId_name_defaultValue!)?string=="currentComp">
					<#assign taskProcessId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessId_name_defaultText=''>
				<taskProcessId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTaskProcess/taskProcessRef.action','dg1490605831075taskProcessId.name','${getText("WOM.viewtitle.randon1490685207348")}',sPTGridID,nRow,sFieldName,PutInMaterialPart_dg1490605831075Widget,null,false,false,'','WOM_7.5.0.0_produceTask_taskProcessRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskProcessId_name_defaultValue)?? &&(taskProcessId_name_defaultValue)?has_content>
							defaultValue='${(taskProcessId_name_defaultValue!)?string}'
						</#if>
						<#if (taskProcessId_name_defaultText)?? &&(taskProcessId_name_defaultText)?has_content>
							defaultText='${(taskProcessId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">工序名称</taskProcessId.name>
				<#assign isRef = false >
				<#assign taskProcessId_id_defaultValue=''>
												<#assign taskProcessId_id_defaultValue=''>
				<#if (taskProcessId_id_defaultValue!)?string=="currentUser">
					<#assign taskProcessId_id_defaultValue='${staffJson!}'>
				<#elseif (taskProcessId_id_defaultValue!)?string=="currentPost">
					<#assign taskProcessId_id_defaultValue='${postJson!}'>
				<#elseif (taskProcessId_id_defaultValue!)?string=="currentDepart">
					<#assign taskProcessId_id_defaultValue='${deptJson!}'>
				<#elseif (taskProcessId_id_defaultValue!)?string=="currentComp">
					<#assign taskProcessId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign taskProcessId_id_defaultText=''>
				<taskProcessId.id
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</taskProcessId.id>
				<#assign isRef = false >
				<#assign useNum_defaultValue=''>
						 						<#assign useNum_defaultValue=''>
				<#assign useNum_defaultText=''>
				<useNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (useNum_defaultValue)?? &&(useNum_defaultValue)?has_content>
							defaultValue='${(useNum_defaultValue!)?string}'
						</#if>
						<#if (useNum_defaultText)?? &&(useNum_defaultText)?has_content>
							defaultText='${(useNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">投料数量</useNum>
				<#assign isRef = false >
				<#assign lossNum_defaultValue=''>
						 						<#assign lossNum_defaultValue=''>
				<#assign lossNum_defaultText=''>
				<lossNum
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (lossNum_defaultValue)?? &&(lossNum_defaultValue)?has_content>
							defaultValue='${(lossNum_defaultValue!)?string}'
						</#if>
						<#if (lossNum_defaultText)?? &&(lossNum_defaultText)?has_content>
							defaultText='${(lossNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">损耗数量</lossNum>
				<#assign isRef = false >
				<#assign putinDate_defaultValue='currentTime'>
						 				<#assign putinDate_defaultText=''>
					<#if (putinDate_defaultValue)?? &&(putinDate_defaultValue)?has_content>
							<#assign putinDate_defaultValue  = getDefaultDateTime(putinDate_defaultValue!)?datetime>
					</#if>
				<putinDate
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(PutInMaterialPart_dg1490605831075Widget,'PutInMaterialPart_dg1490605831075Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(PutInMaterialPart_dg1490605831075Widget,'PutInMaterialPart_dg1490605831075Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (putinDate_defaultValue)?? &&(putinDate_defaultValue)?has_content>
							defaultValue='${(putinDate_defaultValue!)?string}'
						</#if>
						<#if (putinDate_defaultText)?? &&(putinDate_defaultText)?has_content>
							defaultText='${(putinDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">投料开始时间</putinDate>
				<#assign isRef = false >
				<#assign putinEndDate_defaultValue=''>
						 						<#assign putinEndDate_defaultValue=''>
				<#assign putinEndDate_defaultText=''>
					<#if (putinEndDate_defaultValue)?? &&(putinEndDate_defaultValue)?has_content>
							<#assign putinEndDate_defaultValue  = getDefaultDateTime(putinEndDate_defaultValue!)?datetime>
					</#if>
				<putinEndDate
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(PutInMaterialPart_dg1490605831075Widget,'PutInMaterialPart_dg1490605831075Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(PutInMaterialPart_dg1490605831075Widget,'PutInMaterialPart_dg1490605831075Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (putinEndDate_defaultValue)?? &&(putinEndDate_defaultValue)?has_content>
							defaultValue='${(putinEndDate_defaultValue!)?string}'
						</#if>
						<#if (putinEndDate_defaultText)?? &&(putinEndDate_defaultText)?has_content>
							defaultText='${(putinEndDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">投料结束时间</putinEndDate>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_putInMaterial_PutInMaterialPart", "WOM_7.5.0.0_putInMaterial_putinEditdg1490605831075", "DATAGRID", "putInMaterialPart")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(PutInMaterialPart_dg1490605831075Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1490605831075${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',PutInMaterialPart_dg1490605831075Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(PutInMaterialPart_dg1490605831075Widget,'PutInMaterialPart_dg1490605831075Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(PutInMaterialPart_dg1490605831075Widget,'PutInMaterialPart_dg1490605831075Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
					sort="false"  onPropertyChange="PutInMaterialPart_dg1490605831075Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="PutInMaterialPart_dg1490605831075Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.proBatch.id)!}</c>
					<c>${(row.wareID.id)!}</c>
					<c>${(row.storeID.id)!}</c>
					<c>${(row.formluActive.id)!}</c>
					<c>${(row.taskActiveId.id)!}</c>
					<c>${(row.factoryId.id)!}</c>
					<c>${(row.taskProcessId.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_putInMaterial_PutInMaterialPart", "WOM_7.5.0.0_putInMaterial_putinEditdg1490605831075", "DATAGRID", "putInMaterialPart")>
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
