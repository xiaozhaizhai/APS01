<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1400468411626" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign month_defaultValue=''>
						 						<#assign month_defaultValue=''>
				<#assign month_defaultText=''>
				<month.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);AccountPeriodPart_dg1400468411626Widget.evalCustomFunction(nRow,sFieldName,'onchangeMonth()');"
				    
								<#assign optionMap = getSystemCodeList('accMonth')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (month_defaultValue)?? &&(month_defaultValue)?has_content>
							defaultValue='${(month_defaultValue!)?string}'
						</#if>
						<#if (month_defaultText)?? &&(month_defaultText)?has_content>
							defaultText='${(month_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">月份</month.id>
				<#assign isRef = false >
				<#assign startDate_defaultValue=''>
						 						<#assign startDate_defaultValue=''>
				<#assign startDate_defaultText=''>
					<#if (startDate_defaultValue)?? &&(startDate_defaultValue)?has_content>
							<#assign startDate_defaultValue  = getDefaultDateTime(startDate_defaultValue!)?date>
					</#if>
				<startDate
						style="font-color:0303B3"
					sort="false"  onPropertyChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);AccountPeriodPart_dg1400468411626Widget.evalCustomFunction(nRow,sFieldName,'startDateChange(nRow,sFieldName)');"
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(AccountPeriodPart_dg1400468411626Widget,'AccountPeriodPart_dg1400468411626Widget',nRow,sFieldName)" 
									   onBtnClick="showCalender(AccountPeriodPart_dg1400468411626Widget,'AccountPeriodPart_dg1400468411626Widget',nRow,sFieldName)" 
									  			 control="Text" 
						
						
						
						
						<#if (startDate_defaultValue)?? &&(startDate_defaultValue)?has_content>
							defaultValue='${(startDate_defaultValue!)?string}'
						</#if>
						<#if (startDate_defaultText)?? &&(startDate_defaultText)?has_content>
							defaultText='${(startDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD" 
							type="date" 
					width="100">开始日期</startDate>
				<#assign isRef = false >
				<#assign endDate_defaultValue=''>
						 						<#assign endDate_defaultValue=''>
				<#assign endDate_defaultText=''>
					<#if (endDate_defaultValue)?? &&(endDate_defaultValue)?has_content>
							<#assign endDate_defaultValue  = getDefaultDateTime(endDate_defaultValue!)?date>
					</#if>
				<endDate
						style="font-color:0303B3"
					sort="false"  onPropertyChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);AccountPeriodPart_dg1400468411626Widget.evalCustomFunction(nRow,sFieldName,'endDateChange(nRow,sFieldName)');"
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(AccountPeriodPart_dg1400468411626Widget,'AccountPeriodPart_dg1400468411626Widget',nRow,sFieldName)" 
									   onBtnClick="showCalender(AccountPeriodPart_dg1400468411626Widget,'AccountPeriodPart_dg1400468411626Widget',nRow,sFieldName)" 
									  			 control="Text" 
						
						
						
						
						<#if (endDate_defaultValue)?? &&(endDate_defaultValue)?has_content>
							defaultValue='${(endDate_defaultValue!)?string}'
						</#if>
						<#if (endDate_defaultText)?? &&(endDate_defaultText)?has_content>
							defaultText='${(endDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD" 
							type="date" 
					width="100">结束日期</endDate>
				<#assign isRef = false >
				<#assign isAccounted_defaultValue=''>
						 						<#assign isAccounted_defaultValue=''>
				<#assign isAccounted_defaultText=''>
				<isAccounted
					sort="false"  onPropertyChange="AccountPeriodPart_dg1400468411626Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">已结算</isAccounted>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="AccountPeriodPart_dg1400468411626Widget._DT._autoAddNewRow(nRow)" >
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
