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
public class AdminUserUpdateValidator implements Validator {

  @Override
  public boolean supports(Class<?> cls) {
    return User.class.isAssignableFrom(cls);
  }

  @Override
  public void validate(Object target, Errors errors) {
    rejectIfEmptyOrWhitespace(errors, "firstName", "err_first_name", "First Name is Required");
    rejectIfEmptyOrWhitespace(errors, "lastName", "err_last_name", "Last Name is Required");
    AdminUser user = (AdminUser) target;
    if (!EmailValidator.getInstance().isValid(user.getEmail())) {
      errors.rejectValue("email", "err_email_invalid", "Invalid email");
    }
  }

}
