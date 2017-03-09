package com.foodanalysis.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodanalysis.biz.UserService;
import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.model.AdminUser;
import com.foodanalysis.model.User;
import com.foodanalysis.validator.AdminUserUpdateValidator;
import com.foodanalysis.validator.AdminUserValidator;

@SuppressWarnings("deprecation")
@Controller
public class AdminController {

  private static Logger logger = Logger.getLogger(AdminController.class);

  @Autowired
  private UserService userService;

  @Autowired
  private AdminUserValidator adminUserValidator;

  @Autowired
  private AdminUserUpdateValidator userUpdateValidator;

  @RequestMapping(value = "/adminUserRegistration", method = RequestMethod.GET)
  public String registration(Model model) {
    model.addAttribute("adminUser", new AdminUser());
    return "adminRegistration";
  }

  @RequestMapping(value = "/adminUserLoginView", method = RequestMethod.GET)
  public String login() {
    return "adminUserLogin";
  }

  @RequestMapping(value = "/doRegisterAdminUser", method = RequestMethod.POST)
  public String saveUser(@ModelAttribute("adminUser") AdminUser adminUser,
      BindingResult bindingResult, Model model, HttpSession session) {
    try {
      adminUserValidator.validate(adminUser, bindingResult);
      if (bindingResult.hasErrors()) {
        return "adminRegistration";
      }
      userService.doSaveAdminUser(adminUser);
      model.addAttribute("info", "Account created successfully. Goto login page for login...");
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "adminRegistration";
  }

  @RequestMapping(value = "/adminUserprofile/{id}", method = RequestMethod.GET)
  public String gotoUserProfile(@PathVariable int id, Model model) {
    AdminUser adminUser = null;
    try {
      adminUser = userService.doGetAdminUserById(id);
      model.addAttribute("adminUser", adminUser);
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "/adminUserProfile";
  }

  @RequestMapping(value = "/doUpdateAdminUser", method = RequestMethod.POST)
  public String updateUser(@ModelAttribute("adminUser") AdminUser adminUser,
      BindingResult bindingResult, Model model, HttpSession session) {
    try {
      userUpdateValidator.validate(adminUser, bindingResult);
      if (bindingResult.hasErrors()) {
        return "adminUserProfile";
      }
      AdminUser upd = userService.doUpdateAdminUser(adminUser);
      session.setAttribute("adminUser", upd);
      return "redirect:views/adminUserDashboard.jsp?msg=prof_upd_suc";
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "adminUserProfile";
  }

  @RequestMapping(value = "/doChangeAdminUserPassword", method = RequestMethod.POST)
  public String changePassword(@RequestParam String password, @RequestParam String confPassword,
      @RequestParam String secPassword, @RequestParam String confSecPassword, Model model,
      HttpSession session) {
    try {
      if (password != null && !password.equals(confPassword)) {
        model.addAttribute("error", "Password and Confirm Password mismatch");
      } else if (password != null && password.length() < 5) {
        model.addAttribute("error", "Password should be atleast 5 character.");
      } else if (secPassword != null && !secPassword.equals(confSecPassword)) {
        model.addAttribute("error", "Second Password and Confirm Second Password mismatch");
      } else if (secPassword != null && secPassword.length() < 5) {
        model.addAttribute("error", "Second Password should be atleast 5 character.");
      } else {
        AdminUser adminUser = (AdminUser) session.getAttribute("adminUser");
        userService.doUpdateAdminUserPassword(adminUser, password, secPassword);
        return "redirect:views/adminUserDashboard.jsp?msg=pwd_suc";
      }
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "adminUserChangePassword";
  }

  @RequestMapping(value = "/doAdminLogin", method = RequestMethod.POST)
  public String login(@RequestParam String email, @RequestParam String password,
      @RequestParam String secPassword, Model model, HttpSession session) {
    try {
      if (!EmailValidator.getInstance().isValid(email)) {
        model.addAttribute("error", "Invalid email id");
      } else {
        AdminUser adminUser = userService.doAuthenticateAdminUser(email, password, secPassword);
        session.setAttribute("adminUser", adminUser);

        return "redirect:views/adminUserDashboard.jsp";
      }
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "adminUserLogin";
  }

  @RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
  public String viewUsers(Model model) {
    List<User> users = null;
    try {
      users = userService.doGetAllUsers();
      model.addAttribute("userList", users);
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "viewUsers";
  }

  @RequestMapping(value = "/viewAdminUsers", method = RequestMethod.GET)
  public String viewAdminUsers(Model model, HttpSession session) {
    List<AdminUser> adminUsers = null;
    try {
      AdminUser adminUser = (AdminUser) session.getAttribute("adminUser");
      adminUsers = userService.doGetAllAdminUsers(adminUser);
      model.addAttribute("adminUserList", adminUsers);
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "viewAdminUsers";
  }

  @RequestMapping(value = "/adminUserStsUpdate/{userId}", method = RequestMethod.GET)
  public String adminUserStsUpdate(@PathVariable int userId, Model model, HttpSession session,
      @RequestParam Boolean sts) {
    List<AdminUser> adminUsers = null;
    try {
      userService.doChangeAdminUserStatus(userId, sts);
      AdminUser adminUser = (AdminUser) session.getAttribute("adminUser");
      adminUsers = userService.doGetAllAdminUsers(adminUser);
      model.addAttribute("adminUserList", adminUsers);
      model.addAttribute("info", "User updated successfully");
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "viewAdminUsers";
  }
}
