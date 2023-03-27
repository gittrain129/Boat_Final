package com;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.boat.Security.CustomAccessDeniedHandler;
import com.boat.Security.CustomUserDetailsService;
import com.boat.Security.LoginFailHandler;
import com.boat.Security.LoginSuccessHandler;


@EnableWebSecurity	//스프링과 시큐리티 결합
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	
	//<security:http> 설정 부분
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		
		http.authorizeRequests()
			.antMatchers("/resources/**/**").permitAll()
			.antMatchers("/**").permitAll()
			.antMatchers("/member/list").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/member/info").access("hasRole('ROLE_ADMIN')");
		
//		http.authorizeRequests()
//			.antMatchers("/resources/**/**").permitAll()
//			.antMatchers("/member/login").permitAll()
//			.antMatchers("/member/join").permitAll()
//			.antMatchers("/member/idcheck").permitAll()
//			.antMatchers("/member/joinProcess").permitAll()
//			.antMatchers("/member/list").access("hasRole('ROLE_ADMIN')")
//			.antMatchers("/member/info").access("hasRole('ROLE_ADMIN')")
//			.antMatchers("/**").access("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')");
		
		
//		http.formLogin().loginPage("/member/sign_in")
//		 				.loginProcessingUrl("/member/loginProcess")
//		 				.usernameParameter("EMPNO")
//		 				.passwordParameter("PASSWORD")
//		 				.successHandler(loginSuccessHandler())
//		 				.failureHandler(loginFailHandler());
			
		//메인으로 접속하려고 변경
		http.formLogin()
		    .loginPage("/member/sign_in")
		    .loginProcessingUrl("/member/loginProcess")
		    .usernameParameter("EMPNO")
		    .passwordParameter("PASSWORD")
		    .successHandler(loginSuccessHandler())
		    .failureHandler(loginFailHandler())
		    .defaultSuccessUrl("/index", true);
		
		/*
		 (1) logoutSuccessUrl : 로그아웃 후 이동할 주소
		 (2) logoutUrl (여기서 처리하기 때문에 컨트롤러 logout 제거 합니다. post 방식을 요구합니다.)
		 (3) invalidateHttpSession : 로그아웃시 세션 속성들 제거
		 (4) deleteCookies : 쿠키 제거
		 */
		http.logout().logoutSuccessUrl("/index")
		.logoutUrl("/member/logout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me", "JSESSION_ID");
		
		http.rememberMe()
		.rememberMeParameter("remember-me")
		.rememberMeCookieName("remember-me")
		.tokenValiditySeconds(2419200);
		
		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
	}

	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());
	}

	//로그인 성공시 실행할 객체 생성
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new LoginSuccessHandler();//패키지 com.naver.security에 존재하는 모든 클래스 파일에 @Service 없애주세요
	}
	
	/*
	 1. UserDetailsService 인터페이스는 DB에서 유저 정보를 불러오는 loadUserByUsername()가 존재합니다.
	 	이를 구현하는 클래스는 DB에서 유저의 정보를 가져와서 UserDetails 타입으로 리턴해 주는 작업을 합니다.
	 2. UserDetails는 인터페이스로 Security에서 사용자의 정보를 담는 인터페이스입니다.
	 3. UserDetails 인터페이스를 구현한 클래스는 실제로 사용자의 정보와 사용자가 가진 권한의 정보를 처리해서 반환하게 됩니다.
	 예) UserDetails user = new User(username, users.getPassword(), roles);
	 */
	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Bean
	public AuthenticationFailureHandler loginFailHandler() {
		return new LoginFailHandler();
	}
	

}
