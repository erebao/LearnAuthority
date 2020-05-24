package com.erebao.security.springboot;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class TestBCrypt {

    @Test
    public void testBCrypt(){
        //对密码进行加密
        String hashpw = BCrypt.hashpw("123", BCrypt.gensalt());
        System.out.println(hashpw);

        //校验密码
        boolean checkpw = BCrypt.checkpw("123", "$2a$10$kN0GbWqM9tqx1u.WgNj6EeFJ3D2z2ATVH5T8y5VldIu0g1anksxT6");
        boolean checkpw2 = BCrypt.checkpw("123", "$2a$10$3t4O5pKWFTlOWxRx792WreGdHqYrC1sioEW1umbMJBKizsLZBpSGC");
        System.out.println(checkpw);
        System.out.println(checkpw2);
    }
}
