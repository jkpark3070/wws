package contract.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import contract.model.ContractBean;
import contract.model.ContractServiceImpl;


public class ListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse arg1) throws Exception {
		int pageNo = 1;
		int recordsPerPage = 20;
		if(request.getParameter("pageNo")!=null)
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			List<ContractBean> list = service.getList(pageNo, recordsPerPage);
			int noOfRecords = service.count();
			int noOfPages = (int)Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("noOfPages", noOfPages);
			mav.addObject("currentPage", pageNo);
			
			mav.setViewName("contract/list");
			return mav;
	}
	ContractServiceImpl service;
	public void setService(ContractServiceImpl service){this.service = service;}
}
