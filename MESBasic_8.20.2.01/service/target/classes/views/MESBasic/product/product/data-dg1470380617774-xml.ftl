<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1470380617774" pageSize="${dg1470380617774Page.pageSize}" totalCount="${dg1470380617774Page.totalCount}" totalPages="${dg1470380617774Page.totalPages}" pageNo="${dg1470380617774Page.pageNo}" hasPre="${dg1470380617774Page.hasPre?string}" hasNext="${dg1470380617774Page.hasNext?string}" prePage="${dg1470380617774Page.prePage}" nextPage="${dg1470380617774Page.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<dealerID.id IsHiddenField="true"></dealerID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign content_defaultValue=''>
						 						<#assign content_defaultValue=''>
				<#assign content_defaultText=''>
				<content
					sort="true"  onPropertyChange="ProdDealInfo_dg1470380617774Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_product_ProdDealInfo_content_permit = checkFieldPermission('content','MESBasic_1_product_ProdDealInfo','MESBasic_1_product_ProdDealInfo_content')>
						<#if MESBasic_1_product_ProdDealInfo_content_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdDealInfo_content_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (content_defaultValue)?? &&(content_defaultValue)?has_content>
							defaultValue='${(content_defaultValue!)?string}'
						</#if>
						<#if (content_defaultText)?? &&(content_defaultText)?has_content>
							defaultText='${(content_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="100">维护内容及原因</content>
				<#assign isRef = false >
				<#assign dealerID_name_defaultValue=''>
												<#assign dealerID_name_defaultValue=''>
				<#if (dealerID_name_defaultValue!)?string=="currentUser">
					<#assign dealerID_name_defaultValue='${staffJson!}'>
				<#elseif (dealerID_name_defaultValue!)?string=="currentPost">
					<#assign dealerID_name_defaultValue='${postJson!}'>
				<#elseif (dealerID_name_defaultValue!)?string=="currentDepart">
					<#assign dealerID_name_defaultValue='${deptJson!}'>
				<#elseif (dealerID_name_defaultValue!)?string=="currentComp">
					<#assign dealerID_name_defaultValue='${compJson!}'>
				</#if>
				<#assign dealerID_name_defaultText=''>
				<dealerID.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdDealInfo_dg1470380617774Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdDealInfo_dg1470380617774Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/staff/common/staffListFrameset.action','dg1470380617774dealerID.name','${getText("foundation.ec.entity.view.reference")}',sPTGridID,nRow,sFieldName,ProdDealInfo_dg1470380617774Widget,null,false,false,'','sysbase_1.0_staff_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProdDealInfo_dg1470380617774Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_product_ProdDealInfo_dealerID_base_staff_name_permit = checkFieldPermission('dealerID.name','MESBasic_1_product_ProdDealInfo','base_staff_name')>
						<#if MESBasic_1_product_ProdDealInfo_dealerID_base_staff_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdDealInfo_dealerID_base_staff_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (dealerID_name_defaultValue)?? &&(dealerID_name_defaultValue)?has_content>
							defaultValue='${(dealerID_name_defaultValue!)?string}'
						</#if>
						<#if (dealerID_name_defaultText)?? &&(dealerID_name_defaultText)?has_content>
							defaultText='${(dealerID_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">维护人</dealerID.name>
				<#assign isRef = false >
				<#assign dealTime_defaultValue=''>
						 						<#assign dealTime_defaultValue=''>
				<#assign dealTime_defaultText=''>
					<#if (dealTime_defaultValue)?? &&(dealTime_defaultValue)?has_content>
							<#assign dealTime_defaultValue  = getDefaultDateTime(dealTime_defaultValue!)?datetime>
					</#if>
				<dealTime
					sort="true"  onPropertyChange="ProdDealInfo_dg1470380617774Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_product_ProdDealInfo_dealTime_permit = checkFieldPermission('dealTime','MESBasic_1_product_ProdDealInfo','MESBasic_1_product_ProdDealInfo_dealTime')>
						<#if MESBasic_1_product_ProdDealInfo_dealTime_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdDealInfo_dealTime_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProdDealInfo_dg1470380617774Widget,'ProdDealInfo_dg1470380617774Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProdDealInfo_dg1470380617774Widget,'ProdDealInfo_dg1470380617774Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (dealTime_defaultValue)?? &&(dealTime_defaultValue)?has_content>
							defaultValue='${(dealTime_defaultValue!)?string}'
						</#if>
						<#if (dealTime_defaultText)?? &&(dealTime_defaultText)?has_content>
							defaultText='${(dealTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">维护时间</dealTime>
	</thead>
	<tbody>
		<#list dg1470380617774Page.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.dealerID.id)!}</c>
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
					<#if !MESBasic_1_product_ProdDealInfo_content_permit??>
					<#assign MESBasic_1_product_ProdDealInfo_content_permit = checkFieldPermission('content','MESBasic_1_product_ProdDealInfo','MESBasic_1_product_ProdDealInfo_content')>
					</#if>
							<c><#if MESBasic_1_product_ProdDealInfo_content_permit != 0><#if (row.content)?has_content>${(row.content)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdDealInfo_dealerID_base_staff_name_permit??>
					<#assign MESBasic_1_product_ProdDealInfo_dealerID_base_staff_name_permit = checkFieldPermission('dealerID.name','MESBasic_1_product_ProdDealInfo','base_staff_name')>
					</#if>
							<c><#if MESBasic_1_product_ProdDealInfo_dealerID_base_staff_name_permit != 0><#if (row.dealerID.name)?has_content>${(row.dealerID.name)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdDealInfo_dealTime_permit??>
					<#assign MESBasic_1_product_ProdDealInfo_dealTime_permit = checkFieldPermission('dealTime','MESBasic_1_product_ProdDealInfo','MESBasic_1_product_ProdDealInfo_dealTime')>
					</#if>
							<c><#if MESBasic_1_product_ProdDealInfo_dealTime_permit != 0><#if (row.dealTime)?has_content>${(row.dealTime?string('yyyy-MM-dd HH:mm:ss'))!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>