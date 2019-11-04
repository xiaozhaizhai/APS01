package com.supcon.orchid.WOM.enums;

/**
 * Created By guding on 2019/2/20 10:35
 */
public enum ResultEnum {
        SUCCESS(200,"处理成功"),
        FAILED(500,"处理失败"),
    ;

        
    public Integer getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}


	private ResultEnum(Integer code, String msg) {
		this.code = code;
		this.msg = msg;
	}


	/**
     * 返回码
     */
    private Integer code;

    /**
     * 返回信息
     */
    private String msg;

}
