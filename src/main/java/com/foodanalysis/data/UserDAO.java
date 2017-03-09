package com.foodanalysis.data;

import java.util.List;

import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.AdminUser;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;

public interface UserDAO {

  void saveUser(User user) throws DataServiceException;

  User getUserByEmail(String email) throws DataServiceException;

  User getUserById(int id) throws DataServiceException;

  void saveAdminUser(AdminUser adminUser) throws DataServiceException;

  AdminUser getAdminUserById(int id) throws DataServiceException;

  AdminUser getAdminUserByEmail(String email) throws DataServiceException;

  List<User> getAllUsers() throws DataServiceException;

  List<ContactUsInfo> getAllContactUsInfo() throws DataServiceException;

  List<SearchItem> getSearchItems(String search) throws DataServiceException;

  List<AdminUser> getAllAdminUsers(AdminUser adminUser) throws DataServiceException;



}
