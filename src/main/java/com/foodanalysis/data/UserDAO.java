package com.foodanalysis.data;

import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.User;

public interface UserDAO {

  void saveUser(User user) throws DataServiceException;

  User getUserByEmail(String email) throws DataServiceException;



}
