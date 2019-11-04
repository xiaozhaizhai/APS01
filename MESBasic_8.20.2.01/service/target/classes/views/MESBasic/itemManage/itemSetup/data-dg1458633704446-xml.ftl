<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1458633704446" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<itemView.id IsHiddenField="true"></itemView.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign itemView_code_defaultValue=''>
												<#assign itemView_code_defaultValue=''>
				<#if (itemView_code_defaultValue!)?string=="currentUser">
					<#assign itemView_code_defaultValue='${staffJson!}'>
				<#elseif (itemView_code_defaultValue!)?string=="currentPost">
					<#assign itemView_code_defaultValue='${postJson!}'>
				<#elseif (itemView_code_defaultValue!)?string=="currentDepart">
					<#assign itemView_code_defaultValue='${deptJson!}'>
				<#elseif (itemView_code_defaultValue!)?string=="currentComp">
					<#assign itemView_code_defaultValue='${compJson!}'>
				</#if>
				<#assign itemView_code_defaultText=''>
				<itemView.code
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ItemPart_dg1458633704446Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ItemPart_dg1458633704446Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/nonEnergyOnlyRef.action','dg1458633704446itemView.code','${getText("MESBasic.viewtitle.randon1557734207522")}',sPTGridID,nRow,sFieldName,ItemPart_dg1458633704446Widget,null,false,false,'','MESBasic_1_itemManage_nonEnergyOnlyRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ItemPart_dg1458633704446Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (itemView_code_defaultValue)?? &&(itemView_code_defaultValue)?has_content>
							defaultValue='${(itemView_code_defaultValue!)?string}'
						</#if>
						<#if (itemView_code_defaultText)?? &&(itemView_code_defaultText)?has_content>
							defaultText='${(itemView_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">测点编码</itemView.code>
				<#assign isRef = false >
				<#assign itemView_itemName_defaultValue=''>
												<#assign itemView_itemName_defaultValue=''>
				<#if (itemView_itemName_defaultValue!)?string=="currentUser">
					<#assign itemView_itemName_defaultValue='${staffJson!}'>
				<#elseif (itemView_itemName_defaultValue!)?string=="currentPost">
					<#assign itemView_itemName_defaultValue='${postJson!}'>
				<#elseif (itemView_itemName_defaultValue!)?string=="currentDepart">
					<#assign itemView_itemName_defaultValue='${deptJson!}'>
				<#elseif (itemView_itemName_defaultValue!)?string=="currentComp">
					<#assign itemView_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign itemView_itemName_defaultText=''>
				<itemView.itemName
					sort="false"  onPropertyChange="ItemPart_dg1458633704446Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (itemView_itemName_defaultValue)?? &&(itemView_itemName_defaultValue)?has_content>
							defaultValue='${(itemView_itemName_defaultValue!)?string}'
						</#if>
						<#if (itemView_itemName_defaultText)?? &&(itemView_itemName_defaultText)?has_content>
							defaultText='${(itemView_itemName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">测点名称</itemView.itemName>
				<#assign isRef = false >
				<#assign itemView_itemNumber_defaultValue=''>
												<#assign itemView_itemNumber_defaultValue=''>
				<#if (itemView_itemNumber_defaultValue!)?string=="currentUser">
					<#assign itemView_itemNumber_defaultValue='${staffJson!}'>
				<#elseif (itemView_itemNumber_defaultValue!)?string=="currentPost">
					<#assign itemView_itemNumber_defaultValue='${postJson!}'>
				<#elseif (itemView_itemNumber_defaultValue!)?string=="currentDepart">
					<#assign itemView_itemNumber_defaultValue='${deptJson!}'>
				<#elseif (itemView_itemNumber_defaultValue!)?string=="currentComp">
					<#assign itemView_itemNumber_defaultValue='${compJson!}'>
				</#if>
				<#assign itemView_itemNumber_defaultText=''>
				<itemView.itemNumber
					sort="false"  onPropertyChange="ItemPart_dg1458633704446Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (itemView_itemNumber_defaultValue)?? &&(itemView_itemNumber_defaultValue)?has_content>
							defaultValue='${(itemView_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (itemView_itemNumber_defaultText)?? &&(itemView_itemNumber_defaultText)?has_content>
							defaultText='${(itemView_itemNumber_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">生产位号</itemView.itemNumber>
				<#assign isRef = false >
				<#assign itemNumber_defaultValue=''>
						 						<#assign itemNumber_defaultValue=''>
				<#assign itemNumber_defaultText=''>
				<itemNumber
					sort="false"  onPropertyChange="ItemPart_dg1458633704446Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">生产位号</itemNumber>
				<#assign isRef = false >
				<#assign itemStatus_defaultValue=''>
						 						<#assign itemStatus_defaultValue=''>
				<#assign itemStatus_defaultText=''>
				<itemStatus.id
					sort="false"  onPropertyChange="ItemPart_dg1458633704446Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('MESBasic_referPointStatus')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (itemStatus_defaultValue)?? &&(itemStatus_defaultValue)?has_content>
							defaultValue='${(itemStatus_defaultValue!)?string}'
						</#if>
						<#if (itemStatus_defaultText)?? &&(itemStatus_defaultText)?has_content>
							defaultText='${(itemStatus_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">状态</itemStatus.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ItemPart_dg1458633704446Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.itemView.id)!}</c>
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
