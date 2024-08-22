package com.mystore.demo.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(authorizeRequests -> authorizeRequests
                        .requestMatchers("/css/**", "/images/**", "/js/**", "/webfonts/**").permitAll()
                        .requestMatchers("/", "/login", "/logout").permitAll()
                        .requestMatchers("/lipstick/**", "/lipstick-type/**", "/lipstick-brand/**").permitAll()
                        .requestMatchers("/cart/**").permitAll()
                        .requestMatchers("/checkout").hasRole("MEMBER")
                        .requestMatchers("/auth/**").hasRole("ADMIN")
                        .requestMatchers("/api/public/**").permitAll()
                        .anyRequest().permitAll()
                )
                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .defaultSuccessUrl("/")
                        .failureUrl("/login?error=true")
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                );
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}