<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1460684019181" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<switcher.id IsHiddenField="true"></switcher.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign stype_defaultValue=''>
						 						<#assign stype_defaultValue=''>
				<#assign stype_defaultText=''>
				<stype.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('MES_SWITHER')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (stype_defaultValue)?? &&(stype_defaultValue)?has_content>
							defaultValue='${(stype_defaultValue!)?string}'
						</#if>
						<#if (stype_defaultText)?? &&(stype_defaultText)?has_content>
							defaultText='${(stype_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">类型</stype.id>
				<#assign isRef = false >
				<#assign switcher_code_defaultValue=''>
												<#assign switcher_code_defaultValue=''>
				<#if (switcher_code_defaultValue!)?string=="currentUser">
					<#assign switcher_code_defaultValue='${staffJson!}'>
				<#elseif (switcher_code_defaultValue!)?string=="currentPost">
					<#assign switcher_code_defaultValue='${postJson!}'>
				<#elseif (switcher_code_defaultValue!)?string=="currentDepart">
					<#assign switcher_code_defaultValue='${deptJson!}'>
				<#elseif (switcher_code_defaultValue!)?string=="currentComp">
					<#assign switcher_code_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_code_defaultText=''>
				<switcher.code
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(SwitcherModel_dg1460684019181Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(SwitcherModel_dg1460684019181Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/switcherOnlyRef.action','dg1460684019181switcher.code','${getText("MESBasic.viewtitle.radion1417920493220")}',sPTGridID,nRow,sFieldName,SwitcherModel_dg1460684019181Widget,null,false,false,'','MESBasic_1_itemManage_switcherOnlyRef')"
								onKeyUp="MESBasic.routine.routine.routineEditForTank.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':SwitcherModel_dg1460684019181Widget,
										'sGridName':'SwitcherModel_dg1460684019181Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/itemManage/itemSetup/switcherOnlyRef.action',
										'displayfieldname':'code',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.routine.routine.routineEditForTank.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.routine.routine.routineEditForTank._querycustomFunc(\'dg1460684019181switcher.code\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (switcher_code_defaultValue)?? &&(switcher_code_defaultValue)?has_content>
							defaultValue='${(switcher_code_defaultValue!)?string}'
						</#if>
						<#if (switcher_code_defaultText)?? &&(switcher_code_defaultText)?has_content>
							defaultText='${(switcher_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点编码</switcher.code>
				<#assign isRef = false >
				<#assign switcher_itemName_defaultValue=''>
												<#assign switcher_itemName_defaultValue=''>
				<#if (switcher_itemName_defaultValue!)?string=="currentUser">
					<#assign switcher_itemName_defaultValue='${staffJson!}'>
				<#elseif (switcher_itemName_defaultValue!)?string=="currentPost">
					<#assign switcher_itemName_defaultValue='${postJson!}'>
				<#elseif (switcher_itemName_defaultValue!)?string=="currentDepart">
					<#assign switcher_itemName_defaultValue='${deptJson!}'>
				<#elseif (switcher_itemName_defaultValue!)?string=="currentComp">
					<#assign switcher_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_itemName_defaultText=''>
				<switcher.itemName
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (switcher_itemName_defaultValue)?? &&(switcher_itemName_defaultValue)?has_content>
							defaultValue='${(switcher_itemName_defaultValue!)?string}'
						</#if>
						<#if (switcher_itemName_defaultText)?? &&(switcher_itemName_defaultText)?has_content>
							defaultText='${(switcher_itemName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">测点名称</switcher.itemName>
				<#assign isRef = false >
				<#assign switcher_tagType_defaultValue=''>
												<#assign switcher_tagType_defaultValue=''>
				<#if (switcher_tagType_defaultValue!)?string=="currentUser">
					<#assign switcher_tagType_defaultValue='${staffJson!}'>
				<#elseif (switcher_tagType_defaultValue!)?string=="currentPost">
					<#assign switcher_tagType_defaultValue='${postJson!}'>
				<#elseif (switcher_tagType_defaultValue!)?string=="currentDepart">
					<#assign switcher_tagType_defaultValue='${deptJson!}'>
				<#elseif (switcher_tagType_defaultValue!)?string=="currentComp">
					<#assign switcher_tagType_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_tagType_defaultText=''>
				<switcher.tagType.id
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('TAG_TYPE')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (switcher_tagType_defaultValue)?? &&(switcher_tagType_defaultValue)?has_content>
							defaultValue='${(switcher_tagType_defaultValue!)?string}'
						</#if>
						<#if (switcher_tagType_defaultText)?? &&(switcher_tagType_defaultText)?has_content>
							defaultText='${(switcher_tagType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点类型</switcher.tagType.id>
				<#assign isRef = false >
				<#assign switcher_itemNumber_defaultValue=''>
												<#assign switcher_itemNumber_defaultValue=''>
				<#if (switcher_itemNumber_defaultValue!)?string=="currentUser">
					<#assign switcher_itemNumber_defaultValue='${staffJson!}'>
				<#elseif (switcher_itemNumber_defaultValue!)?string=="currentPost">
					<#assign switcher_itemNumber_defaultValue='${postJson!}'>
				<#elseif (switcher_itemNumber_defaultValue!)?string=="currentDepart">
					<#assign switcher_itemNumber_defaultValue='${deptJson!}'>
				<#elseif (switcher_itemNumber_defaultValue!)?string=="currentComp">
					<#assign switcher_itemNumber_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_itemNumber_defaultText=''>
				<switcher.itemNumber
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (switcher_itemNumber_defaultValue)?? &&(switcher_itemNumber_defaultValue)?has_content>
							defaultValue='${(switcher_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (switcher_itemNumber_defaultText)?? &&(switcher_itemNumber_defaultText)?has_content>
							defaultText='${(switcher_itemNumber_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">生产位号</switcher.itemNumber>
				<#assign isRef = false >
				<#assign switcher_itemClass_defaultValue=''>
												<#assign switcher_itemClass_defaultValue=''>
				<#if (switcher_itemClass_defaultValue!)?string=="currentUser">
					<#assign switcher_itemClass_defaultValue='${staffJson!}'>
				<#elseif (switcher_itemClass_defaultValue!)?string=="currentPost">
					<#assign switcher_itemClass_defaultValue='${postJson!}'>
				<#elseif (switcher_itemClass_defaultValue!)?string=="currentDepart">
					<#assign switcher_itemClass_defaultValue='${deptJson!}'>
				<#elseif (switcher_itemClass_defaultValue!)?string=="currentComp">
					<#assign switcher_itemClass_defaultValue='${compJson!}'>
				</#if>
				<#assign switcher_itemClass_defaultText=''>
				<switcher.itemClass.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(SwitcherModel_dg1460684019181Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(SwitcherModel_dg1460684019181Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemRefForContainer.action','dg1460684019181switcher.itemClass','${getText("MESBasic.viewtitle.randon1422422463756")}',sPTGridID,nRow,sFieldName,SwitcherModel_dg1460684019181Widget,null,false,false,'','MESBasic_1_itemManage_itemRefForContainer')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('ITEM_PROPERTY')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (switcher_itemClass_defaultValue)?? &&(switcher_itemClass_defaultValue)?has_content>
							defaultValue='${(switcher_itemClass_defaultValue!)?string}'
						</#if>
						<#if (switcher_itemClass_defaultText)?? &&(switcher_itemClass_defaultText)?has_content>
							defaultText='${(switcher_itemClass_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">位号属性</switcher.itemClass.id>
				<#assign isRef = false >
				<#assign forword_defaultValue='false'>
						 				<#assign forword_defaultText=''>
				<forword
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (forword_defaultValue)?? &&(forword_defaultValue)?has_content>
							defaultValue='${(forword_defaultValue!)?string}'
						</#if>
						<#if (forword_defaultText)?? &&(forword_defaultText)?has_content>
							defaultText='${(forword_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">正向</forword>
				<#assign isRef = false >
				<#assign backword_defaultValue='false'>
						 				<#assign backword_defaultText=''>
				<backword
					sort="false"  onPropertyChange="SwitcherModel_dg1460684019181Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (backword_defaultValue)?? &&(backword_defaultValue)?has_content>
							defaultValue='${(backword_defaultValue!)?string}'
						</#if>
						<#if (backword_defaultText)?? &&(backword_defaultText)?has_content>
							defaultText='${(backword_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">反向</backword>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="SwitcherModel_dg1460684019181Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.switcher.id)!}</c>
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
