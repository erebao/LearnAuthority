黑马程序员 —> 实现基于OAuth2 Spring Cloud Security的认证方式

视频链接(p26-p41)：https://www.bilibili.com/video/av73730658?p=1

```
/oauth/authorize : 授权端点
/oauth/token : 令牌端点
/oauth/confirm_access : 用户确认授权提交端点
/oauth/error : 授权服务错误信息端点
/oauth/check_token : 用于资源服务访问的令牌解析端点
/oauth/token_key : 提供公钥的端点，如果使用的是JWT令牌。
```

**PS：数据库相关可以参考 security-spring-boot 项目的 mysql.sql 文件**

#### 项目介绍
```
distributed-security-discovery：注册中心 端口：53000
distributed-security-gateway：网关 端口：53010
distributed-security-uaa：认证服务器 端口：53020
distributed-security-order：资源服务器 端口：53021
```

#### 网关模式
获取Token：
```
POST:
http://localhost:53010/uaa/oauth/token
参数x-www-form-urlencoded：
client_id：c1
client_secret：secret
grant_type：password
username：zhangsan
password: 123
```

验证Token：
```
POST
http://localhost:53010/uaa/oauth/check_token
参数x-www-form-urlencoded：
token：需要验证的token
```

调用接口：
```
POST
http://localhost:53010/order/r1
参数x-www-form-urlencoded：
Authorization：Bearer 获取到的token
```

**PS：下面的这些模式可能需要修改部分相关代码才能运行，具体请参考视频教学**

#### 授权码模式

> 访问：http://localhost:53020/uaa/oauth/authorize?client_id=c1&response_type=code&scope=all&redirect_uri=http://www.baidu.com
 
> 账号密码：zhangsan 123 或 账号密码：list 456

> 得到code 例如：https://www.baidu.com/?code=Bmkyb1

> postman传入code获取token：

postman示例：
```
POST:
http://localhost:53020/uaa/oauth/token
参数x-www-form-urlencoded：
client_id：c1
client_secret：secret
grant_type：authorization_code
code：得到的code
redirect_uri：http://www.baidu.com
```

#### 简化模式
> 访问：http://localhost:53020/uaa/oauth/authorize?client_id=c1&response_type=token&scope=all&redirect_uri=http://www.baidu.com

#### 密码模式
```
POST:
http://localhost:53020/uaa/oauth/token
参数x-www-form-urlencoded：
client_id：c1
client_secret：secret
grant_type：password
username：zhangsan
password: 123
```

#### 客户端模式
```
POST:
http://localhost:53020/uaa/oauth/token
参数x-www-form-urlencoded：
client_id：c1
client_secret：secret
grant_type：client_credentials
```

## Order 资源服务操作

> 校验令牌信息
```
POST:
http://localhost:53020/uaa/oauth/check_token
参数x-www-form-urlencoded：
token：token
```

> 访问Order服务的接口
```
POST:
http://localhost:53021/order/r1
参数x-www-form-urlencoded：
Authorization：Bearer token
```