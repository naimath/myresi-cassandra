package com.zuabmulabs.myresi.model;

import org.springframework.data.cassandra.mapping.Column;
import org.springframework.data.cassandra.mapping.PrimaryKey;
import org.springframework.data.cassandra.mapping.Table;

@Table(value = "registeredusers")
public class User {
	
		@PrimaryKey
		@Column(value = "email")
		String email;		
		
		@Column(value = "firstname")
		String firstName;
		
		@Column(value = "lastname")
		String lastName;	
		
		@Column(value = "fullname")
		String fullName;	
		
		@Column(value = "password")
		String password;
		
		@Column(value = "activationtoken")
		String activationToken;
		
		@Column(value = "activate")
		String activate;
		@Column(value = "aboutme")
		String aboutMe;
		@Column(value = "city")
		String city;
		@Column(value = "state")
		String state;
		@Column(value = "country")
		String country;
		@Column(value = "position")
		String position;
		@Column(value = "currentworkplace")
		String currentWorkplace;
		@Column(value = "workfield")
		String workField;
		@Column(value = "educationalqualification")
		String educationalQualification;
		@Column(value = "experskills")
		String expertSkills;
		@Column(value = "intermediateskills")
		String intermediateSkills;
		@Column(value = "familiarskills")
		String familiarSkills;
		@Column(value = "profileAdded")
		String profileadded;
		@Column(value = "image")
		byte[] image;
		@Column(value = "dob")
		private String dateOfBirth;
		@Column(value = "zipcode")
		private String zipCode;
		
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
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getActivationToken() {
			return activationToken;
		}
		public void setActivationToken(String activationToken) {
			this.activationToken = activationToken;
		}
		public String getActivate() {
			return activate;
		}
		public void setActivate(String activate) {
			this.activate = activate;
		}
		public String getAboutMe() {
			return aboutMe;
		}
		public void setAboutMe(String aboutMe) {
			this.aboutMe = aboutMe;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		public String getCurrentWorkplace() {
			return currentWorkplace;
		}
		public void setCurrentWorkplace(String currentWorkplace) {
			this.currentWorkplace = currentWorkplace;
		}
		public String getWorkField() {
			return workField;
		}
		public void setWorkField(String workField) {
			this.workField = workField;
		}
		public String getEducationalQualification() {
			return educationalQualification;
		}
		public void setEducationalQualification(String educationalQualification) {
			this.educationalQualification = educationalQualification;
		}
		public String getExpertSkills() {
			return expertSkills;
		}
		public void setExpertSkills(String expertSkills) {
			this.expertSkills = expertSkills;
		}
		public String getIntermediateSkills() {
			return intermediateSkills;
		}
		public void setIntermediateSkills(String intermediateSkills) {
			this.intermediateSkills = intermediateSkills;
		}
		public String getFamiliarSkills() {
			return familiarSkills;
		}
		public void setFamiliarSkills(String familiarSkills) {
			this.familiarSkills = familiarSkills;
		}
		public String getProfileadded() {
			return profileadded;
		}
		public void setProfileadded(String profileadded) {
			this.profileadded = profileadded;
		}
		public byte[] getImage() {
			return image;
		}
		public void setImage(byte[] image) {
			this.image = image;
		}
		public void setDateOfBirth(String dateOfBirth) {
			this.dateOfBirth = dateOfBirth;			
		}
		public String getDateOfBirth() {
			return this.dateOfBirth;			
		}
		public String getFullName() {
			return fullName;
		}
		public void setFullName(String fullName) {
			this.fullName = fullName;
		}
		public String getZipCode() {
			return zipCode;
		}
		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}
		
}
