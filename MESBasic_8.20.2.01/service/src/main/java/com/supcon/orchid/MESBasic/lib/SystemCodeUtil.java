package com.supcon.orchid.MESBasic.lib;

import com.supcon.orchid.foundation.entities.SystemCode;

/**
 * 系统编码比较的辅助类
 * @author malipeng
 * @version 2014-11-20
 * @since 1.0
 */
abstract public class SystemCodeUtil {
	public static boolean equals(SystemCode first, SystemCode second){
		if(first == null || second == null){
			return false;
		}
		if(first.getId() == null || second.getId() == null){
			return first.getCode().equals(second.getCode());
		}else{
			return first.getId().equals(second.getId());
		}
	}
	
	public static boolean equals(SystemCode first, String second){
		if(first == null || second == null){
			return false;
		}
		if(second.contains("/")){
			return (first.getEntityCode() + "/" + first.getCode()).equals(second);
		}
		return false;
	}
}
