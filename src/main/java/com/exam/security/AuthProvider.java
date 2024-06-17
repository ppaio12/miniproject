package com.exam.security;

import com.exam.dto.UserDTO;
import com.exam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AuthProvider implements AuthenticationProvider {

    @Autowired
    UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String userid = (String)authentication.getPrincipal(); // name="userid" 값
        String passwd = (String)authentication.getCredentials(); // name="passwd" 값

        UserDTO user = userService.findById(userid);

        // success login
        UsernamePasswordAuthenticationToken token = null;
        if (user != null && new BCryptPasswordEncoder().matches(passwd, user.getUser_pw())) {

            List<GrantedAuthority> list = new ArrayList<>();
            list.add(new SimpleGrantedAuthority("USER")); // ADMIN

            //암호화된 비번대신에 raw 비번으로 설정
            user.setUser_pw(passwd);
            token = new UsernamePasswordAuthenticationToken(user, null, list);
            return token;
        }
        //로그인 실패시
        throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

}




