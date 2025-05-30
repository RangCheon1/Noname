package org.project.controller;

import java.util.List;
import java.util.Collections;

import org.project.domain.Customer;
import org.project.mapper.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SelectController {

    @Autowired
    private CustomerMapper customerMapper;

    // 처음 접속 시 목록을 보여주지 않음
    @GetMapping("/selectCustomer.do")
    public String selectCustomer(Model model) {
        model.addAttribute("customers", Collections.emptyList());
        return "select";
    }

    // 검색
    @GetMapping("/searchCustomer.do")
    public String searchCustomer(@RequestParam("keyword") String keyword, Model model) {
        if (keyword == null || keyword.trim().isEmpty()) {
            model.addAttribute("customers", Collections.emptyList());
            return "select";
        }
        List<Customer> customers = customerMapper.searchCustomers(keyword);
        model.addAttribute("customers", customers);
        return "select";
    }

    // 고객 삭제
    @PostMapping("/deleteCustomer.do")
    public String deleteCustomer(@RequestParam("userno") int userno) {
        customerMapper.deleteCustomer(userno);
        return "redirect:/selectCustomer.do";
    }
    
 // 전기요금 납부증명서 페이지로 이동
    @GetMapping("/proof.do")
    public String showProofPage() {
        return "proof";  // /WEB-INF/views/proof.jsp로 이동
    }
    
    @RequestMapping("/main.do")
    public String showMainPage() {
        return "main"; // /WEB-INF/views/main.jsp 로 포워딩
    }
    
    
}
