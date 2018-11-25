package com.example.jaz3.controller;

import com.example.jaz3.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
//TEST CONTRIOLLER
@RestController
public class OwnerRestController {
    @Autowired
    private OwnerService ownerService;

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }
}
