package com.kubernetes.kubernetes.controllers;

import com.kubernetes.kubernetes.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @Autowired
    TestService testService;

    @GetMapping("/var1")
    public String var1() {
        return testService.var1();
    }
}
