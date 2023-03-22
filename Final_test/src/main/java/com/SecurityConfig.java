package com;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity 
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
			.antMatchers("/resources/**/**").permitAll();
		
		
			/*.antMatchers("/member/login").permitAll()
			.antMatchers("/member/join").permitAll()
			.antMatchers("/member/idcheck").permitAll()
			.antMatchers("/member/joinProcess").permitAll()
			.antMatchers("/member/list").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/member/info").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/**").access("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')");*/

		http.formLogin().loginPage("/member/sign_in")
						.loginProcessingUrl("/member/loginProcess")
						.usernameParameter("id")
						.passwordParameter("password");
						//.successHandler(loginSuccessHandler())
						//.failureHandler(loginFailHandler());
	

	/*(1) logoutSuccessUrl:로그아웃 후 이동할 주소 
	 	(2) logoutSuccessUrl:로그아웃 후 이동할 주소
	 	(3) invalidateHttpSession : 로그아웃시 세션 속성들 제거
	 	(4) deleteCookies :쿠키 제거
	 * */
	
	http.logout().logoutSuccessUrl("/member/login")
		.logoutUrl("/member/logout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me","JSESSION_ID");
	
	http.rememberMe()
	.rememberMeParameter("remember-me")
	.rememberMeCookieName("remember-me")
	.tokenValiditySeconds(2419200);
	
	//http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
	
	}
	
	
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());
	}
	
	/*
	 * @Bean public AuthenticationSuccessHandler loginSuccessHandler() { return new
	 * LoginSuccessHandler(); }
	 * 
	 * 
	 * 
	 * @Bean public UserDetailsService customUserService() { return new
	 * CustomUserDetailsService();//com.naver.security에 존재하는 모든 클래스 파일에 @service없애기
	 * }
	 * 
	 * @Bean public PasswordEncoder passwordEncoder() { return new
	 * BCryptPasswordEncoder(); }
	 * 
	 * @Bean public AccessDeniedHandler accessDeniedHandler() { return new
	 * CustomAccessDeniedHandler(); }
	 * 
	 * @Bean public AuthenticationFailureHandler loginFailHandler() { return new
	 * LoginFailHandler(); }
	 */
	
}
