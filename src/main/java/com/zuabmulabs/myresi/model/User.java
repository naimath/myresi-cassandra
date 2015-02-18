package com.zuabmulabs.myresi.model;

import org.springframework.data.cassandra.mapping.Column;
import org.springframework.data.cassandra.mapping.PrimaryKey;
import org.springframework.data.cassandra.mapping.Table;

@Table(value = "registeredusers")
public class User {
		@PrimaryKey
		String id;
		
		@Column(value = "firstname")
		String firstName;
		@Column(value = "lastname")
		String lastName;
		@Column(value = "email")
		String email;
		@Column(value = "password")
		String password;
		@Column(value = "activationtoken")
		String activationToken;
		@Column(value = "activate")
		String activate;
		
		
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

}
