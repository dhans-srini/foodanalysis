package com.foodanalysis.data.access;

import com.foodanalysis.data.access.exception.DataAccessException;

public interface DataModifier {

  public <T> T insert(T t) throws DataAccessException;

}
