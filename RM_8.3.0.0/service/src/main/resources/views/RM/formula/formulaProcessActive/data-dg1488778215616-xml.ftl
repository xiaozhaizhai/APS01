<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1488778215616" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<product.id IsHiddenField="true"></product.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">名称</name>
				<#assign isRef = false >
				<#assign exeSystem_defaultValue='RMsystem/system2'>
						 				<#assign exeSystem_defaultText=''>
				<exeSystem.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);FormulaMixtureActive_dg1488778215616Widget.evalCustomFunction(nRow,sFieldName,'systemCallback(nRow,sFieldName)');"
				    
								<#assign optionMap = getSystemCodeList('RMsystem')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (exeSystem_defaultValue)?? &&(exeSystem_defaultValue)?has_content>
							defaultValue='${(exeSystem_defaultValue!)?string}'
						</#if>
						<#if (exeSystem_defaultText)?? &&(exeSystem_defaultText)?has_content>
							defaultText='${(exeSystem_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">配料系统</exeSystem.id>
				<#assign isRef = false >
				<#assign batchSite_defaultValue='batchSite/batchSet1'>
						 				<#assign batchSite_defaultText=''>
				<batchSite.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);FormulaMixtureActive_dg1488778215616Widget.evalCustomFunction(nRow,sFieldName,'batchSetChange(nRow,sFieldName)');"
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('batchSite')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (batchSite_defaultValue)?? &&(batchSite_defaultValue)?has_content>
							defaultValue='${(batchSite_defaultValue!)?string}'
						</#if>
						<#if (batchSite_defaultText)?? &&(batchSite_defaultText)?has_content>
							defaultText='${(batchSite_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">配料方式</batchSite.id>
				<#assign isRef = false >
				<#assign product_productCode_defaultValue=''>
												<#assign product_productCode_defaultValue=''>
				<#if (product_productCode_defaultValue!)?string=="currentUser">
					<#assign product_productCode_defaultValue='${staffJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentPost">
					<#assign product_productCode_defaultValue='${postJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
					<#assign product_productCode_defaultValue='${deptJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentComp">
					<#assign product_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productCode_defaultText=''>
				<product.productCode
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaMixtureActive_dg1488778215616Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaMixtureActive_dg1488778215616Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout.action','dg1488778215616product.productCode','${getText("MESBasic.viewtitle.randon1450085069587")}',sPTGridID,nRow,sFieldName,FormulaMixtureActive_dg1488778215616Widget,'goodCallback(obj)',false,false,'','MESBasic_1_product_refProductLayout')"
								onKeyUp="RM.formula.formulaProcessActive.manualActiveEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':FormulaMixtureActive_dg1488778215616Widget,
										'sGridName':'FormulaMixtureActive_dg1488778215616Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/product/product/refProductLayout.action',
										'displayfieldname':'productCode',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'RM.formula.formulaProcessActive.manualActiveEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'RM.formula.formulaProcessActive.manualActiveEdit._querycustomFunc(\'dg1488778215616product.productCode\'.replace(/\./g, \'_\'))'
										,'customCallBack' : 'goodCallback(obj)'
									})"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</product.productCode>
				<#assign isRef = false >
				<#assign product_productName_defaultValue=''>
												<#assign product_productName_defaultValue=''>
				<#if (product_productName_defaultValue!)?string=="currentUser">
					<#assign product_productName_defaultValue='${staffJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentPost">
					<#assign product_productName_defaultValue='${postJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentDepart">
					<#assign product_productName_defaultValue='${deptJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentComp">
					<#assign product_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productName_defaultText=''>
				<product.productName
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productName_defaultValue)?? &&(product_productName_defaultValue)?has_content>
							defaultValue='${(product_productName_defaultValue!)?string}'
						</#if>
						<#if (product_productName_defaultText)?? &&(product_productName_defaultText)?has_content>
							defaultText='${(product_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</product.productName>
				<#assign isRef = false >
				<#assign product_productBaseUnit_name_defaultValue=''>
												<#assign product_productBaseUnit_name_defaultValue=''>
				<#if (product_productBaseUnit_name_defaultValue!)?string=="currentUser">
					<#assign product_productBaseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (product_productBaseUnit_name_defaultValue!)?string=="currentPost">
					<#assign product_productBaseUnit_name_defaultValue='${postJson!}'>
				<#elseif (product_productBaseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign product_productBaseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (product_productBaseUnit_name_defaultValue!)?string=="currentComp">
					<#assign product_productBaseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productBaseUnit_name_defaultText=''>
				<product.productBaseUnit.name
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productBaseUnit_name_defaultValue)?? &&(product_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(product_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (product_productBaseUnit_name_defaultText)?? &&(product_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(product_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="60">单位</product.productBaseUnit.name>
				<#assign isRef = false >
				<#assign isPlace_defaultValue=''>
						 						<#assign isPlace_defaultValue=''>
				<#assign isPlace_defaultText=''>
				<isPlace
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);FormulaMixtureActive_dg1488778215616Widget.evalCustomFunction(nRow,sFieldName,'isPlaceChange(nRow,sFieldName)');"
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isPlace_defaultValue)?? &&(isPlace_defaultValue)?has_content>
							defaultValue='${(isPlace_defaultValue!)?string}'
						</#if>
						<#if (isPlace_defaultText)?? &&(isPlace_defaultText)?has_content>
							defaultText='${(isPlace_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">替代料</isPlace>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue='false'>
						 				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isMixQuality_defaultValue)?? &&(isMixQuality_defaultValue)?has_content>
							defaultValue='${(isMixQuality_defaultValue!)?string}'
						</#if>
						<#if (isMixQuality_defaultText)?? &&(isMixQuality_defaultText)?has_content>
							defaultText='${(isMixQuality_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign standardQuantity_defaultValue=''>
						 						<#assign standardQuantity_defaultValue=''>
				<#assign standardQuantity_defaultText=''>
				<standardQuantity
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (standardQuantity_defaultValue)?? &&(standardQuantity_defaultValue)?has_content>
							defaultValue='${(standardQuantity_defaultValue!)?string}'
						</#if>
						<#if (standardQuantity_defaultText)?? &&(standardQuantity_defaultText)?has_content>
							defaultText='${(standardQuantity_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="60">单位数量</standardQuantity>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (minQuality_defaultValue)?? &&(minQuality_defaultValue)?has_content>
							defaultValue='${(minQuality_defaultValue!)?string}'
						</#if>
						<#if (minQuality_defaultText)?? &&(minQuality_defaultText)?has_content>
							defaultText='${(minQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="60">区间下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (maxQuality_defaultValue)?? &&(maxQuality_defaultValue)?has_content>
							defaultValue='${(maxQuality_defaultValue!)?string}'
						</#if>
						<#if (maxQuality_defaultText)?? &&(maxQuality_defaultText)?has_content>
							defaultText='${(maxQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="60">区间上限</maxQuality>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (lossRate_defaultValue)?? &&(lossRate_defaultValue)?has_content>
							defaultValue='${(lossRate_defaultValue!)?string}'
						</#if>
						<#if (lossRate_defaultText)?? &&(lossRate_defaultText)?has_content>
							defaultText='${(lossRate_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">损耗率(%)</lossRate>
				<#assign isRef = false >
				<#assign occurTurn_defaultValue='occurTurn/occurTurn1'>
						 				<#assign occurTurn_defaultText=''>
				<occurTurn.id
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('occurTurn')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">发生于</occurTurn.id>
				<#assign isRef = false >
				<#assign saveFlag_defaultValue='true'>
						 				<#assign saveFlag_defaultText=''>
				<saveFlag
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">保存标识</saveFlag>
				<#assign isRef = false >
				<#assign addFlag_defaultValue='true'>
						 				<#assign addFlag_defaultText=''>
				<addFlag
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">添加标识</addFlag>
				<#assign isRef = false >
				<#assign formulaType_defaultValue='activeType/activeType2'>
						 				<#assign formulaType_defaultText=''>
				<formulaType.id
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('activeType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">类型</formulaType.id>
				<#assign isRef = false >
				<#assign product_id_defaultValue=''>
												<#assign product_id_defaultValue=''>
				<#if (product_id_defaultValue!)?string=="currentUser">
					<#assign product_id_defaultValue='${staffJson!}'>
				<#elseif (product_id_defaultValue!)?string=="currentPost">
					<#assign product_id_defaultValue='${postJson!}'>
				<#elseif (product_id_defaultValue!)?string=="currentDepart">
					<#assign product_id_defaultValue='${deptJson!}'>
				<#elseif (product_id_defaultValue!)?string=="currentComp">
					<#assign product_id_defaultValue='${compJson!}'>
				</#if>
				<#assign product_id_defaultText=''>
				<product.id
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</product.id>
				<#assign isRef = false >
				<#assign formulaHiddenId_defaultValue=''>
						 						<#assign formulaHiddenId_defaultValue=''>
				<#assign formulaHiddenId_defaultText=''>
				<formulaHiddenId
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">配方隐藏Id</formulaHiddenId>
				<#assign isRef = false >
				<#assign processTableId_defaultValue=''>
						 						<#assign processTableId_defaultValue=''>
				<#assign processTableId_defaultText=''>
				<processTableId
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="120">表单号</processTableId>
				<#assign isRef = false >
				<#assign processHiddenId_defaultValue=''>
						 						<#assign processHiddenId_defaultValue=''>
				<#assign processHiddenId_defaultText=''>
				<processHiddenId
					sort="false" numberproperty="sum" onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">工序隐藏Id</processHiddenId>
				<#assign isRef = false >
				<#assign channelOrManual_defaultValue=''>
						 						<#assign channelOrManual_defaultValue=''>
				<#assign channelOrManual_defaultText=''>
				<channelOrManual
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">手工管道</channelOrManual>
				<#assign isRef = false >
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="200">备注</meno>
				<#assign isRef = false >
				<#assign hiddenSort_defaultValue=''>
						 						<#assign hiddenSort_defaultValue=''>
				<#assign hiddenSort_defaultText=''>
				<hiddenSort
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1488778215616Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">隐藏顺序</hiddenSort>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaMixtureActive_dg1488778215616Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.product.id)!}</c>
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
