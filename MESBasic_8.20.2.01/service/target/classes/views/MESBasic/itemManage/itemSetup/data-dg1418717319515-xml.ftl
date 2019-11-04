<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1418717319515" pageSize="${dg1418717319515Page.pageSize}" totalCount="${dg1418717319515Page.totalCount}" totalPages="${dg1418717319515Page.totalPages}" pageNo="${dg1418717319515Page.pageNo}" hasPre="${dg1418717319515Page.hasPre?string}" hasNext="${dg1418717319515Page.hasNext?string}" prePage="${dg1418717319515Page.prePage}" nextPage="${dg1418717319515Page.nextPage}">
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
					onFocus="CUI.toggleClearBtn_DG_IE(ItemPart_dg1418717319515Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ItemPart_dg1418717319515Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRef.action','dg1418717319515itemView.code','${getText("MESBasic.viewtitle.radion1415323143732")}',sPTGridID,nRow,sFieldName,ItemPart_dg1418717319515Widget,null,false,false,'','MESBasic_1_itemManage_itemRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ItemPart_dg1418717319515Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_code_permit = checkFieldPermission('itemView.code','MESBasic_1_itemManage_ItemPart','MESBasic_1_itemManage_ItemSetup_code')>
						<#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_code_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_code_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (itemView_code_defaultValue)?? &&(itemView_code_defaultValue)?has_content>
							defaultValue='${(itemView_code_defaultValue!)?string}'
						</#if>
						<#if (itemView_code_defaultText)?? &&(itemView_code_defaultText)?has_content>
							defaultText='${(itemView_code_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点编码</itemView.code>
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
					sort="false"  onPropertyChange="ItemPart_dg1418717319515Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemName_permit = checkFieldPermission('itemView.itemName','MESBasic_1_itemManage_ItemPart','MESBasic_1_itemManage_ItemSetup_itemName')>
						<#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (itemView_itemName_defaultValue)?? &&(itemView_itemName_defaultValue)?has_content>
							defaultValue='${(itemView_itemName_defaultValue!)?string}'
						</#if>
						<#if (itemView_itemName_defaultText)?? &&(itemView_itemName_defaultText)?has_content>
							defaultText='${(itemView_itemName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">位号名称</itemView.itemName>
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
					sort="false"  onPropertyChange="ItemPart_dg1418717319515Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemNumber_permit = checkFieldPermission('itemView.itemNumber','MESBasic_1_itemManage_ItemPart','MESBasic_1_itemManage_ItemSetup_itemNumber')>
						<#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemNumber_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemNumber_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (itemView_itemNumber_defaultValue)?? &&(itemView_itemNumber_defaultValue)?has_content>
							defaultValue='${(itemView_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (itemView_itemNumber_defaultText)?? &&(itemView_itemNumber_defaultText)?has_content>
							defaultText='${(itemView_itemNumber_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">生产位号</itemView.itemNumber>
	</thead>
	<tbody>
		<#list dg1418717319515Page.result as row>
		<row  onClick="ItemPart_dg1418717319515Widget._DT._autoAddNewRow(nRow)" >
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
					<#if !MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_code_permit??>
					<#assign MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_code_permit = checkFieldPermission('itemView.code','MESBasic_1_itemManage_ItemPart','MESBasic_1_itemManage_ItemSetup_code')>
					</#if>
							<c><#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_code_permit != 0><#if (row.itemView.code)?has_content>${(row.itemView.code)!}</#if></#if></c>
					<#if !MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemName_permit??>
					<#assign MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemName_permit = checkFieldPermission('itemView.itemName','MESBasic_1_itemManage_ItemPart','MESBasic_1_itemManage_ItemSetup_itemName')>
					</#if>
							<c><#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemName_permit != 0><#if (row.itemView.itemName)?has_content>${(row.itemView.itemName)!}</#if></#if></c>
					<#if !MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemNumber_permit??>
					<#assign MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemNumber_permit = checkFieldPermission('itemView.itemNumber','MESBasic_1_itemManage_ItemPart','MESBasic_1_itemManage_ItemSetup_itemNumber')>
					</#if>
							<c><#if MESBasic_1_itemManage_ItemPart_itemView_MESBasic_1_itemManage_ItemSetup_itemNumber_permit != 0><#if (row.itemView.itemNumber)?has_content>${(row.itemView.itemNumber)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>