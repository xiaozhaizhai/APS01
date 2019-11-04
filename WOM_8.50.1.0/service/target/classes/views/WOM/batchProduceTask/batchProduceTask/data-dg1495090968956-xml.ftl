<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart", "WOM_7.5.0.0_batchProduceTask_batchTastEditdg1495090968956", "DATAGRID", "batchProdTaskPart")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1495090968956" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<factoryId.id IsHiddenField="true"></factoryId.id>
				<formularId.id IsHiddenField="true"></formularId.id>
				<bulkProduct.id IsHiddenField="true"></bulkProduct.id>
				<bulkBatchNum.id IsHiddenField="true"></bulkBatchNum.id>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout.action','dg1495090968956productId.productCode','${getText("MESBasic.viewtitle.randon1450085069587")}',sPTGridID,nRow,sFieldName,BatchProdTaskPart_dg1495090968956Widget,null,false,false,'','MESBasic_1_product_refProductLayout')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">产品编码</productId.productCode>
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
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">产品名称</productId.productName>
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
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</productId.id>
				<#assign isRef = false >
				<#assign productNum_defaultValue=''>
						 						<#assign productNum_defaultValue=''>
				<#assign productNum_defaultText=''>
				<productNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (productNum_defaultValue)?? &&(productNum_defaultValue)?has_content>
							defaultValue='${(productNum_defaultValue!)?string}'
						</#if>
						<#if (productNum_defaultText)?? &&(productNum_defaultText)?has_content>
							defaultText='${(productNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">生产数量</productNum>
				<#assign isRef = false >
				<#assign productBatchNum_defaultValue=''>
						 						<#assign productBatchNum_defaultValue=''>
				<#assign productBatchNum_defaultText=''>
				<productBatchNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (productBatchNum_defaultValue)?? &&(productBatchNum_defaultValue)?has_content>
							defaultValue='${(productBatchNum_defaultValue!)?string}'
						</#if>
						<#if (productBatchNum_defaultText)?? &&(productBatchNum_defaultText)?has_content>
							defaultText='${(productBatchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">生产批号</productBatchNum>
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
					onFocus="CUI.toggleClearBtn_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action','dg1495090968956factoryId.name','${getText("MESBasic.viewtitle.randon1498043312692")}',sPTGridID,nRow,sFieldName,BatchProdTaskPart_dg1495090968956Widget,null,false,false,'','MESBasic_1_factoryModel_factoryProBatchRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">生产线</factoryId.name>
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
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</factoryId.id>
				<#assign isRef = false >
				<#assign formularId_code_defaultValue=''>
												<#assign formularId_code_defaultValue=''>
				<#if (formularId_code_defaultValue!)?string=="currentUser">
					<#assign formularId_code_defaultValue='${staffJson!}'>
				<#elseif (formularId_code_defaultValue!)?string=="currentPost">
					<#assign formularId_code_defaultValue='${postJson!}'>
				<#elseif (formularId_code_defaultValue!)?string=="currentDepart">
					<#assign formularId_code_defaultValue='${deptJson!}'>
				<#elseif (formularId_code_defaultValue!)?string=="currentComp">
					<#assign formularId_code_defaultValue='${compJson!}'>
				</#if>
				<#assign formularId_code_defaultText=''>
				<formularId.code
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formula/formulaTaskRef.action','dg1495090968956formularId.code','${getText("RM.viewtitle.randon1498047455529")}',sPTGridID,nRow,sFieldName,BatchProdTaskPart_dg1495090968956Widget,'formularCallBack(obj)',false,false,'','RM_7.5.0.0_formula_formulaTaskRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (formularId_code_defaultValue)?? &&(formularId_code_defaultValue)?has_content>
							defaultValue='${(formularId_code_defaultValue!)?string}'
						</#if>
						<#if (formularId_code_defaultText)?? &&(formularId_code_defaultText)?has_content>
							defaultText='${(formularId_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配方编码</formularId.code>
				<#assign isRef = false >
				<#assign formularId_name_defaultValue=''>
												<#assign formularId_name_defaultValue=''>
				<#if (formularId_name_defaultValue!)?string=="currentUser">
					<#assign formularId_name_defaultValue='${staffJson!}'>
				<#elseif (formularId_name_defaultValue!)?string=="currentPost">
					<#assign formularId_name_defaultValue='${postJson!}'>
				<#elseif (formularId_name_defaultValue!)?string=="currentDepart">
					<#assign formularId_name_defaultValue='${deptJson!}'>
				<#elseif (formularId_name_defaultValue!)?string=="currentComp">
					<#assign formularId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign formularId_name_defaultText=''>
				<formularId.name
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (formularId_name_defaultValue)?? &&(formularId_name_defaultValue)?has_content>
							defaultValue='${(formularId_name_defaultValue!)?string}'
						</#if>
						<#if (formularId_name_defaultText)?? &&(formularId_name_defaultText)?has_content>
							defaultText='${(formularId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">配方标识</formularId.name>
				<#assign isRef = false >
				<#assign formularId_id_defaultValue=''>
												<#assign formularId_id_defaultValue=''>
				<#if (formularId_id_defaultValue!)?string=="currentUser">
					<#assign formularId_id_defaultValue='${staffJson!}'>
				<#elseif (formularId_id_defaultValue!)?string=="currentPost">
					<#assign formularId_id_defaultValue='${postJson!}'>
				<#elseif (formularId_id_defaultValue!)?string=="currentDepart">
					<#assign formularId_id_defaultValue='${deptJson!}'>
				<#elseif (formularId_id_defaultValue!)?string=="currentComp">
					<#assign formularId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formularId_id_defaultText=''>
				<formularId.id
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</formularId.id>
				<#assign isRef = false >
				<#assign bulkProduct_productCode_defaultValue=''>
												<#assign bulkProduct_productCode_defaultValue=''>
				<#if (bulkProduct_productCode_defaultValue!)?string=="currentUser">
					<#assign bulkProduct_productCode_defaultValue='${staffJson!}'>
				<#elseif (bulkProduct_productCode_defaultValue!)?string=="currentPost">
					<#assign bulkProduct_productCode_defaultValue='${postJson!}'>
				<#elseif (bulkProduct_productCode_defaultValue!)?string=="currentDepart">
					<#assign bulkProduct_productCode_defaultValue='${deptJson!}'>
				<#elseif (bulkProduct_productCode_defaultValue!)?string=="currentComp">
					<#assign bulkProduct_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign bulkProduct_productCode_defaultText=''>
				<bulkProduct.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout.action','dg1495090968956bulkProduct.productCode','${getText("MESBasic.viewtitle.randon1450085069587")}',sPTGridID,nRow,sFieldName,BatchProdTaskPart_dg1495090968956Widget,null,false,false,'','MESBasic_1_product_refProductLayout')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (bulkProduct_productCode_defaultValue)?? &&(bulkProduct_productCode_defaultValue)?has_content>
							defaultValue='${(bulkProduct_productCode_defaultValue!)?string}'
						</#if>
						<#if (bulkProduct_productCode_defaultText)?? &&(bulkProduct_productCode_defaultText)?has_content>
							defaultText='${(bulkProduct_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">待包装产品编码</bulkProduct.productCode>
				<#assign isRef = false >
				<#assign bulkProduct_productName_defaultValue=''>
												<#assign bulkProduct_productName_defaultValue=''>
				<#if (bulkProduct_productName_defaultValue!)?string=="currentUser">
					<#assign bulkProduct_productName_defaultValue='${staffJson!}'>
				<#elseif (bulkProduct_productName_defaultValue!)?string=="currentPost">
					<#assign bulkProduct_productName_defaultValue='${postJson!}'>
				<#elseif (bulkProduct_productName_defaultValue!)?string=="currentDepart">
					<#assign bulkProduct_productName_defaultValue='${deptJson!}'>
				<#elseif (bulkProduct_productName_defaultValue!)?string=="currentComp">
					<#assign bulkProduct_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign bulkProduct_productName_defaultText=''>
				<bulkProduct.productName
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (bulkProduct_productName_defaultValue)?? &&(bulkProduct_productName_defaultValue)?has_content>
							defaultValue='${(bulkProduct_productName_defaultValue!)?string}'
						</#if>
						<#if (bulkProduct_productName_defaultText)?? &&(bulkProduct_productName_defaultText)?has_content>
							defaultText='${(bulkProduct_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">待包装产品名称</bulkProduct.productName>
				<#assign isRef = false >
				<#assign bulkProduct_id_defaultValue=''>
												<#assign bulkProduct_id_defaultValue=''>
				<#if (bulkProduct_id_defaultValue!)?string=="currentUser">
					<#assign bulkProduct_id_defaultValue='${staffJson!}'>
				<#elseif (bulkProduct_id_defaultValue!)?string=="currentPost">
					<#assign bulkProduct_id_defaultValue='${postJson!}'>
				<#elseif (bulkProduct_id_defaultValue!)?string=="currentDepart">
					<#assign bulkProduct_id_defaultValue='${deptJson!}'>
				<#elseif (bulkProduct_id_defaultValue!)?string=="currentComp">
					<#assign bulkProduct_id_defaultValue='${compJson!}'>
				</#if>
				<#assign bulkProduct_id_defaultText=''>
				<bulkProduct.id
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</bulkProduct.id>
				<#assign isRef = false >
				<#assign bulkBatchNum_batchText_defaultValue=''>
												<#assign bulkBatchNum_batchText_defaultValue=''>
				<#if (bulkBatchNum_batchText_defaultValue!)?string=="currentUser">
					<#assign bulkBatchNum_batchText_defaultValue='${staffJson!}'>
				<#elseif (bulkBatchNum_batchText_defaultValue!)?string=="currentPost">
					<#assign bulkBatchNum_batchText_defaultValue='${postJson!}'>
				<#elseif (bulkBatchNum_batchText_defaultValue!)?string=="currentDepart">
					<#assign bulkBatchNum_batchText_defaultValue='${deptJson!}'>
				<#elseif (bulkBatchNum_batchText_defaultValue!)?string=="currentComp">
					<#assign bulkBatchNum_batchText_defaultValue='${compJson!}'>
				</#if>
				<#assign bulkBatchNum_batchText_defaultText=''>
				<bulkBatchNum.batchText
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/batchNumRef.action','dg1495090968956bulkBatchNum.batchText','${getText("WOM.viewtitle.randon1490065762725")}',sPTGridID,nRow,sFieldName,BatchProdTaskPart_dg1495090968956Widget,null,false,false,'','WOM_7.5.0.0_standingcropRef_batchNumRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (bulkBatchNum_batchText_defaultValue)?? &&(bulkBatchNum_batchText_defaultValue)?has_content>
							defaultValue='${(bulkBatchNum_batchText_defaultValue!)?string}'
						</#if>
						<#if (bulkBatchNum_batchText_defaultText)?? &&(bulkBatchNum_batchText_defaultText)?has_content>
							defaultText='${(bulkBatchNum_batchText_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">待包装批号</bulkBatchNum.batchText>
				<#assign isRef = false >
				<#assign bulkBatchNum_id_defaultValue=''>
												<#assign bulkBatchNum_id_defaultValue=''>
				<#if (bulkBatchNum_id_defaultValue!)?string=="currentUser">
					<#assign bulkBatchNum_id_defaultValue='${staffJson!}'>
				<#elseif (bulkBatchNum_id_defaultValue!)?string=="currentPost">
					<#assign bulkBatchNum_id_defaultValue='${postJson!}'>
				<#elseif (bulkBatchNum_id_defaultValue!)?string=="currentDepart">
					<#assign bulkBatchNum_id_defaultValue='${deptJson!}'>
				<#elseif (bulkBatchNum_id_defaultValue!)?string=="currentComp">
					<#assign bulkBatchNum_id_defaultValue='${compJson!}'>
				</#if>
				<#assign bulkBatchNum_id_defaultText=''>
				<bulkBatchNum.id
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</bulkBatchNum.id>
				<#assign isRef = false >
				<#assign bulkNum_defaultValue=''>
						 						<#assign bulkNum_defaultValue=''>
				<#assign bulkNum_defaultText=''>
				<bulkNum
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (bulkNum_defaultValue)?? &&(bulkNum_defaultValue)?has_content>
							defaultValue='${(bulkNum_defaultValue!)?string}'
						</#if>
						<#if (bulkNum_defaultText)?? &&(bulkNum_defaultText)?has_content>
							defaultText='${(bulkNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">待包装数量</bulkNum>
				<#assign isRef = false >
				<#assign bulkType_defaultValue=''>
						 						<#assign bulkType_defaultValue=''>
				<#assign bulkType_defaultText=''>
				<bulkType.id
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('womPackageType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (bulkType_defaultValue)?? &&(bulkType_defaultValue)?has_content>
							defaultValue='${(bulkType_defaultValue!)?string}'
						</#if>
						<#if (bulkType_defaultText)?? &&(bulkType_defaultText)?has_content>
							defaultText='${(bulkType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">包装类型</bulkType.id>
				<#assign isRef = false >
				<#assign planStartTime_defaultValue='currentTime'>
						 				<#assign planStartTime_defaultText=''>
					<#if (planStartTime_defaultValue)?? &&(planStartTime_defaultValue)?has_content>
							<#assign planStartTime_defaultValue  = getDefaultDateTime(planStartTime_defaultValue!)?datetime>
					</#if>
				<planStartTime
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchProdTaskPart_dg1495090968956Widget,'BatchProdTaskPart_dg1495090968956Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchProdTaskPart_dg1495090968956Widget,'BatchProdTaskPart_dg1495090968956Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (planStartTime_defaultValue)?? &&(planStartTime_defaultValue)?has_content>
							defaultValue='${(planStartTime_defaultValue!)?string}'
						</#if>
						<#if (planStartTime_defaultText)?? &&(planStartTime_defaultText)?has_content>
							defaultText='${(planStartTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">计划开始时间</planStartTime>
				<#assign isRef = false >
				<#assign planEndTime_defaultValue=''>
						 						<#assign planEndTime_defaultValue=''>
				<#assign planEndTime_defaultText=''>
					<#if (planEndTime_defaultValue)?? &&(planEndTime_defaultValue)?has_content>
							<#assign planEndTime_defaultValue  = getDefaultDateTime(planEndTime_defaultValue!)?datetime>
					</#if>
				<planEndTime
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchProdTaskPart_dg1495090968956Widget,'BatchProdTaskPart_dg1495090968956Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchProdTaskPart_dg1495090968956Widget,'BatchProdTaskPart_dg1495090968956Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (planEndTime_defaultValue)?? &&(planEndTime_defaultValue)?has_content>
							defaultValue='${(planEndTime_defaultValue!)?string}'
						</#if>
						<#if (planEndTime_defaultText)?? &&(planEndTime_defaultText)?has_content>
							defaultText='${(planEndTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">计划结束时间</planEndTime>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart", "WOM_7.5.0.0_batchProduceTask_batchTastEditdg1495090968956", "DATAGRID", "batchProdTaskPart")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(BatchProdTaskPart_dg1495090968956Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1495090968956${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',BatchProdTaskPart_dg1495090968956Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(BatchProdTaskPart_dg1495090968956Widget,'BatchProdTaskPart_dg1495090968956Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(BatchProdTaskPart_dg1495090968956Widget,'BatchProdTaskPart_dg1495090968956Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
					sort="false"  onPropertyChange="BatchProdTaskPart_dg1495090968956Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="150">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="BatchProdTaskPart_dg1495090968956Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.factoryId.id)!}</c>
					<c>${(row.formularId.id)!}</c>
					<c>${(row.bulkProduct.id)!}</c>
					<c>${(row.bulkBatchNum.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart", "WOM_7.5.0.0_batchProduceTask_batchTastEditdg1495090968956", "DATAGRID", "batchProdTaskPart")>
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
