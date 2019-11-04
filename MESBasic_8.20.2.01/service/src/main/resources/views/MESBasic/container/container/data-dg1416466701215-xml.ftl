<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1416466701215" pageSize="${dg1416466701215Page.pageSize}" totalCount="${dg1416466701215Page.totalCount}" totalPages="${dg1416466701215Page.totalPages}" pageNo="${dg1416466701215Page.pageNo}" hasPre="${dg1416466701215Page.hasPre?string}" hasNext="${dg1416466701215Page.hasNext?string}" prePage="${dg1416466701215Page.prePage}" nextPage="${dg1416466701215Page.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<sort IsHiddenField="true"></sort>
				<property.id IsHiddenField="true"></property.id>
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
					onFocus="CUI.toggleClearBtn_DG_IE(PropertyTags_dg1416466701215Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PropertyTags_dg1416466701215Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRef.action','dg1416466701215property.code','${getText("MESBasic.viewtitle.radion1415323143732")}',sPTGridID,nRow,sFieldName,PropertyTags_dg1416466701215Widget,null,false)"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PropertyTags_dg1416466701215Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_code_permit = checkFieldPermission('property.code','MESBasic_1_container_PropertyTags','MESBasic_1_itemManage_ItemSetup_code')>
						<#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_code_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_code_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (property_code_defaultValue)?? &&(property_code_defaultValue)?has_content>
							defaultValue='${(property_code_defaultValue!)?string}'
						</#if>
						<#if (property_code_defaultText)?? &&(property_code_defaultText)?has_content>
							defaultText='${(property_code_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点编码</property.code>
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
					sort="false"  onPropertyChange="PropertyTags_dg1416466701215Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemNumber_permit = checkFieldPermission('property.itemNumber','MESBasic_1_container_PropertyTags','MESBasic_1_itemManage_ItemSetup_itemNumber')>
						<#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemNumber_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemNumber_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (property_itemNumber_defaultValue)?? &&(property_itemNumber_defaultValue)?has_content>
							defaultValue='${(property_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (property_itemNumber_defaultText)?? &&(property_itemNumber_defaultText)?has_content>
							defaultText='${(property_itemNumber_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">生产位号</property.itemNumber>
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
					sort="false"  onPropertyChange="PropertyTags_dg1416466701215Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemName_permit = checkFieldPermission('property.itemName','MESBasic_1_container_PropertyTags','MESBasic_1_itemManage_ItemSetup_itemName')>
						<#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (property_itemName_defaultValue)?? &&(property_itemName_defaultValue)?has_content>
							defaultValue='${(property_itemName_defaultValue!)?string}'
						</#if>
						<#if (property_itemName_defaultText)?? &&(property_itemName_defaultText)?has_content>
							defaultText='${(property_itemName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">位号名称</property.itemName>
				<#assign isRef = false >
				<#assign primary_defaultValue=''>
						 						<#assign primary_defaultValue=''>
				<#assign primary_defaultText=''>
				<primary
					sort="false"  onPropertyChange="PropertyTags_dg1416466701215Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_container_PropertyTags_primary_permit = checkFieldPermission('primary','MESBasic_1_container_PropertyTags','MESBasic_1_container_PropertyTags_primary')>
						<#if MESBasic_1_container_PropertyTags_primary_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_container_PropertyTags_primary_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
	</thead>
	<tbody>
		<#list dg1416466701215Page.result as row>
		<row  onClick="PropertyTags_dg1416466701215Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.sort)!}</c>
					<c>${(row.property.id)!}</c>
					<#if !MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_code_permit??>
					<#assign MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_code_permit = checkFieldPermission('property.code','MESBasic_1_container_PropertyTags','MESBasic_1_itemManage_ItemSetup_code')>
					</#if>
							<c><#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_code_permit != 0><#if (row.property.code)?has_content>${(row.property.code)!}</#if></#if></c>
					<#if !MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemNumber_permit??>
					<#assign MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemNumber_permit = checkFieldPermission('property.itemNumber','MESBasic_1_container_PropertyTags','MESBasic_1_itemManage_ItemSetup_itemNumber')>
					</#if>
							<c><#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemNumber_permit != 0><#if (row.property.itemNumber)?has_content>${(row.property.itemNumber)!}</#if></#if></c>
					<#if !MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemName_permit??>
					<#assign MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemName_permit = checkFieldPermission('property.itemName','MESBasic_1_container_PropertyTags','MESBasic_1_itemManage_ItemSetup_itemName')>
					</#if>
							<c><#if MESBasic_1_container_PropertyTags_property_MESBasic_1_itemManage_ItemSetup_itemName_permit != 0><#if (row.property.itemName)?has_content>${(row.property.itemName)!}</#if></#if></c>
					<#if !MESBasic_1_container_PropertyTags_primary_permit??>
					<#assign MESBasic_1_container_PropertyTags_primary_permit = checkFieldPermission('primary','MESBasic_1_container_PropertyTags','MESBasic_1_container_PropertyTags_primary')>
					</#if>
							<c><#if MESBasic_1_container_PropertyTags_primary_permit != 0><#if (row.primary)?has_content>${(row.primary?string)!}<#else>false</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>