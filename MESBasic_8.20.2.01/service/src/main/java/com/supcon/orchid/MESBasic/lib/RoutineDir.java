package com.supcon.orchid.MESBasic.lib;

import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;

public class RoutineDir{
	
	/*路径工作方向*/
	/**
	 * 正向
	 */
	static public final Long WORK_DIR_F = 0L;
	/**
	 * 反向
	 */
	static public final  Long WORK_DIR_B = 1L;
	
	private MESBasicRoutine routine;
	private Long direction;
	
	public RoutineDir(){}
	
	public RoutineDir(MESBasicRoutine routine, Long direction){
		this.routine = routine;
		this.direction = direction;
	}
	
	public MESBasicRoutine getRoutine() {
		return routine;
	}
	public void setRoutine(MESBasicRoutine routine) {
		this.routine = routine;
	}
	public Long getDirection() {
		return direction;
	}
	public void setDirection(Long direction) {
		this.direction = direction;
	}
}