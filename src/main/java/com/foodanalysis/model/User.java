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
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
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

  @Column(name = "last_login")
  private Date lastLogin;

  @Column(name = "last_updated_on")
  private Date lastUpdatedOn;

  @Transient
  private String passwordString;

  @Transient
  private String confirmPasswordString;


  private String age;

  private String gender;

  private Integer weight;

  @Column(name = "height_feet")
  private Integer HeightInFeets;

  @Column(name = "height_inch")
  private Integer HeightWithRemainingInch;

  @Transient
  private String weightString;

  @Transient
  private String HeightInFeetsString;

  @Transient
  private String HeightWithRemainingInchString;

  private String alergies;

  @Column(name = "health_issues")
  private String healthIssues;

  private String phone;

  @Column(name = "is_active")
  private Boolean isActive;

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

  public Date getLastLogin() {
    return lastLogin;
  }

  public void setLastLogin(Date lastLogin) {
    this.lastLogin = lastLogin;
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

  public String getAge() {
    return age;
  }

  public void setAge(String age) {
    this.age = age;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public Integer getWeight() {
    return weight;
  }

  public void setWeight(Integer weight) {
    this.weight = weight;
  }

  public Integer getHeightInFeets() {
    return HeightInFeets;
  }

  public void setHeightInFeets(Integer heightInFeets) {
    HeightInFeets = heightInFeets;
  }

  public Integer getHeightWithRemainingInch() {
    return HeightWithRemainingInch;
  }

  public void setHeightWithRemainingInch(Integer heightWithRemainingInch) {
    HeightWithRemainingInch = heightWithRemainingInch;
  }

  public String getWeightString() {
    return weightString;
  }

  public void setWeightString(String weightString) {
    this.weightString = weightString;
  }

  public String getHeightInFeetsString() {
    return HeightInFeetsString;
  }

  public void setHeightInFeetsString(String heightInFeetsString) {
    HeightInFeetsString = heightInFeetsString;
  }

  public String getHeightWithRemainingInchString() {
    return HeightWithRemainingInchString;
  }

  public void setHeightWithRemainingInchString(String heightWithRemainingInchString) {
    HeightWithRemainingInchString = heightWithRemainingInchString;
  }

  public String getAlergies() {
    return alergies;
  }

  public void setAlergies(String alergies) {
    this.alergies = alergies;
  }

  public String getHealthIssues() {
    return healthIssues;
  }

  public void setHealthIssues(String healthIssues) {
    this.healthIssues = healthIssues;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public Boolean getIsActive() {
    return isActive;
  }

  public void setIsActive(Boolean isActive) {
    this.isActive = isActive;
  }

  public Date getLastUpdatedOn() {
    return lastUpdatedOn;
  }

  public void setLastUpdatedOn(Date lastUpdatedOn) {
    this.lastUpdatedOn = lastUpdatedOn;
  }
}
