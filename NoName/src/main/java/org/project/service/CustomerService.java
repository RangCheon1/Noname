package org.project.service;

import org.project.domain.Customer;
import org.project.mapper.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    // 회원가입 처리
    public void registerCustomer(Customer customer) {
        customerMapper.insertCustomer(customer);
        
        
    }
    
    
}
