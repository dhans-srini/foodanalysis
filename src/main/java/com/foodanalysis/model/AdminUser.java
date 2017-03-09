package com.foodanalysis.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "admin_users")
public class AdminUser {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Integer id;

  @Column(name = "first_name")
  private String firstName;

  @Column(name = "last_name")
  private String lastName;

  @Column(name = "email")
  private String email;

  @Column(name = "password_salt")
  private byte[] passwordSalt;

  @Column(name = "password")
  private byte[] password;

  @Column(name = "second_password")
  private byte[] secondPassword;

  @Column(name = "last_login")
  private Date lastLogin;

  @Column(name = "is_active")
  private Boolean isActive;

  @Column(name = "is_super_admin")
  private Boolean isSuperAdmin;

  @Transient
  private String passwordString;

  @Transient
  private String confirmPasswordString;

  @Transient
  private String secondPasswordString;

  @Transient
  private String confirmSecondPasswordString;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public byte[] getPasswordSalt() {
    return passwordSalt;
  }

  public void setPasswordSalt(byte[] passwordSalt) {
    this.passwordSalt = passwordSalt;
  }

  public byte[] getPassword() {
    return password;
  }

  public void setPassword(byte[] password) {
    this.password = password;
  }

  public byte[] getSecondPassword() {
    return secondPassword;
  }

  public void setSecondPassword(byte[] secondPassword) {
    this.secondPassword = secondPassword;
  }

  public Date getLastLogin() {
    return lastLogin;
  }

  public void setLastLogin(Date lastLogin) {
    this.lastLogin = lastLogin;
  }

  public String getPasswordString() {
    return passwordString;
  }

  public void setPasswordString(String passwordString) {
    this.passwordString = passwordString;
  }

  public String getConfirmPasswordString() {
    return confirmPasswordString;
  }

  public void setConfirmPasswordString(String confirmPasswordString) {
    this.confirmPasswordString = confirmPasswordString;
  }

  public String getSecondPasswordString() {
    return secondPasswordString;
  }

  public void setSecondPasswordString(String secondPasswordString) {
    this.secondPasswordString = secondPasswordString;
  }

  public String getConfirmSecondPasswordString() {
    return confirmSecondPasswordString;
  }

  public void setConfirmSecondPasswordString(String confirmSecondPasswordString) {
    this.confirmSecondPasswordString = confirmSecondPasswordString;
  }

  public Boolean getIsActive() {
    return isActive;
  }

  public void setIsActive(Boolean isActive) {
    this.isActive = isActive;
  }

  public Boolean getIsSuperAdmin() {
    return isSuperAdmin;
  }

  public void setIsSuperAdmin(Boolean isSuperAdmin) {
    this.isSuperAdmin = isSuperAdmin;
  }

}
