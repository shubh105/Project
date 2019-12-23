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
	
	@RequestMapping(value="/deleteUser/{uId}",method=RequestMethod.DELETE)
	public Subject deleteSubject(@PathVariable String uId) {
		Subject obj= fDao.getSubjectById(uId);
		fDao.deleteSubject(obj);
	   return obj;
	}
	
	@RequestMapping(value="/getsubjectsection")
	public ModelAndView getSubjectSection() {
		
	    ModelAndView mv=new ModelAndView("subjectSection");
		return mv;
	}
	
	@RequestMapping(value="/getfacultyhome")
	public ModelAndView getFacultyHome() {
		
	    ModelAndView mv=new ModelAndView("facultyHome");
		return mv;
	}
	
	
	@RequestMapping(value="/getShowSubject")
	public ModelAndView getshowSubject() {
		List<Subject> slist=fDao.getAllSubject();
		ModelAndView mv=new ModelAndView("ShowSubjects");
		mv.addObject("subjectsList",slist);
		return mv;
	}
	
	@RequestMapping(value="/getAddSubject")
	public ModelAndView getAddSubject() {
		
		ModelAndView mv=new ModelAndView("AddSubject");
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
	public ModelAndView getNotice() {
		ModelAndView mv=new ModelAndView("facultyNotice");
		return mv;
	}
	
	
	
	
}
