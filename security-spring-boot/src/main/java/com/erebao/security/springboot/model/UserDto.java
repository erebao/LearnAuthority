package com.erebao.security.springboot.model;

import lombok.Data;

@Data
public class UserDto {

    //用户身份信息
    private String id;
    private String username;
    private String password;
    private String fullname;
    private String mobile;

}
