package com.supcon.orchid.WOM.entities;

import com.supcon.orchid.WOM.enums.ResultEnum;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;

/**
 * Created By guding on 2019/2/20 09:02
 */
public class WOMResult<T> {

    /**
     *  错误码
     */
    private Integer code;

    /**
     * 提示信息
     */
    private String msg;

    /**
     * 返回的数据
     */
    private T data;

    public WOMResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public WOMResult(ResultEnum resultEnum, T data) {
        this.code = resultEnum.getCode();
        this.msg = resultEnum.getMsg();
        this.data = data;
    }
    public WOMResult(ResultEnum resultEnum) {
        this.code = resultEnum.getCode();
        this.msg = resultEnum.getMsg();
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
