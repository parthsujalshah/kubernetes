package com.kubernetes.kubernetes.services;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

@Service
public class TestService {
    @Autowired
    Environment environment;

    public String var1() {
        String var1 = environment.getProperty("var1");
        System.out.println(var1);
        return var1;
    }
}
