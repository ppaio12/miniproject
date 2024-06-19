package com.exam.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.util.Date;

@Alias("UserDTO")
public class UserDTO {
    private int user_idx;

    @Size(min = 4, message = "(영문 소문자/숫자, 최소 4자 이상)")
    @NotBlank
    private String user_id;

    @Size(min = 4, message = "(영문 소문자/숫자, 최소 4자 이상)")
    @NotBlank
    private String user_pw;

    @NotBlank
    private String user_name;

    @Email(message = "이메일 형식으로 입력해주세요")
    private String user_email;

    @Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$", message = "휴대폰 번호를 올바르게 입력해주세요")
    private String user_phone;
    private String user_post;
    private String user_addr1;
    private String user_addr2;
    private int user_role;
    private int user_point;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @PastOrPresent(message = "생년월일을 바르게 입력해주세요")
    private Date user_birth;

    public UserDTO() {
    }

    public UserDTO(int user_idx, String user_id, String user_pw, String user_name, String user_email, String user_phone, String user_post, String user_addr1, String user_addr2, int user_role, int user_point, Date user_birth) {
        this.user_idx = user_idx;
        this.user_id = user_id;
        this.user_pw = user_pw;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.user_post = user_post;
        this.user_addr1 = user_addr1;
        this.user_addr2 = user_addr2;
        this.user_role = user_role;
        this.user_point = user_point;
        this.user_birth = user_birth;
    }

    public int getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_pw() {
        return user_pw;
    }

    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_post() {
        return user_post;
    }

    public void setUser_post(String user_post) {
        this.user_post = user_post;
    }

    public String getUser_addr1() {
        return user_addr1;
    }

    public void setUser_addr1(String user_addr1) {
        this.user_addr1 = user_addr1;
    }

    public String getUser_addr2() {
        return user_addr2;
    }

    public void setUser_addr2(String user_addr2) {
        this.user_addr2 = user_addr2;
    }

    public int getUser_role() {
        return user_role;
    }

    public void setUser_role(int user_role) {
        this.user_role = user_role;
    }

    public int getUser_point() {
        return user_point;
    }

    public void setUser_point(int user_point) {
        this.user_point = user_point;
    }

    public Date getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(Date user_birth) {
        this.user_birth = user_birth;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "user_idx=" + user_idx +
                ", user_id='" + user_id + '\'' +
                ", user_pw='" + user_pw + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_email='" + user_email + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_post='" + user_post + '\'' +
                ", user_addr1='" + user_addr1 + '\'' +
                ", user_addr2='" + user_addr2 + '\'' +
                ", user_role=" + user_role +
                ", user_point=" + user_point +
                ", user_birth=" + user_birth +
                '}';
    }
}
