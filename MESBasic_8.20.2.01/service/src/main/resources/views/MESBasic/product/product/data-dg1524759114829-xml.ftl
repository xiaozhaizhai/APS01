<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1524759114829" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productID.id IsHiddenField="true"></productID.id>
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
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (clevel_defaultValue)?? &&(clevel_defaultValue)?has_content>
							defaultValue='${(clevel_defaultValue!)?string}'
						</#if>
						<#if (clevel_defaultText)?? &&(clevel_defaultText)?has_content>
							defaultText='${(clevel_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">等级</clevel>
				<#assign isRef = false >
				<#assign corder_defaultValue=''>
						 						<#assign corder_defaultValue=''>
				<#assign corder_defaultText=''>
				<corder
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
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
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">备注</levelMemo>
				<#assign isRef = false >
				<#assign itemChange_defaultValue=''>
						 						<#assign itemChange_defaultValue=''>
				<#assign itemChange_defaultText=''>
				<itemChange
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ProdLevel_dg1524759114829Widget.evalCustomFunction(nRow,sFieldName,'isChange()');"
				    
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
				<#assign productID_productCode_defaultValue=''>
												<#assign productID_productCode_defaultValue=''>
				<#if (productID_productCode_defaultValue!)?string=="currentUser">
					<#assign productID_productCode_defaultValue='${staffJson!}'>
				<#elseif (productID_productCode_defaultValue!)?string=="currentPost">
					<#assign productID_productCode_defaultValue='${postJson!}'>
				<#elseif (productID_productCode_defaultValue!)?string=="currentDepart">
					<#assign productID_productCode_defaultValue='${deptJson!}'>
				<#elseif (productID_productCode_defaultValue!)?string=="currentComp">
					<#assign productID_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign productID_productCode_defaultText=''>
				<productID.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdLevel_dg1524759114829Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdLevel_dg1524759114829Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1524759114829productID.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProdLevel_dg1524759114829Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);ProdLevel_dg1524759114829Widget.evalCustomFunction(nRow,sFieldName,'a(obj)');"
				    
											 control="Text" 
						
						
						
						
						<#if (productID_productCode_defaultValue)?? &&(productID_productCode_defaultValue)?has_content>
							defaultValue='${(productID_productCode_defaultValue!)?string}'
						</#if>
						<#if (productID_productCode_defaultText)?? &&(productID_productCode_defaultText)?has_content>
							defaultText='${(productID_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</productID.productCode>
				<#assign isRef = false >
				<#assign productID_productName_defaultValue=''>
												<#assign productID_productName_defaultValue=''>
				<#if (productID_productName_defaultValue!)?string=="currentUser">
					<#assign productID_productName_defaultValue='${staffJson!}'>
				<#elseif (productID_productName_defaultValue!)?string=="currentPost">
					<#assign productID_productName_defaultValue='${postJson!}'>
				<#elseif (productID_productName_defaultValue!)?string=="currentDepart">
					<#assign productID_productName_defaultValue='${deptJson!}'>
				<#elseif (productID_productName_defaultValue!)?string=="currentComp">
					<#assign productID_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign productID_productName_defaultText=''>
				<productID.productName
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productID_productName_defaultValue)?? &&(productID_productName_defaultValue)?has_content>
							defaultValue='${(productID_productName_defaultValue!)?string}'
						</#if>
						<#if (productID_productName_defaultText)?? &&(productID_productName_defaultText)?has_content>
							defaultText='${(productID_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</productID.productName>
				<#assign isRef = false >
				<#assign isUsed_defaultValue=''>
						 						<#assign isUsed_defaultValue=''>
				<#assign isUsed_defaultText=''>
				<isUsed
					sort="false"  onPropertyChange="ProdLevel_dg1524759114829Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isUsed_defaultValue)?? &&(isUsed_defaultValue)?has_content>
							defaultValue='${(isUsed_defaultValue!)?string}'
						</#if>
						<#if (isUsed_defaultText)?? &&(isUsed_defaultText)?has_content>
							defaultText='${(isUsed_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">等级引用标志</isUsed>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProdLevel_dg1524759114829Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productID.id)!}</c>
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
