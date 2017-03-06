package com.foodanalysis.data.access.impl;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodanalysis.data.access.DataModifier;
import com.foodanalysis.data.access.exception.DataAccessException;
import com.foodanalysis.data.access.exception.DuplicateRecordException;

@Repository
public class DataModifierImpl implements DataModifier {

  private static Logger logger = Logger.getLogger(DataModifierImpl.class);
  @Autowired
  private SessionFactory sessionFactory;

  public SessionFactory getSessionFactory() {
    return sessionFactory;
  }

  public void setSessionFactory(SessionFactory sessionFactory) {
    this.sessionFactory = sessionFactory;
  }

  @Override
  public <T> T insert(T type) throws DataAccessException {
    try {
      logger.debug("Preparing to save object.");
      Session session = getSessionFactory().getCurrentSession();
      session.saveOrUpdate(type);
      session.flush();
      logger.info("Data saved successfully.");
    } catch (ConstraintViolationException cvException) {
      logger.error("", cvException);
      throw new DuplicateRecordException(cvException.getMessage(), cvException);
    } catch (HibernateException hibernateException) {
      throw new DataAccessException(hibernateException.getMessage(), hibernateException);
    } catch (Exception exception) {
      throw new DataAccessException(exception.getMessage(), exception);
    }
    return type;
  }

}
