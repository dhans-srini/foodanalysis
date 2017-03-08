package com.foodanalysis.biz.impl;

import static com.foodanalysis.biz.utils.PasswordUtils.getNextSalt;
import static com.foodanalysis.biz.utils.PasswordUtils.hash;
import static com.foodanalysis.biz.utils.PasswordUtils.isExpectedPassword;
import static org.apache.commons.lang3.StringUtils.isNotBlank;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.foodanalysis.biz.UserService;
import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.biz.utils.PasswordUtils;
import com.foodanalysis.data.UserDAO;
import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.AdminUser;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;

@Service
public class UserServiceImpl implements UserService {

  private static Logger logger = Logger.getLogger(UserServiceImpl.class);

  @Autowired
  private UserDAO userDAO;
  @Autowired
  private JavaMailSender mailSender;

  @Override
  public void doSaveUser(User user) throws BusinessServiceException {
    try {
      byte[] salt = getNextSalt();
      byte[] password = hash(user.getPasswordString().toCharArray(), salt);
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
      if (!user.getIsActive()) {
        throw new BusinessServiceException("Your accout is deactivated.");
      }
      user.setLastLogin(new Date());
      userDAO.saveUser(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return user;
  }

  @Override
  public User doGetUserById(int id) throws BusinessServiceException {
    User user = null;
    try {
      user = userDAO.getUserById(id);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return user;
  }

  @Override
  public void doUpdateUser(User user) throws BusinessServiceException {
    try {
      User updateUser = userDAO.getUserById(user.getId());
      updateUser.setFirstName(user.getFirstName());
      updateUser.setLastName(user.getLastName());
      updateUser.setAge(user.getAge());
      updateUser.setGender(user.getGender());
      updateUser.setAlergies(user.getAlergies());
      updateUser.setHealthIssues(user.getHealthIssues());
      updateUser.setPhone(user.getPhone());
      if (isNotBlank(user.getWeightString())) {
        updateUser.setWeight(Integer.parseInt(user.getWeightString()));
      } else {
        updateUser.setWeight(null);
      }
      if (isNotBlank(user.getHeightInFeetsString())) {
        updateUser.setHeightInFeets(Integer.parseInt(user.getHeightInFeetsString()));
      } else {
        updateUser.setHeightInFeets(null);
      }
      if (isNotBlank(user.getHeightWithRemainingInchString())) {
        updateUser
            .setHeightWithRemainingInch(Integer.parseInt(user.getHeightWithRemainingInchString()));
      } else {
        updateUser.setHeightWithRemainingInch(null);
      }
      if (user.getIsActive() != null) {
        updateUser.setIsActive(user.getIsActive());
      }
      userDAO.saveUser(updateUser);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }

  }

  @Override
  public void doUpdateUserPassword(User user, String passwordString)
      throws BusinessServiceException {
    try {
      byte[] salt = PasswordUtils.getNextSalt();
      byte[] password = PasswordUtils.hash(passwordString.toCharArray(), salt);
      User userUpdate = userDAO.getUserById(user.getId());
      userUpdate.setPasswordSalt(salt);
      userUpdate.setPassword(password);
      userDAO.saveUser(userUpdate);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }

  @Override
  public void doSaveAdminUser(AdminUser adminUser) throws BusinessServiceException {
    try {
      byte[] salt = getNextSalt();
      adminUser.setPasswordSalt(salt);

      byte[] password = hash(adminUser.getPasswordString().toCharArray(), salt);
      adminUser.setPassword(password);

      adminUser.setConfirmPasswordString(null);
      adminUser.setPasswordString(null);

      byte[] secPassword = hash(adminUser.getSecondPasswordString().toCharArray(), salt);
      adminUser.setSecondPassword(secPassword);
      adminUser.setSecondPasswordString(null);
      adminUser.setConfirmSecondPasswordString(null);


      adminUser.setIsActive(true);
      userDAO.saveAdminUser(adminUser);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }

  }

  @Override
  public AdminUser doGetAdminUserById(int id) throws BusinessServiceException {
    AdminUser adminUser = null;
    try {
      adminUser = userDAO.getAdminUserById(id);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return adminUser;
  }

  @Override
  public void doUpdateAdminUser(AdminUser adminUser) throws BusinessServiceException {
    try {
      AdminUser updateAdminUser = userDAO.getAdminUserById(adminUser.getId());
      updateAdminUser.setFirstName(adminUser.getFirstName());
      updateAdminUser.setLastName(adminUser.getLastName());
      userDAO.saveAdminUser(updateAdminUser);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }

  }

  @Override
  public void doUpdateAdminUserPassword(AdminUser adminUser, String pwd, String secPwd)
      throws BusinessServiceException {
    try {
      byte[] salt = getNextSalt();
      adminUser.setPasswordSalt(salt);

      byte[] password = hash(pwd.toCharArray(), salt);
      adminUser.setPassword(password);

      byte[] secPassword = hash(secPwd.toCharArray(), salt);
      adminUser.setSecondPassword(secPassword);
      userDAO.saveAdminUser(adminUser);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }

  @Override
  public AdminUser doAuthenticateAdminUser(String email, String password, String secPassword)
      throws BusinessServiceException {
    AdminUser adminUser = null;
    try {
      adminUser = userDAO.getAdminUserByEmail(email);
      if (adminUser == null) {
        throw new BusinessServiceException("Email id is not registered");
      }
      if (!isExpectedPassword(password.toCharArray(), adminUser.getPasswordSalt(),
          adminUser.getPassword())) {
        throw new BusinessServiceException("Invalid password");
      }
      if (!isExpectedPassword(secPassword.toCharArray(), adminUser.getPasswordSalt(),
          adminUser.getSecondPassword())) {
        throw new BusinessServiceException("Invalid second password");
      }
      adminUser.setLastLogin(new Date());
      userDAO.saveAdminUser(adminUser);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return adminUser;
  }

  @Override
  public List<User> doGetAllUsers() throws BusinessServiceException {
    List<User> users = null;
    try {
      users = userDAO.getAllUsers();
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return users;
  }

  @Override
  public List<ContactUsInfo> doGetAllContactUsInfo() throws BusinessServiceException {
    List<ContactUsInfo> contact = null;
    try {
      contact = userDAO.getAllContactUsInfo();
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return contact;
  }

  @Override
  public List<SearchItem> doGetSearchItems(String search, User user)
      throws BusinessServiceException {
    List<SearchItem> searchItems = null;
    try {
      searchItems = userDAO.getSearchItems(search);
      if (CollectionUtils.isEmpty(searchItems)) {
        List<ContactUsInfo> contactUsInfos = userDAO.getAllContactUsInfo();
        SimpleMailMessage email = new SimpleMailMessage();
        email.setFrom("foodanalysis");
        email.setTo(
            contactUsInfos.stream().map(ContactUsInfo::getEmail).toArray(s -> new String[s]));
        email.setSubject("Search not found");
        email.setText("The user " + user.getFirstName() + " " + user.getLastName() + "("
            + user.getEmail() + ") searched the '" + search + "'.");

        // sends the e-mail
        mailSender.send(email);
      }
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return searchItems;
  }

  @Override
  public void doChangePassword(String email) throws BusinessServiceException {
    try {
      User userUpdate = userDAO.getUserByEmail(email);
      if (userUpdate == null) {
        throw new BusinessServiceException("Email not registered.");
      }
      String passwordString = PasswordUtils.generateRandomPassword(6);
      byte[] salt = getNextSalt();
      byte[] password = hash(passwordString.toCharArray(), salt);
      userUpdate.setPasswordSalt(salt);
      userUpdate.setPassword(password);
      userDAO.saveUser(userUpdate);
      SimpleMailMessage msg = new SimpleMailMessage();
      msg.setFrom("foodanalysis");
      msg.setTo(email);
      msg.setSubject("New Password for food analysis");
      msg.setText("Your new Password " + passwordString);
      mailSender.send(msg);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }



}
