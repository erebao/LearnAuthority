package com.erebao.security.springmvc.service;

import com.erebao.security.springmvc.model.AuthenticationRequest;
import com.erebao.security.springmvc.model.UserDto;

public interface AuthenticationService {

    /**
     * 用户认证
     * @param authenticationRequest 用户认证请求，账号和密码
     * @return 认证成功的用户信息
     */
    UserDto authentication(AuthenticationRequest authenticationRequest);
}
