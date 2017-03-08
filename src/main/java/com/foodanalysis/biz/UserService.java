package com.foodanalysis.biz;

import java.util.List;

import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.model.AdminUser;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;

public interface UserService {

  void doSaveUser(User user) throws BusinessServiceException;

  User doAuthenticateUser(String email, String password) throws BusinessServiceException;

  User doGetUserById(int id) throws BusinessServiceException;

  void doUpdateUser(User user) throws BusinessServiceException;

  void doUpdateUserPassword(User user, String password) throws BusinessServiceException;

  void doSaveAdminUser(AdminUser adminUser) throws BusinessServiceException;

  AdminUser doGetAdminUserById(int id) throws BusinessServiceException;

  void doUpdateAdminUser(AdminUser adminUser) throws BusinessServiceException;

  void doUpdateAdminUserPassword(AdminUser adminUser, String password, String secPassword)
      throws BusinessServiceException;

  AdminUser doAuthenticateAdminUser(String email, String password, String secPassword)
      throws BusinessServiceException;

  List<User> doGetAllUsers() throws BusinessServiceException;

  List<ContactUsInfo> doGetAllContactUsInfo() throws BusinessServiceException;

  List<SearchItem> doGetSearchItems(String search, User user) throws BusinessServiceException;

  void doChangePassword(String email) throws BusinessServiceException;



}
