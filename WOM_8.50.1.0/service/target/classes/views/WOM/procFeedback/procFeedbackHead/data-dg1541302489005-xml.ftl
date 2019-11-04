<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1541302489005" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign recordStartTime_defaultValue=''>
						 						<#assign recordStartTime_defaultValue=''>
				<#assign recordStartTime_defaultText=''>
					<#if (recordStartTime_defaultValue)?? &&(recordStartTime_defaultValue)?has_content>
							<#assign recordStartTime_defaultValue  = getDefaultDateTime(recordStartTime_defaultValue!)?datetime>
					</#if>
				<recordStartTime
					sort="true"  onPropertyChange="CraftRecords_dg1541302489005Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(CraftRecords_dg1541302489005Widget,'CraftRecords_dg1541302489005Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(CraftRecords_dg1541302489005Widget,'CraftRecords_dg1541302489005Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (recordStartTime_defaultValue)?? &&(recordStartTime_defaultValue)?has_content>
							defaultValue='${(recordStartTime_defaultValue!)?string}'
						</#if>
						<#if (recordStartTime_defaultText)?? &&(recordStartTime_defaultText)?has_content>
							defaultText='${(recordStartTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">记录开始时间</recordStartTime>
				<#assign isRef = false >
				<#assign recordEndTime_defaultValue=''>
						 						<#assign recordEndTime_defaultValue=''>
				<#assign recordEndTime_defaultText=''>
					<#if (recordEndTime_defaultValue)?? &&(recordEndTime_defaultValue)?has_content>
							<#assign recordEndTime_defaultValue  = getDefaultDateTime(recordEndTime_defaultValue!)?datetime>
					</#if>
				<recordEndTime
					sort="true"  onPropertyChange="CraftRecords_dg1541302489005Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(CraftRecords_dg1541302489005Widget,'CraftRecords_dg1541302489005Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(CraftRecords_dg1541302489005Widget,'CraftRecords_dg1541302489005Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (recordEndTime_defaultValue)?? &&(recordEndTime_defaultValue)?has_content>
							defaultValue='${(recordEndTime_defaultValue!)?string}'
						</#if>
						<#if (recordEndTime_defaultText)?? &&(recordEndTime_defaultText)?has_content>
							defaultText='${(recordEndTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">记录结束时间</recordEndTime>
				<#assign isRef = false >
				<#assign actualValue_defaultValue=''>
						 						<#assign actualValue_defaultValue=''>
				<#assign actualValue_defaultText=''>
				<actualValue
					sort="true"  onPropertyChange="CraftRecords_dg1541302489005Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="true"  onPropertyChange="CraftRecords_dg1541302489005Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
