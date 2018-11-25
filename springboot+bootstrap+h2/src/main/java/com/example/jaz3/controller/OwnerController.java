package com.example.jaz3.controller;

import com.example.jaz3.model.Owner;
import com.example.jaz3.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class OwnerController {

    @Autowired
    private OwnerService ownerService;

    @GetMapping("")
    public String home(HttpServletRequest request) {
        request.setAttribute("mode","MODE_HOME");
        return "index";
    }

    @GetMapping("/all-owners")
    public String allOwners(HttpServletRequest request) {
        request.setAttribute("owners",ownerService.findAll());
        request.setAttribute("mode","MODE_OWNERS");
        return "index";
    }
    @GetMapping("/new-owner")
    public String newOwner(HttpServletRequest request){
        request.setAttribute("mode", "MODE_NEW");
        return "index";
    }

    @PostMapping("/save-owner")
    public String saveOwner(@ModelAttribute Owner owner, BindingResult bindingResult, HttpServletRequest request){
        ownerService.save(owner);
        request.setAttribute("owners", ownerService .findAll());
        request.setAttribute("mode", "MODE_OWNERS");
        return "index";
    }

    @GetMapping("/update-owner")
    public String updateOwner(@RequestParam Long id, HttpServletRequest request){
        request.setAttribute("owner", ownerService.findOwner(id));
        request.setAttribute("mode", "MODE_UPDATE");
        return "index";
    }

    @GetMapping("/delete-owner")
    public String deleteOwner(@RequestParam Long id, HttpServletRequest request){
        ownerService.delete(id);
        request.setAttribute("tasks", ownerService.findAll());
        request.setAttribute("mode", "MODE_TASKS");
        return "index";
    }
}
