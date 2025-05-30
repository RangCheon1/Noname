package org.project.domain;

import lombok.Data;

@Data
public class Customer {
    private int userno;
    private String name;
    private String id;
    private String password;
    private String phone;
    private String address;

    // getter, setter 생략
}
