package controller;

import entity.Record;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UserService;
import util.LogUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
@SessionAttributes(value={"user","records"})

public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value="/checkLogin",method=RequestMethod.POST)
    public void checkLogin(User user,Model model, HttpServletResponse response)throws Exception{
        user = userService.login(user.getAccountName(),user.getPassword());
        LogUtil.log(this,"在下神行太保"+user);
        PrintWriter printWriter = response.getWriter();
        if (user!=null){
            model.addAttribute("user",user);
            printWriter.print("success");
        }else{
            printWriter.print("failed");
        }

    }

    @RequestMapping(value="/register")
    public String register( ModelMap model){
        return "register";
    }

    @RequestMapping(value="/checkRegister",method=RequestMethod.POST)
    public void checkRegister(User user, HttpServletResponse response)throws Exception{
        Boolean isSuccess = userService.register(user.getAccountName(),user.getUserName(),user.getPassword());
        PrintWriter printWriter = response.getWriter();
        if(isSuccess!=null){
            if(isSuccess){
                printWriter.print("success");

            }else{
                printWriter.print("failed");

            }
        }else {
            printWriter.print("conquered");

        }

    }

    @RequestMapping(value="/register_success")
    public String registerSuccess(){
        return "register_success";

    }

    @RequestMapping(value="/records")
    public String getRecords(HttpServletRequest request, ModelMap model){
        User user = (User)request.getSession().getAttribute("user");
        if(user!=null){
            String pageSizeString = request.getParameter("pageSize");
            String pageString = request.getParameter("page");
            if (pageSizeString==null||pageSizeString.equals("")){
                pageSizeString = "10";
            }
            if (pageString==null||pageString.equals("")||pageString.equals("0")){
                pageString = "1";
            }
            int pageSize;
            int preNumber;
            try {
                pageSize = Integer.parseInt(pageSizeString);
            }catch (NumberFormatException e){
                e.printStackTrace();
                pageSize = 10;
            }
            try {
                if(Integer.parseInt(pageString) >= 1){
                    preNumber = (Integer.parseInt(pageString)-1)*pageSize;
                }else{
                    preNumber = 0;
                }

            }catch (NumberFormatException e){
                e.printStackTrace();
                preNumber = 10;
            }
            System.out.println("第"+preNumber+"个数据,第"+pageString+"页,每页"+pageSize+"个");
            System.out.println("访问方式"+request.getMethod());
            System.out.println("用户警察出警"+user.toString());
            model.addAttribute("userName",user.getUserName());

            model.addAttribute("records",userService.getRecords(preNumber, pageSize,user.getUserId()));
            model.addAttribute("number",userService.getNumber(user.getUserId()));
            model.addAttribute("currentPage",pageString);
            model.addAttribute("pageSize",pageSize);
        }
        return "records";

    }
    @RequestMapping(value="/statistic")
    public String getStatistic(HttpServletRequest request, ModelMap model) throws Exception{
        User user = (User)request.getSession().getAttribute("user");
        if(user!=null){
            model.addAttribute("dayRecordNumber",userService.getDayRecordNumber(user.getUserId()));
            int sevenDaysRecordNumber = userService.getSevenDaysRecordNumber(user.getUserId());
            model.addAttribute("sevenDaysRecordNumber",sevenDaysRecordNumber);
            model.addAttribute("sevenDaysRecordAverageNumber",sevenDaysRecordNumber*1.f/7);
            int thirtyDaysRecordNumber = userService.getThirtyDaysRecordNumber(user.getUserId());
            model.addAttribute("thirtyDaysRecordNumber",thirtyDaysRecordNumber);
            model.addAttribute("thirtyDaysRecordAverageNumber",thirtyDaysRecordNumber*1.f/30);
            int totalNumber = userService.getTotalRecordNumber(user.getUserId());
            int totalDays = userService.getTotalDays(user.getUserId());
            if(totalDays==0){
                totalDays=1;
            }
            model.addAttribute("totalNumber",totalNumber);
            model.addAttribute("totalDays",totalDays);
            model.addAttribute("averageNumber",totalNumber*1.f/totalDays);
        }
        return "statistic";
    }

    @RequestMapping(value="/finish_tomato",method=RequestMethod.POST)
    public void finishTomato(Record record,HttpServletRequest request,HttpServletResponse response) throws Exception{
        User user = (User)request.getSession().getAttribute("user");
        if(user!=null){
            userService.insertRecord(record.getStartTime(),record.getEndTime(),record.getPeriodTime(),record.getNumber(),user.getUserId());
            PrintWriter printWriter = response.getWriter();
            printWriter.write("insert_success");
        }
    }

    @RequestMapping(value="/logout")
    public String logout(HttpServletRequest request, SessionStatus sessionStatus){
        request.getSession().removeAttribute("user");
        request.getSession().invalidate();
        sessionStatus.setComplete();
        return "redirect:/";

    }




}