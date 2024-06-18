package com.exam.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityFilter {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        // 인증 제외할 맵핑값
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/login", "/main","/signup","/idCheck", "/productDetail", "/webjars/**", "/images/**")
                .permitAll()
                .anyRequest()
                .authenticated();

        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/auth")
                .usernameParameter("user_id")
                .passwordParameter("user_pw")
                .failureForwardUrl("/login_fail")
                .defaultSuccessUrl("/login_success", true);

        http.logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/main");

        return http.build();
    }

}
