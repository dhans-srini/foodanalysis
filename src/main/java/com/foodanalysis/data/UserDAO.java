package com.foodanalysis.data;

import java.util.List;

import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.User;

public interface UserDAO {

  void saveUser(User user) throws DataServiceException;

  User getUserByEmail(String email) throws DataServiceException;

  User getUserById(int id) throws DataServiceException;


  List<User> getAllUsers(User user) throws DataServiceException;

  List<ContactUsInfo> getAllContactUsInfo() throws DataServiceException;

  Object[] getSearchItems(String search, String search2) throws DataServiceException;



}
