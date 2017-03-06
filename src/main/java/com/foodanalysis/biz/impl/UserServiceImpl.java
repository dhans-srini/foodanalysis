package com.foodanalysis.biz.impl;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodanalysis.biz.UserService;
import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.biz.utils.PasswordUtils;
import com.foodanalysis.data.UserDAO;
import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.User;

@Service
public class UserServiceImpl implements UserService {

  private static Logger logger = Logger.getLogger(UserServiceImpl.class);

  @Autowired
  private UserDAO userDAO;

  @Override
  public void doSaveUser(User user) throws BusinessServiceException {
    try {
      byte[] salt = PasswordUtils.getNextSalt();
      byte[] password = PasswordUtils.hash(user.getPasswordString().toCharArray(), salt);
      if (isNotBlank(user.getWeightString())) {
        user.setWeight(Integer.parseInt(user.getWeightString()));
      }
      if (isNotBlank(user.getHeightInFeetsString())) {
        user.setHeightInFeets(Integer.parseInt(user.getHeightInFeetsString()));
      }
      if (isNotBlank(user.getHeightWithRemainingInchString())) {
        user.setHeightWithRemainingInch(Integer.parseInt(user.getHeightWithRemainingInchString()));
      }
      user.setPassword(password);
      user.setPasswordSalt(salt);
      user.setConfirmPasswordString(null);
      user.setPasswordString(null);
      user.setIsActive(true);
      userDAO.saveUser(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }

  }

  @Override
  public User doAuthenticateUser(String email, String password) throws BusinessServiceException {
    User user = null;
    try {
      user = userDAO.getUserByEmail(email);
      if (user == null) {
        throw new BusinessServiceException("Email is not registered");
      }
      if (!PasswordUtils.isExpectedPassword(password.toCharArray(), user.getPasswordSalt(),
          user.getPassword())) {
        throw new BusinessServiceException("Invalid password");
      }
      user.setLastLogin(new Date());
      userDAO.saveUser(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return user;
  }



}
