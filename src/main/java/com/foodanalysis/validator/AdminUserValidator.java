package com.foodanalysis.validator;

import static org.springframework.validation.ValidationUtils.rejectIfEmptyOrWhitespace;

import org.apache.commons.validator.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.foodanalysis.model.AdminUser;
import com.foodanalysis.model.User;

@SuppressWarnings("deprecation")
@Component
public class AdminUserValidator implements Validator {

  @Override
  public boolean supports(Class<?> cls) {
    return User.class.isAssignableFrom(cls);
  }

  @Override
  public void validate(Object target, Errors errors) {
    rejectIfEmptyOrWhitespace(errors, "firstName", "err_first_name", "First Name is Required");
    rejectIfEmptyOrWhitespace(errors, "lastName", "err_last_name", "Last Name is Required");
    rejectIfEmptyOrWhitespace(errors, "email", "err_email", "Email is required");
    rejectIfEmptyOrWhitespace(errors, "passwordString", "err_pass_req", "Password is required");
    rejectIfEmptyOrWhitespace(errors, "confirmPasswordString", "err_conf_pass_req",
        "Confirm Password is required");
    rejectIfEmptyOrWhitespace(errors, "secondPasswordString", "err_sec_pass_req",
        "Second  Password is required");
    rejectIfEmptyOrWhitespace(errors, "confirmSecondPasswordString", "err_conf_sec_pass_req",
        "Confirm Second Password is required");
    AdminUser user = (AdminUser) target;
    if (!EmailValidator.getInstance().isValid(user.getEmail())) {
      errors.rejectValue("email", "err_email_invalid", "Invalid email");
    }
    if (user.getPasswordString() != null
        && !user.getPasswordString().equals(user.getConfirmPasswordString())) {
      errors.rejectValue("passwordString", "err_pass_mismatch",
          "Password and Confirm Password mismatch");
    } else if (user.getPasswordString() != null && user.getPasswordString().length() < 5) {
      errors.rejectValue("passwordString", "err_pass_len",
          "Password should be atleast 5 character.");
    }
    if (user.getSecondPasswordString() != null
        && !user.getSecondPasswordString().equals(user.getConfirmSecondPasswordString())) {
      errors.rejectValue("secondPasswordString", "err_sec_pass_mismatch",
          "Second Password and Second Confirm Password mismatch");
    } else if (user.getSecondPasswordString() != null
        && user.getSecondPasswordString().length() < 5) {
      errors.rejectValue("secondPasswordString", "err_sec_pass_len",
          "Second Password should be atleast 5 character.");
    }
  }

}
