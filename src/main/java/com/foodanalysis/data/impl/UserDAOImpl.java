package com.foodanalysis.data.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodanalysis.data.UserDAO;
import com.foodanalysis.data.access.DataModifier;
import com.foodanalysis.data.access.DataRetriver;
import com.foodanalysis.data.access.exception.DuplicateRecordException;
import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
  private static Logger logger = Logger.getLogger(UserDAOImpl.class);
  @Autowired
  private DataRetriver dataRetriver;
  @Autowired
  private DataModifier dataModifier;

  public DataRetriver getDataRetriver() {
    return dataRetriver;
  }


  public void setDataRetriver(DataRetriver dataRetriver) {
    this.dataRetriver = dataRetriver;
  }

  public DataModifier getDataModifier() {
    return dataModifier;
  }


  public void setDataModifier(DataModifier dataModifier) {
    this.dataModifier = dataModifier;
  }


  @Override
  public void saveUser(User user) throws DataServiceException {
    try {
      dataModifier.insert(user);
    } catch (DuplicateRecordException de) {
      throw new DataServiceException("Email already exist.", de);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public User getUserByEmail(String email) throws DataServiceException {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("emailId", email);
      return dataRetriver.retrieveObjectByHQL("From User u where u.email=:emailId", params);
    } catch (DuplicateRecordException de) {
      throw new DataServiceException("Email already exist.", de);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }



}
