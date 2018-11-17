package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DefaultController {
    @RequestMapping(value="/")
    public String index() {
        return "index";
    }

    @RequestMapping(value="/main")
    public String main(){
        return "main";

    }
}
