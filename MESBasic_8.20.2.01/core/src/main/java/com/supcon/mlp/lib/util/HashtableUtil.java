package com.supcon.mlp.lib.util;

import java.util.Map;

/**
 * 提供与hashtable相关的扩展方法
 * @author malipeng
 *
 */
public class HashtableUtil {
	
	/**
	 * 强制将key 和value 插入到hashtable中，如果已存在key，则将原来的key移除
	 * @param ht
	 * @param key
	 * @param value
	 */
	static public<K, V> void putForce(Map<K,V> ht, K key, V value){
		if(ht.containsKey(key)){
			ht.remove(key);
		}
		ht.put(key, value);
	}
	/**
	 * 如果源hashtable里面不存在key，则将key， value放入到hashtable中
	 * @param ht
	 * @param key
	 * @param value
	 */
	static public<K, V> boolean put(Map<K,V> ht, K key, V value){
		if(!ht.containsKey(key)){
			ht.put(key, value);
			return true;
		}
		return false;
	}
}
