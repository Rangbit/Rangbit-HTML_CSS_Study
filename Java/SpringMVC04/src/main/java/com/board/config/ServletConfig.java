package com.board.config;



import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration  // 설정파일을 만들기위한 어노테이션
@EnableWebMvc // Spring  스프링 내부적으로 많은 설정값들을 알아서 세팅
@ComponentScan(basePackages = {"com.board.controller"})
public class ServletConfig implements WebMvcConfigurer {
	// servlet-context.xml 파일을 대체하는 클래스

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// ViewResoler 객체
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		
		registry.viewResolver(bean);
	}
	
	
}
