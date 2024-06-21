package com.exam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Alias("UserDTO")
@Data
@AllArgsConstructor
@NoArgsConstructor
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

    @NotBlank(message = "우편 번호를 입력해주세요")
    private String user_post;

    @NotBlank(message = "도로명 주소를 입력해주세요")
    private String user_addr1;

    @NotBlank(message = "지번 주소를 입력해주세요")
    private String user_addr2;
    private int user_role;
    private int user_point;
}
