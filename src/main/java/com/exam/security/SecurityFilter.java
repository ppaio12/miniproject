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
        http.authorizeRequests().
                antMatchers("/login", "/home","/signup", "/webjars/**").
                permitAll().
                anyRequest().
                authenticated();

        http.csrf().disable();
        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/auth").usernameParameter("userid")
                .passwordParameter("passwd").failureForwardUrl("/login_fail")
                .defaultSuccessUrl("/login_success", true);

        http.logout().logoutUrl("/logout").logoutSuccessUrl("/home");

        return http.build();
    }

}
