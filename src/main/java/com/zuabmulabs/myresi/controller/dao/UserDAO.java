package com.zuabmulabs.myresi.controller.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.stereotype.Repository;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;
import com.datastax.driver.core.querybuilder.Update;
import com.zuabmulabs.myresi.model.User;

@Repository
public class UserDAO {
	
	@Autowired
	private CassandraOperations cassandraOperations;
	
	public User verifyUser(User user) {
		try{
			 Select s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("email", user.getEmail())).and(QueryBuilder.eq("activate", "Y"));
			 
			 ResultSet result = cassandraOperations.query(s);
			 Row row = result.one();
			 if( row == null){
					return null;
			 }
			user.setProfileadded(row.getString("profileadded"));
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return user;
	}

	public boolean editProfle(User user) {
		try{
			Update u =	QueryBuilder.update("registeredusers");
			u.with(QueryBuilder.set("firstname", user.getFirstName()));
			u.with(QueryBuilder.set("lastname", user.getLastName()));
			u.with(QueryBuilder.set("aboutme", user.getAboutMe()));
			u.with(QueryBuilder.set("city", user.getCity()));
			u.with(QueryBuilder.set("state", user.getState()));
			u.with(QueryBuilder.set("country", user.getCountry()));
			u.where(QueryBuilder.eq("email", user.getEmail()));
			cassandraOperations.execute(u);
		}catch(Exception e){
			return false;
		}
			return true;
	}

	public boolean editWork(User user) {
		try{
			Update u =	QueryBuilder.update("registeredusers");
			u.with(QueryBuilder.set("position", user.getPosition()));
			u.with(QueryBuilder.set("currentWorkplace", user.getCurrentWorkplace()));
			u.with(QueryBuilder.set("workField", user.getWorkField()));
			u.with(QueryBuilder.set("educationalQualification", user.getEducationalQualification()));		
			u.where(QueryBuilder.eq("email", user.getEmail()));
			cassandraOperations.execute(u);
		}catch(Exception e){
			return false;
		}
		return true;
	}

	public boolean editSkills(User user) {
		try{
			Update u =	QueryBuilder.update("registeredusers");
			u.with(QueryBuilder.set("expertskills", user.getExpertSkills()));
			u.with(QueryBuilder.set("intermediateskills", user.getIntermediateSkills()));
			u.with(QueryBuilder.set("familiarskills", user.getFamiliarSkills()));	
			u.where(QueryBuilder.eq("email", user.getEmail()));
			cassandraOperations.execute(u);
		}catch(Exception e){
			return false;
		}
		return true;
	}

	public User getProfile(String email) {
		User user;
		try{
			 Select s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("email", email));
			 
			 ResultSet result = cassandraOperations.query(s);
			 Row row = result.one();
			 if( row == null){
					return null;
			 }
			 user = new User();
			 user.setFirstName(row.getString("firstname"));
			 user.setLastName(row.getString("lastname"));
			 user.setCity(row.getString("city"));
			 user.setState(row.getString("state"));
			 user.setCountry(row.getString("country"));
			 user.setExpertSkills(row.getString("expertskills"));
			 user.setFamiliarSkills(row.getString("familiarskills"));
			 user.setAboutMe(row.getString("aboutme"));
			 user.setProfileadded(row.getString("profileadded"));
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return user;
	}
	
}
