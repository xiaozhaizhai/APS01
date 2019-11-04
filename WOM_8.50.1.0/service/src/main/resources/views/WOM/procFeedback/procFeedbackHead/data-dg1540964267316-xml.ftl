<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1540964267316" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<craftStandards.id IsHiddenField="true"></craftStandards.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign craftStandards_quota_defaultValue=''>
												<#assign craftStandards_quota_defaultValue=''>
				<#if (craftStandards_quota_defaultValue!)?string=="currentUser">
					<#assign craftStandards_quota_defaultValue='${staffJson!}'>
				<#elseif (craftStandards_quota_defaultValue!)?string=="currentPost">
					<#assign craftStandards_quota_defaultValue='${postJson!}'>
				<#elseif (craftStandards_quota_defaultValue!)?string=="currentDepart">
					<#assign craftStandards_quota_defaultValue='${deptJson!}'>
				<#elseif (craftStandards_quota_defaultValue!)?string=="currentComp">
					<#assign craftStandards_quota_defaultValue='${compJson!}'>
				</#if>
				<#assign craftStandards_quota_defaultText=''>
				<craftStandards.quota
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (craftStandards_quota_defaultValue)?? &&(craftStandards_quota_defaultValue)?has_content>
							defaultValue='${(craftStandards_quota_defaultValue!)?string}'
						</#if>
						<#if (craftStandards_quota_defaultText)?? &&(craftStandards_quota_defaultText)?has_content>
							defaultText='${(craftStandards_quota_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">指标</craftStandards.quota>
				<#assign isRef = false >
				<#assign craftStandards_stValue_defaultValue=''>
												<#assign craftStandards_stValue_defaultValue=''>
				<#if (craftStandards_stValue_defaultValue!)?string=="currentUser">
					<#assign craftStandards_stValue_defaultValue='${staffJson!}'>
				<#elseif (craftStandards_stValue_defaultValue!)?string=="currentPost">
					<#assign craftStandards_stValue_defaultValue='${postJson!}'>
				<#elseif (craftStandards_stValue_defaultValue!)?string=="currentDepart">
					<#assign craftStandards_stValue_defaultValue='${deptJson!}'>
				<#elseif (craftStandards_stValue_defaultValue!)?string=="currentComp">
					<#assign craftStandards_stValue_defaultValue='${compJson!}'>
				</#if>
				<#assign craftStandards_stValue_defaultText=''>
				<craftStandards.stValue
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (craftStandards_stValue_defaultValue)?? &&(craftStandards_stValue_defaultValue)?has_content>
							defaultValue='${(craftStandards_stValue_defaultValue!)?string}'
						</#if>
						<#if (craftStandards_stValue_defaultText)?? &&(craftStandards_stValue_defaultText)?has_content>
							defaultText='${(craftStandards_stValue_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准值</craftStandards.stValue>
				<#assign isRef = false >
				<#assign craftStandards_loweMxLimit_defaultValue=''>
												<#assign craftStandards_loweMxLimit_defaultValue=''>
				<#if (craftStandards_loweMxLimit_defaultValue!)?string=="currentUser">
					<#assign craftStandards_loweMxLimit_defaultValue='${staffJson!}'>
				<#elseif (craftStandards_loweMxLimit_defaultValue!)?string=="currentPost">
					<#assign craftStandards_loweMxLimit_defaultValue='${postJson!}'>
				<#elseif (craftStandards_loweMxLimit_defaultValue!)?string=="currentDepart">
					<#assign craftStandards_loweMxLimit_defaultValue='${deptJson!}'>
				<#elseif (craftStandards_loweMxLimit_defaultValue!)?string=="currentComp">
					<#assign craftStandards_loweMxLimit_defaultValue='${compJson!}'>
				</#if>
				<#assign craftStandards_loweMxLimit_defaultText=''>
				<craftStandards.loweMxLimit
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (craftStandards_loweMxLimit_defaultValue)?? &&(craftStandards_loweMxLimit_defaultValue)?has_content>
							defaultValue='${(craftStandards_loweMxLimit_defaultValue!)?string}'
						</#if>
						<#if (craftStandards_loweMxLimit_defaultText)?? &&(craftStandards_loweMxLimit_defaultText)?has_content>
							defaultText='${(craftStandards_loweMxLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">下下限</craftStandards.loweMxLimit>
				<#assign isRef = false >
				<#assign craftStandards_lowerLimit_defaultValue=''>
												<#assign craftStandards_lowerLimit_defaultValue=''>
				<#if (craftStandards_lowerLimit_defaultValue!)?string=="currentUser">
					<#assign craftStandards_lowerLimit_defaultValue='${staffJson!}'>
				<#elseif (craftStandards_lowerLimit_defaultValue!)?string=="currentPost">
					<#assign craftStandards_lowerLimit_defaultValue='${postJson!}'>
				<#elseif (craftStandards_lowerLimit_defaultValue!)?string=="currentDepart">
					<#assign craftStandards_lowerLimit_defaultValue='${deptJson!}'>
				<#elseif (craftStandards_lowerLimit_defaultValue!)?string=="currentComp">
					<#assign craftStandards_lowerLimit_defaultValue='${compJson!}'>
				</#if>
				<#assign craftStandards_lowerLimit_defaultText=''>
				<craftStandards.lowerLimit
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (craftStandards_lowerLimit_defaultValue)?? &&(craftStandards_lowerLimit_defaultValue)?has_content>
							defaultValue='${(craftStandards_lowerLimit_defaultValue!)?string}'
						</#if>
						<#if (craftStandards_lowerLimit_defaultText)?? &&(craftStandards_lowerLimit_defaultText)?has_content>
							defaultText='${(craftStandards_lowerLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">下限</craftStandards.lowerLimit>
				<#assign isRef = false >
				<#assign craftStandards_upperLimit_defaultValue=''>
												<#assign craftStandards_upperLimit_defaultValue=''>
				<#if (craftStandards_upperLimit_defaultValue!)?string=="currentUser">
					<#assign craftStandards_upperLimit_defaultValue='${staffJson!}'>
				<#elseif (craftStandards_upperLimit_defaultValue!)?string=="currentPost">
					<#assign craftStandards_upperLimit_defaultValue='${postJson!}'>
				<#elseif (craftStandards_upperLimit_defaultValue!)?string=="currentDepart">
					<#assign craftStandards_upperLimit_defaultValue='${deptJson!}'>
				<#elseif (craftStandards_upperLimit_defaultValue!)?string=="currentComp">
					<#assign craftStandards_upperLimit_defaultValue='${compJson!}'>
				</#if>
				<#assign craftStandards_upperLimit_defaultText=''>
				<craftStandards.upperLimit
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (craftStandards_upperLimit_defaultValue)?? &&(craftStandards_upperLimit_defaultValue)?has_content>
							defaultValue='${(craftStandards_upperLimit_defaultValue!)?string}'
						</#if>
						<#if (craftStandards_upperLimit_defaultText)?? &&(craftStandards_upperLimit_defaultText)?has_content>
							defaultText='${(craftStandards_upperLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">上限</craftStandards.upperLimit>
				<#assign isRef = false >
				<#assign craftStandards_maxLimit_defaultValue=''>
												<#assign craftStandards_maxLimit_defaultValue=''>
				<#if (craftStandards_maxLimit_defaultValue!)?string=="currentUser">
					<#assign craftStandards_maxLimit_defaultValue='${staffJson!}'>
				<#elseif (craftStandards_maxLimit_defaultValue!)?string=="currentPost">
					<#assign craftStandards_maxLimit_defaultValue='${postJson!}'>
				<#elseif (craftStandards_maxLimit_defaultValue!)?string=="currentDepart">
					<#assign craftStandards_maxLimit_defaultValue='${deptJson!}'>
				<#elseif (craftStandards_maxLimit_defaultValue!)?string=="currentComp">
					<#assign craftStandards_maxLimit_defaultValue='${compJson!}'>
				</#if>
				<#assign craftStandards_maxLimit_defaultText=''>
				<craftStandards.maxLimit
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (craftStandards_maxLimit_defaultValue)?? &&(craftStandards_maxLimit_defaultValue)?has_content>
							defaultValue='${(craftStandards_maxLimit_defaultValue!)?string}'
						</#if>
						<#if (craftStandards_maxLimit_defaultText)?? &&(craftStandards_maxLimit_defaultText)?has_content>
							defaultText='${(craftStandards_maxLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">上上限</craftStandards.maxLimit>
				<#assign isRef = false >
				<#assign recordStartTime_defaultValue=''>
						 						<#assign recordStartTime_defaultValue=''>
				<#assign recordStartTime_defaultText=''>
					<#if (recordStartTime_defaultValue)?? &&(recordStartTime_defaultValue)?has_content>
							<#assign recordStartTime_defaultValue  = getDefaultDateTime(recordStartTime_defaultValue!)?datetime>
					</#if>
				<recordStartTime
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(CraftRecords_dg1540964267316Widget,'CraftRecords_dg1540964267316Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(CraftRecords_dg1540964267316Widget,'CraftRecords_dg1540964267316Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (recordStartTime_defaultValue)?? &&(recordStartTime_defaultValue)?has_content>
							defaultValue='${(recordStartTime_defaultValue!)?string}'
						</#if>
						<#if (recordStartTime_defaultText)?? &&(recordStartTime_defaultText)?has_content>
							defaultText='${(recordStartTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">记录开始时间</recordStartTime>
				<#assign isRef = false >
				<#assign recordEndTime_defaultValue=''>
						 						<#assign recordEndTime_defaultValue=''>
				<#assign recordEndTime_defaultText=''>
					<#if (recordEndTime_defaultValue)?? &&(recordEndTime_defaultValue)?has_content>
							<#assign recordEndTime_defaultValue  = getDefaultDateTime(recordEndTime_defaultValue!)?datetime>
					</#if>
				<recordEndTime
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(CraftRecords_dg1540964267316Widget,'CraftRecords_dg1540964267316Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(CraftRecords_dg1540964267316Widget,'CraftRecords_dg1540964267316Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (recordEndTime_defaultValue)?? &&(recordEndTime_defaultValue)?has_content>
							defaultValue='${(recordEndTime_defaultValue!)?string}'
						</#if>
						<#if (recordEndTime_defaultText)?? &&(recordEndTime_defaultText)?has_content>
							defaultText='${(recordEndTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">记录结束时间</recordEndTime>
				<#assign isRef = false >
				<#assign actualValue_defaultValue=''>
						 						<#assign actualValue_defaultValue=''>
				<#assign actualValue_defaultText=''>
				<actualValue
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (actualValue_defaultValue)?? &&(actualValue_defaultValue)?has_content>
							defaultValue='${(actualValue_defaultValue!)?string}'
						</#if>
						<#if (actualValue_defaultText)?? &&(actualValue_defaultText)?has_content>
							defaultText='${(actualValue_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">报出值</actualValue>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="CraftRecords_dg1540964267316Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.craftStandards.id)!}</c>
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
