package com.supcon.orchid.MESBasic.services;

import java.util.List;
import java.util.Map;

import com.supcon.orchid.services.IBusinessKeyService;

/**
 * 
 * @author yangqipeng
 * 作业票接口
 */
public interface MESBasicWorkTicketsInterFaceService extends IBusinessKeyService{
	
	/**
	 * 工单请求生成/查询作业票
	 * @param applyStaffId        申请人ID
	 * @param workOrderType       作业票类型                 01抽堵盲板02断路03临时04动火05高处06吊装07受限空间08动土
	 * @param workRecordTableNo 
	 * @param workId              工单ID
	 * @param type                操作类型                     1新增2查询
	 * @return                    返回组织好的数据
     * applyStaff		          OBJECT		        申请人(id,name)
     * workOrderType		      SYSTEMCODE	        作业票类型(id,name)
     * workOrderTableNo	          Text		                作业票单据编号(tableNo)
     * workOrderState		      String		        作业票单据状态(tableState)
     * workId		              Long		                工单ID
	 */
	public List<Map<String, String>> getWorkTicketsByWorkList(Long applyStaffId,String workOrderType,String workRecordTableNo,  Long workId, int type);
}
