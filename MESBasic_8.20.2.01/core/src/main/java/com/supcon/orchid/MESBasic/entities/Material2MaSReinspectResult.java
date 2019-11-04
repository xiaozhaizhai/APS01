package com.supcon.orchid.MESBasic.entities;

import java.beans.Transient;

/**
 * 复检时通用返回json对象
 * @param <T>
 */
public class Material2MaSReinspectResult<T> {

    private String message;

    private T data;

    private boolean inspecting;

    public Material2MaSReinspectResult() {}

    public Material2MaSReinspectResult(T data, boolean inspecting, String message) {
        this.message = message;
        this.data = data;
        this.inspecting = inspecting;
    }

    public Material2MaSReinspectResult(T data, boolean inspecting) {
        this.data = data;
        this.inspecting = inspecting;
    }
    @Transient
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    @Transient
    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
    @Transient
    public boolean isInspecting() {
        return inspecting;
    }

    public void setInspecting(boolean inspecting) {
        this.inspecting = inspecting;
    }
}
