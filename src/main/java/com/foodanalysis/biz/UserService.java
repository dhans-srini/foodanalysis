package com.foodanalysis.biz;

import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.model.User;

public interface UserService {

  void doSaveUser(User user) throws BusinessServiceException;

  User doAuthenticateUser(String email, String password) throws BusinessServiceException;



}
