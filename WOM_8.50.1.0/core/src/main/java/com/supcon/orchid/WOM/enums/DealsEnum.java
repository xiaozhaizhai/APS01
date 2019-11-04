package com.supcon.orchid.WOM.enums;

/**
 * Created By guding on 2019/2/22 18:15
 */
public enum DealsEnum {
    BATCH("批控","batch"),
    PDA("PDA","pda"),
    MES("MES","mes")
    ;

    
    
    public String getMsg() {
		return msg;
	}



	public String getType() {
		return type;
	}

	

	private DealsEnum(String msg, String type) {
		this.msg = msg;
		this.type = type;
	}



	private String  msg;

    private String type;

}
