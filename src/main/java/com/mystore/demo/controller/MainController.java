package com.mystore.demo.controller;

import jakarta.servlet.http.HttpSession;
import com.mystore.demo.entity.AuthUser;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class MainController {

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @GetMapping("/auth")
    @Transactional(propagation = Propagation.REQUIRED)
    public String auth(Model model, Principal principal, Authentication authentication) {
        String username = principal.getName();
        model.addAttribute("username", username);
        model.addAttribute("userRole", authentication.getAuthorities());

        AuthUser customUser = (AuthUser) authentication.getPrincipal();
        model.addAttribute("customUser", customUser);
        return "auth";
    }

//    @GetMapping("/thanks")
//    public String thanks(Model model) {
//        return "thanks";
//    }
}
