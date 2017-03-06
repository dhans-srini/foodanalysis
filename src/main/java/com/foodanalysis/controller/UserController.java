package com.foodanalysis.controller;

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
import com.foodanalysis.model.User;
import com.foodanalysis.validator.UserValidator;

@Controller
public class UserController {

  private static Logger logger = Logger.getLogger(UserController.class);

  @Autowired
  private UserService userService;

  @Autowired
  private UserValidator userValidator;

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

  @RequestMapping(value = "/doRegisterUser", method = RequestMethod.POST)
  public String saveUser(@ModelAttribute("user") User user, BindingResult bindingResult,
      Model model) {
    try {
      userValidator.validate(user, bindingResult);
      if (bindingResult.hasErrors()) {
        return "userRegistration";
      }
      userService.doSaveUser(user);
      return "userWelcome";
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userRegistration";
  }

  @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
  public String login(@RequestParam("email") String email,
      @RequestParam("password") String password, Model model) {
    try {
      if (!EmailValidator.getInstance().isValid(email)) {
        model.addAttribute("error", "Invalid email id");
      }
      userService.doAuthenticateUser(email, password);
      return "userWelcome";
    } catch (BusinessServiceException e) {
      model.addAttribute("error", e.getMessage());
      logger.error(e.getMessage(), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      model.addAttribute("error", "System has some issue...");
    }
    return "userLogin";
  }

}
