<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1555312971656" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<containerId.id IsHiddenField="true"></containerId.id>
				<productId.id IsHiddenField="true"></productId.id>
				<routineId.id IsHiddenField="true"></routineId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign containerId_name_defaultValue=''>
												<#assign containerId_name_defaultValue=''>
				<#if (containerId_name_defaultValue!)?string=="currentUser">
					<#assign containerId_name_defaultValue='${staffJson!}'>
				<#elseif (containerId_name_defaultValue!)?string=="currentPost">
					<#assign containerId_name_defaultValue='${postJson!}'>
				<#elseif (containerId_name_defaultValue!)?string=="currentDepart">
					<#assign containerId_name_defaultValue='${deptJson!}'>
				<#elseif (containerId_name_defaultValue!)?string=="currentComp">
					<#assign containerId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign containerId_name_defaultText=''>
				<containerId.name
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (containerId_name_defaultValue)?? &&(containerId_name_defaultValue)?has_content>
							defaultValue='${(containerId_name_defaultValue!)?string}'
						</#if>
						<#if (containerId_name_defaultText)?? &&(containerId_name_defaultText)?has_content>
							defaultText='${(containerId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">储罐名称</containerId.name>
				<#assign isRef = false >
				<#assign businessType_defaultValue=''>
						 						<#assign businessType_defaultValue=''>
				<#assign businessType_defaultText=''>
				<businessType
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (businessType_defaultValue)?? &&(businessType_defaultValue)?has_content>
							defaultValue='${(businessType_defaultValue!)?string}'
						</#if>
						<#if (businessType_defaultText)?? &&(businessType_defaultText)?has_content>
							defaultText='${(businessType_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">业务类型</businessType>
				<#assign isRef = false >
				<#assign action_defaultValue=''>
						 						<#assign action_defaultValue=''>
				<#assign action_defaultText=''>
				<action
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (action_defaultValue)?? &&(action_defaultValue)?has_content>
							defaultValue='${(action_defaultValue!)?string}'
						</#if>
						<#if (action_defaultText)?? &&(action_defaultText)?has_content>
							defaultText='${(action_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">进/出罐</action>
				<#assign isRef = false >
				<#assign liquidWeight_defaultValue=''>
						 						<#assign liquidWeight_defaultValue=''>
				<#assign liquidWeight_defaultText=''>
				<liquidWeight
					sort="false" numberproperty="sum" onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (liquidWeight_defaultValue)?? &&(liquidWeight_defaultValue)?has_content>
							defaultValue='${(liquidWeight_defaultValue!)?string}'
						</#if>
						<#if (liquidWeight_defaultText)?? &&(liquidWeight_defaultText)?has_content>
							defaultText='${(liquidWeight_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">进/出罐重量(t)</liquidWeight>
				<#assign isRef = false >
				<#assign liquidVolume_defaultValue=''>
						 						<#assign liquidVolume_defaultValue=''>
				<#assign liquidVolume_defaultText=''>
				<liquidVolume
					sort="false" numberproperty="sum" onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (liquidVolume_defaultValue)?? &&(liquidVolume_defaultValue)?has_content>
							defaultValue='${(liquidVolume_defaultValue!)?string}'
						</#if>
						<#if (liquidVolume_defaultText)?? &&(liquidVolume_defaultText)?has_content>
							defaultText='${(liquidVolume_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">进/出罐体积(m3)</liquidVolume>
				<#assign isRef = false >
				<#assign gasWeight_defaultValue=''>
						 						<#assign gasWeight_defaultValue=''>
				<#assign gasWeight_defaultText=''>
				<gasWeight
					sort="false" numberproperty="sum" onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (gasWeight_defaultValue)?? &&(gasWeight_defaultValue)?has_content>
							defaultValue='${(gasWeight_defaultValue!)?string}'
						</#if>
						<#if (gasWeight_defaultText)?? &&(gasWeight_defaultText)?has_content>
							defaultText='${(gasWeight_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">气体进/出罐质量(t)</gasWeight>
				<#assign isRef = false >
				<#assign gasVolume_defaultValue=''>
						 						<#assign gasVolume_defaultValue=''>
				<#assign gasVolume_defaultText=''>
				<gasVolume
					sort="false" numberproperty="sum" onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (gasVolume_defaultValue)?? &&(gasVolume_defaultValue)?has_content>
							defaultValue='${(gasVolume_defaultValue!)?string}'
						</#if>
						<#if (gasVolume_defaultText)?? &&(gasVolume_defaultText)?has_content>
							defaultText='${(gasVolume_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">气体进/出罐体积(m3)</gasVolume>
				<#assign isRef = false >
				<#assign startLevel_defaultValue=''>
						 						<#assign startLevel_defaultValue=''>
				<#assign startLevel_defaultText=''>
				<startLevel
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (startLevel_defaultValue)?? &&(startLevel_defaultValue)?has_content>
							defaultValue='${(startLevel_defaultValue!)?string}'
						</#if>
						<#if (startLevel_defaultText)?? &&(startLevel_defaultText)?has_content>
							defaultText='${(startLevel_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">开始液位(m)</startLevel>
				<#assign isRef = false >
				<#assign endLevel_defaultValue=''>
						 						<#assign endLevel_defaultValue=''>
				<#assign endLevel_defaultText=''>
				<endLevel
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (endLevel_defaultValue)?? &&(endLevel_defaultValue)?has_content>
							defaultValue='${(endLevel_defaultValue!)?string}'
						</#if>
						<#if (endLevel_defaultText)?? &&(endLevel_defaultText)?has_content>
							defaultText='${(endLevel_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">结束液位(m)</endLevel>
				<#assign isRef = false >
				<#assign levelDiff_defaultValue=''>
						 						<#assign levelDiff_defaultValue=''>
				<#assign levelDiff_defaultText=''>
				<levelDiff
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (levelDiff_defaultValue)?? &&(levelDiff_defaultValue)?has_content>
							defaultValue='${(levelDiff_defaultValue!)?string}'
						</#if>
						<#if (levelDiff_defaultText)?? &&(levelDiff_defaultText)?has_content>
							defaultText='${(levelDiff_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">液位差(m)</levelDiff>
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
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
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
				<#assign startTime_defaultValue=''>
						 						<#assign startTime_defaultValue=''>
				<#assign startTime_defaultText=''>
					<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
					</#if>
				<startTime
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(FlowRecord_dg1555312971656Widget,'FlowRecord_dg1555312971656Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(FlowRecord_dg1555312971656Widget,'FlowRecord_dg1555312971656Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							defaultValue='${(startTime_defaultValue!)?string}'
						</#if>
						<#if (startTime_defaultText)?? &&(startTime_defaultText)?has_content>
							defaultText='${(startTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="142">开始时间</startTime>
				<#assign isRef = false >
				<#assign endTime_defaultValue=''>
						 						<#assign endTime_defaultValue=''>
				<#assign endTime_defaultText=''>
					<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
					</#if>
				<endTime
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(FlowRecord_dg1555312971656Widget,'FlowRecord_dg1555312971656Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(FlowRecord_dg1555312971656Widget,'FlowRecord_dg1555312971656Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							defaultValue='${(endTime_defaultValue!)?string}'
						</#if>
						<#if (endTime_defaultText)?? &&(endTime_defaultText)?has_content>
							defaultText='${(endTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="142">结束时间</endTime>
				<#assign isRef = false >
				<#assign source_defaultValue=''>
						 						<#assign source_defaultValue=''>
				<#assign source_defaultText=''>
				<source
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (source_defaultValue)?? &&(source_defaultValue)?has_content>
							defaultValue='${(source_defaultValue!)?string}'
						</#if>
						<#if (source_defaultText)?? &&(source_defaultText)?has_content>
							defaultText='${(source_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">源容器</source>
				<#assign isRef = false >
				<#assign sourceType_defaultValue=''>
						 						<#assign sourceType_defaultValue=''>
				<#assign sourceType_defaultText=''>
				<sourceType
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (sourceType_defaultValue)?? &&(sourceType_defaultValue)?has_content>
							defaultValue='${(sourceType_defaultValue!)?string}'
						</#if>
						<#if (sourceType_defaultText)?? &&(sourceType_defaultText)?has_content>
							defaultText='${(sourceType_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">源类型</sourceType>
				<#assign isRef = false >
				<#assign destination_defaultValue=''>
						 						<#assign destination_defaultValue=''>
				<#assign destination_defaultText=''>
				<destination
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (destination_defaultValue)?? &&(destination_defaultValue)?has_content>
							defaultValue='${(destination_defaultValue!)?string}'
						</#if>
						<#if (destination_defaultText)?? &&(destination_defaultText)?has_content>
							defaultText='${(destination_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">目的容器</destination>
				<#assign isRef = false >
				<#assign desType_defaultValue=''>
						 						<#assign desType_defaultValue=''>
				<#assign desType_defaultText=''>
				<desType
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (desType_defaultValue)?? &&(desType_defaultValue)?has_content>
							defaultValue='${(desType_defaultValue!)?string}'
						</#if>
						<#if (desType_defaultText)?? &&(desType_defaultText)?has_content>
							defaultText='${(desType_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">目的类型</desType>
				<#assign isRef = false >
				<#assign routineId_name_defaultValue=''>
												<#assign routineId_name_defaultValue=''>
				<#if (routineId_name_defaultValue!)?string=="currentUser">
					<#assign routineId_name_defaultValue='${staffJson!}'>
				<#elseif (routineId_name_defaultValue!)?string=="currentPost">
					<#assign routineId_name_defaultValue='${postJson!}'>
				<#elseif (routineId_name_defaultValue!)?string=="currentDepart">
					<#assign routineId_name_defaultValue='${deptJson!}'>
				<#elseif (routineId_name_defaultValue!)?string=="currentComp">
					<#assign routineId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign routineId_name_defaultText=''>
				<routineId.name
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (routineId_name_defaultValue)?? &&(routineId_name_defaultValue)?has_content>
							defaultValue='${(routineId_name_defaultValue!)?string}'
						</#if>
						<#if (routineId_name_defaultText)?? &&(routineId_name_defaultText)?has_content>
							defaultText='${(routineId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物流路径</routineId.name>
				<#assign isRef = false >
				<#assign flowRecordId_defaultValue=''>
						 						<#assign flowRecordId_defaultValue=''>
				<#assign flowRecordId_defaultText=''>
				<flowRecordId
					sort="false"  onPropertyChange="FlowRecord_dg1555312971656Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">进出罐记录ID</flowRecordId>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FlowRecord_dg1555312971656Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.containerId.id)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.routineId.id)!}</c>
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
	<row></row>
	</tfoot>
</GridData>
