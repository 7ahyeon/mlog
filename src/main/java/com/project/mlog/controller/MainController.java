package com.project.mlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping(value={"/", "main", "mlog"})
    public String main () {
        return "main";
    }
}
