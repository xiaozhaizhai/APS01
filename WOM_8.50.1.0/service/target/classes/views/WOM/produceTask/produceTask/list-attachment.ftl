<style type="text/css">
.file-list-item-detail {width:85%}
.file-list-item-detail-file-name {
	max-width:130px;
}
</style>
<script type="text/javascript" language="javascript" charset="utf-8">
// 导出
function downloadSingle(id){
	var url = "/foundation/workbench/download.action?id="+id + "&entityCode=WOM_7.5.0.0_produceTask";
	openExportFrame(url);
}
function showDownLoadInfoDialog(id){
	var infoDialog = new CUI.Dialog({
		title: "${getText('foundation.workbench.fileupload_new.attachmentDownloadInfo')}",
		url : "/foundation/workbench/file-download-info.action?id="+id,
		modal:true,
		height:500,
		width: 666,
		buttons:[
				{	name:"${getText('foundation.staff.getPartyTax.close')}",
					handler:function(){this.close()}
				}]
	});
	infoDialog.show();
}

</script>
<script type="text/javascript">
	$(function(){
	  $('div.file-list-item').dblclick(function(){
	  	  downloadSingle($(this).attr('index'));
	  });
	  $('.file-list-item-detail-file-name').click(function(){
	  	  downloadSingle($(this).parents('div.file-list-item').attr('index'));
	  });
	  if(YAHOO.env.ua.ie == "6"){
	  	  if($(".file-list-item-detail-file-name").width() > 130){
		  	  $(".file-list-item-detail-file-name").width("130px");
	  	  }
	  	  if($(".file-list-item-detail-memo").width() > 590){
		  	  $(".file-list-item-detail-memo").width("590px");
	  	  }
	  }
	});
</script>
<div id="WOM_produceTask_produceTask_reWorkList_attachment">	
<@errorbar id="listFileUploadDialogErrorBar" />
<div id="LIST_ExistsFiles">
	<#if attachments.result?? && attachments.result?size gt 0>
	<#list attachments.result as item>
	<div class="file-list-item" index="${item.id!}">
		<div class="file-list-item-icon">
			<img src="${fileIcon(item.name)}">
		</div>
		<div class="file-list-item-detail">
			<div class="file-list-item-detail-fileinfo">
				<span class="file-list-item-detail-file-name" title="${(item.name!)?html}"><#if item.name?? && item.name?length gt 10>${item.name?substring(0, 8)}...<#else>${item.name!}</#if></span>
				<span class="file-list-item-detail-file-size">(${item.sizeDis!})</span>
				<span class="file-list-item-detail-upload-time"><#if item.createTime??>${item.createTime?string('yyyy-MM-dd HH:mm')}</#if></span>
				<span class="file-list-item-detail-download-times">${getHtmlText("foundation.workbench.fileupload_new.downloadTimes")}<#if item.downloadTimes gt 0><a style="cursor: pointer;color: #999999;" onclick="showDownLoadInfoDialog(${item.id!-1});">${item.downloadTimes}</a><#else>0</#if></span>
			</div>
			<div class="file-list-item-detail-memo" title="${(item.memo!)?html}">
				${(item.memo!)?html}
			</div>
		</div>
	</div>
	</#list>
	</#if>
</div>
</div>