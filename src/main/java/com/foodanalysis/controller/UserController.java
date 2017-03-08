package com.foodanalysis.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodanalysis.biz.UserService;
import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;
import com.foodanalysis.validator.UserUpdateValidator;
import com.foodanalysis.validator.UserValidator;

@SuppressWarnings("deprecation")
@Controller
public class UserController {

  private static Logger logger = Logger.getLogger(UserController.class);

  @Autowired
  private UserService userService;

  @Autowired
  private UserValidator userValidator;
  @Autowired
  private UserUpdateValidator userUpdateValidator;

  @GetMapping("/")
  public String welcome() {
    return "index";
  }

  @RequestMapping(value = "/usrregistration", method = RequestMethod.GET)
  public String registration(Model model) {
    model.addAttribute("user", new User());
    return "userRegistration";
  }

  @RequestMapping(value = "/userloginview", method = RequestMethod.GET)
  public String login() {
    return "userLogin";
  }

  @RequestMapping(value = "/userprofile/{id}", method = RequestMethod.GET)
  public String gotoUserProfile(@PathVariable int id, Model model,
      @RequestParam(required = false) String page) {
    User user = null;
    try {
      user = userService.doGetUserById(id);

      if (user.getWeight() != null) {
        user.setWeightString(user.getWeight().toString());
      }
      if (user.getHeightInFeets() != null) {
        user.setHeightInFeetsString(user.getHeightInFeets().toString());
      }
      if (user.getHeightWithRemainingInch() != null) {
        user.setHeightWithRemainingInchString(user.getHeightWithRemainingInch().toString());
      }

      model.addAttribute("user", user);
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "/userProfile";
  }

  @RequestMapping(value = "/doRegisterUser", method = RequestMethod.POST)
  public String saveUser(@ModelAttribute("user") User user, BindingResult bindingResult,
      Model model, HttpSession session) {
    try {
      userValidator.validate(user, bindingResult);
      if (bindingResult.hasErrors()) {
        return "userRegistration";
      }
      userService.doSaveUser(user);
      session.setAttribute("user", user);
      return "redirect:views/userDashboard.jsp?msg=success";
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userRegistration";
  }

  @RequestMapping(value = "/doUpdateUser", method = RequestMethod.POST)
  public String updateUser(@ModelAttribute("user") User user, BindingResult bindingResult,
      Model model, @RequestParam(required = false) String page, HttpSession session) {
    try {
      userUpdateValidator.validate(user, bindingResult);
      if (bindingResult.hasErrors()) {
        return "userProfile";
      }
      userService.doUpdateUser(user);
      if (session.getAttribute("adminUser") == null) {
        session.setAttribute("user", user);
      }
      model.addAttribute("info", "User updated successfully");
      return "".equals(page) ? "userDashboard" : "redirect:viewUsers?msg=user_upd_success";
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userProfile";
  }

  @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
  public String login(@RequestParam("email") String email,
      @RequestParam("password") String password, Model model, HttpSession session) {
    try {
      if (!EmailValidator.getInstance().isValid(email)) {
        model.addAttribute("error", "Invalid email id");
      }
      User user = userService.doAuthenticateUser(email, password);
      session.setAttribute("user", user);

      return "redirect:views/userDashboard.jsp";
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userLogin";
  }

  @RequestMapping(value = "/doChangeUserPassword", method = RequestMethod.POST)
  public String changePassword(@RequestParam("passwordString") String password,
      @RequestParam("confirmPasswordString") String confirmPassword, Model model,
      HttpSession session) {
    try {
      if (password != null && !password.equals(confirmPassword)) {
        model.addAttribute("error", "Password and Confirm Password mismatch");
      } else if (password != null && password.length() < 5) {
        model.addAttribute("error", "Password should be atleast 5 character.");
      } else {
        User user = (User) session.getAttribute("user");
        userService.doUpdateUserPassword(user, password);
        return "redirect:views/userDashboard.jsp?msg=pwd_suc";
      }
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userChangePassword";
  }

  @RequestMapping(value = "/forgotpwd", method = RequestMethod.POST)
  public String changePassword(@RequestParam String email, Model model) {
    try {

      userService.doChangePassword(email);
      model.addAttribute("info", "Pasword send to that email.");
      return "userForgotPwd";

    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userForgotPwd";
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(HttpSession session) {
    try {
      session.invalidate();
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
    }
    return "redirect:/";
  }

  @RequestMapping(value = "/contactus", method = RequestMethod.GET)
  public String gotoUserProfile(Model model) {
    List<ContactUsInfo> contact = null;
    try {
      contact = userService.doGetAllContactUsInfo();
      model.addAttribute("contactus", contact);
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "contact";
  }

  @RequestMapping(value = "/searchItem", method = RequestMethod.GET)
  public String searchItem(Model model, @RequestParam String search, HttpSession session) {
    List<SearchItem> searchItems = null;
    try {
      User user = (User) session.getAttribute("user");
      searchItems = userService.doGetSearchItems(search, user);
      model.addAttribute("searchItems", searchItems);
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
    }
    return "searchItems";
  }

}
