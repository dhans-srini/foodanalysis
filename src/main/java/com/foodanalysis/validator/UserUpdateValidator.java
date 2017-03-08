package com.foodanalysis.validator;

import static org.apache.commons.lang3.StringUtils.isNotEmpty;
import static org.springframework.validation.ValidationUtils.rejectIfEmptyOrWhitespace;

import org.apache.commons.validator.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.foodanalysis.model.User;

@Component
public class UserUpdateValidator implements Validator {

  @Override
  public boolean supports(Class<?> cls) {
    return User.class.isAssignableFrom(cls);
  }

  @Override
  public void validate(Object target, Errors errors) {
    rejectIfEmptyOrWhitespace(errors, "firstName", "err_first_name", "First Name is Required");
    rejectIfEmptyOrWhitespace(errors, "lastName", "err_last_name", "Last Name is Required");
    User user = (User) target;
    if (user.getAge().equals("NONE")) {
      errors.rejectValue("age", "err_age", "Age is Required");
    }
    if (isNotEmpty(user.getWeightString()) && !isValidNumber(user.getWeightString().toString())) {
      errors.rejectValue("weightString", "err_weightString", "Invalid weight");
    }

    if (isNotEmpty(user.getHeightInFeetsString())
        && !isValidNumber(user.getHeightInFeetsString().toString())) {
      errors.rejectValue("HeightInFeetsString", "err_height", "Invalid Height");
    }

    if (isNotEmpty(user.getHeightInFeetsString())
        && !isValidNumber(user.getHeightInFeetsString().toString())) {
      errors.rejectValue("HeightWithRemainingInchString", "err_weightRemString", "Invalid   feets");
    }
    if (isNotEmpty(user.getPhone())
        && (!isValidNumber(user.getPhone()) || user.getPhone().length() != 10)) {
      errors.rejectValue("phone", "err_phone", "Invalid  phone");
    }
  }

  private static boolean isValidNumber(String number) {
    return number.matches("[0-9]+");
  }


}