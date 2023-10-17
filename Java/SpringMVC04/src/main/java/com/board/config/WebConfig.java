package com.board.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	// web.xml 파일을 대체하는 클래스
	// post 방식
	@Override
	protected Filter[] getServletFilters() {
		// 새롭게 인코딩 해주는 객체 생성
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		// 인코딩 방식 지정
		encodingFilter.setEncoding("UTF-8");
		// 인코딩 방식 적용
		encodingFilter.setForceEncoding(true);
		
		return new Filter[] {encodingFilter};
	}


	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {Rootconfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletConfig.class};
	}

	
	// url
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

}
