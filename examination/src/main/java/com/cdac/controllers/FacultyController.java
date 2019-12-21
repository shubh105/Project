package com.cdac.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.annotation.ServiceResponse;
import com.cdac.daos.FacultyDao;
import com.cdac.daos.UserDao;
import com.cdac.models.Student;
import com.cdac.models.Subject;


@RestController
public class FacultyController {
	
	@Autowired 
	HttpSession session;

	@Autowired
	FacultyDao fDao;
	
	
	@RequestMapping(value = "/addsubject",method = RequestMethod.POST)
	public ServiceResponse addSubject(@RequestBody Subject subject) {
        fDao.addingSubject(subject);
        System.out.println("Ajax Working");
        ServiceResponse response = new ServiceResponse("success",subject);
        return response;
	    
	}
	
//	@RequestMapping(value="/getsubject", method=RequestMethod.GET)
//	public ModelAndView getSubject() 
//	{
//    List<Subject> slist=fDao.getAllSubject();
//    for(Subject s: slist) {
//    	System.out.println(s);
//    }
//    ModelAndView mv=new ModelAndView("subjectSection");
//	mv.addObject("subjectsList",slist);
//	return mv;
//    	 
//    	
//    }
//    
	
//	@RequestMapping(value="/deleteUser/{uId}",method=RequestMethod.GET)
//	public String deleteSubject(@PathVariable String uId) {
//		
//		Subject obj= fDao.getSubjectById(uId);
//		System.out.println(obj);
//		
//		return null;
//	
//		
//	}
	
	
	@RequestMapping(value="/getsubjectsection")
	public ModelAndView getSubjectSection() {
		List<Subject> slist=fDao.getAllSubject();
	    for(Subject s: slist) {
	    	System.out.println(s);
	    }
	    ModelAndView mv=new ModelAndView("subjectSection");
		mv.addObject("subjectsList",slist);
		return mv;
	}
	
	@RequestMapping(value="/getpapersection")
	public ModelAndView getMakePaper() {
		
		ModelAndView mv=new ModelAndView("paperSection");
		return mv;
	}
	
	@RequestMapping(value="/getquestionsection")
	public String getViewResult() {
		return "questionSection";
	}

	@RequestMapping(value="/getviewresult")
	public String viewResult() {
		return "viewResult";
	}
	@RequestMapping(value="/getnotice")
	public String getNotice() {
		return "facultyNotice";
	}
	
	
	
	
}
