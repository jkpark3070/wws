package biz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import tgate.model.TgateBean;
import tgate.model.TgateServiceImpl;

public class Hyundai_autoeverController implements Controller{
	TgateServiceImpl service;

	public void setService(TgateServiceImpl service) {
		this.service = service;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String custId = "hyundai-autoever";
	
		List<TgateBean> list = service.retrieveByCustId(custId);
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		
		mav.setViewName("bizmall/hyundai_autoever/hyundai_autoever");
		return mav;
	}
}
