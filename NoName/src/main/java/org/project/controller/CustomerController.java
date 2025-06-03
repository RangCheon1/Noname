package org.project.controller;

import org.project.domain.Customer;
import org.project.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    // 회원가입 화면을 보여주는 메서드
    @RequestMapping("/signup")
    public String showSignupForm() {
        return "signup"; // signup.jsp를 반환
    }

    // 회원가입 처리
    @PostMapping("/signup")
    public String signup(@ModelAttribute Customer customer) {
        // 서비스 계층에서 회원가입 처리
        customerService.registerCustomer(customer);
        return "redirect:/customer/success"; // 성공 후 리다이렉트 페이지
    }

    // 회원가입 성공 페이지
    @RequestMapping("/success")
    public String signupSuccess() {
        return "signupSuccess"; // signupSuccess.jsp를 반환
    }
}
