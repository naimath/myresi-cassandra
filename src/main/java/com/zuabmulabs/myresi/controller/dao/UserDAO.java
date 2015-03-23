package com.zuabmulabs.myresi.controller.dao;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.stereotype.Repository;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Statement;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;
import com.datastax.driver.core.querybuilder.Update;
import com.datastax.driver.core.utils.Bytes;
import com.zuabmulabs.myresi.model.User;

@Repository
public class UserDAO {
	private static final Logger logger = Logger.getLogger(LoginDAO.class);
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
			logger.error("Error Occured whild doing verifyUser .. "+e);
			return null;
		}
		return user;
	}

	public boolean editProfle(User user) {
		try{
			Update u =	QueryBuilder.update("registeredusers");
			u.with(QueryBuilder.set("firstname", user.getFirstName()!=null?user.getFirstName().toLowerCase():user.getFirstName()));
			u.with(QueryBuilder.set("lastname", user.getLastName()!=null?user.getLastName():user.getLastName()));
			u.with(QueryBuilder.set("aboutme", user.getAboutMe()));
			u.with(QueryBuilder.set("city", user.getCity()));
			u.with(QueryBuilder.set("state", user.getState()));
			u.with(QueryBuilder.set("country", user.getCountry()));
			u.with(QueryBuilder.set("dob", user.getDateOfBirth()));
			u.with(QueryBuilder.set("position", user.getPosition()));
			u.with(QueryBuilder.set("currentWorkplace", user.getCurrentWorkplace()));
			u.with(QueryBuilder.set("workField", user.getWorkField()));
			u.with(QueryBuilder.set("educationalQualification", user.getEducationalQualification()));	
			
			u.where(QueryBuilder.eq("email", user.getEmail()));
			cassandraOperations.execute(u);
		}catch(Exception e){
			logger.error("Error Occured whild doing editUser .. "+e);
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
			logger.error("Error Occured whild doing editWork .. "+e);
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
			logger.error("Error Occured whild doing editSkills .. "+e);
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
			 user.setEmail(row.getString("email"));
			 user.setFirstName(row.getString("firstname"));
			 user.setLastName(row.getString("lastname"));
			 user.setCity(row.getString("city"));
			 user.setState(row.getString("state"));
			 user.setCountry(row.getString("country"));
			 user.setPosition(row.getString("position"));
			 user.setWorkField(row.getString("workfield"));
			 user.setExpertSkills(row.getString("expertskills"));
			 user.setIntermediateSkills(row.getString("intermediateskills"));
			 user.setFamiliarSkills(row.getString("familiarskills"));
			 user.setAboutMe(row.getString("aboutme"));
			 user.setProfileadded(row.getString("profileadded"));
			 user.setCurrentWorkplace(row.getString("currentworkplace"));
			 user.setDateOfBirth(row.getString("dob"));
			 user.setEducationalQualification(row.getString("educationalqualification"));
		}catch(Exception e){
			logger.error("Error Occured whild doing getProfile .. "+e);
			return null;
		}
		return user;
	}

	public boolean profileCompleted(String email) {
		try{
			Update u =	QueryBuilder.update("registeredusers");
			u.with(QueryBuilder.set("profileadded", "Y"));			
			u.where(QueryBuilder.eq("email", email));
			cassandraOperations.execute(u);
		}catch(Exception e){
			logger.error("Error Occured whild doing profileCompleted .. "+e);
			return false;
		}
		return true;
	}

	public List<User> userSearch(String usersearchterm) {
		List<User> users =new ArrayList<User>();
		User user=null;
		try{
			 Select s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("email",usersearchterm.toLowerCase()));			 
			 ResultSet result = cassandraOperations.query(s);
			 populateList(users, result);
			
			 s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("firstname",usersearchterm.toLowerCase()));			 
			 result = cassandraOperations.query(s);
			 populateList(users, result);
			 
			 s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("lastname",usersearchterm.toLowerCase()));			 
			 result = cassandraOperations.query(s);
			 populateList(users, result);
			
			
		}catch(Exception e){
			logger.error("Error Occured whild doing verifyUser .. "+e);
			return null;
		}
		return users;
	}

	private void populateList(List<User> users, ResultSet result) {
		User user;
		for(Row row : result.all()){
			 user = new User();
			 user.setEmail(row.getString("email"));
			 user.setFirstName(row.getString("firstname"));
			 user.setLastName(row.getString("lastname"));
			 user.setCity(row.getString("city"));
			 user.setState(row.getString("state"));
			 user.setCountry(row.getString("country"));
			 user.setPosition(row.getString("position"));
			 user.setWorkField(row.getString("workfield"));
			 user.setExpertSkills(row.getString("expertskills"));
			 user.setIntermediateSkills(row.getString("intermediateskills"));
			 user.setFamiliarSkills(row.getString("familiarskills"));
			 user.setAboutMe(row.getString("aboutme"));
			 user.setProfileadded(row.getString("profileadded"));
			 user.setActivationToken(row.getString("activationtoken"));
			 users.add(user);
		 }
	}

	public boolean imageUpload(User user) {
		try{
			ByteBuffer fileByteBuffer = ByteBuffer.wrap( user.getImage()) ;
			
			
		    Statement insertFile = QueryBuilder.insertInto( "registeredusers" ).value( "email", user.getEmail() ).value( "image", fileByteBuffer );
		    cassandraOperations.execute( insertFile );
			
			/*Update u =	QueryBuilder.update("registeredusers");
			u.with(QueryBuilder.set("image", fileByteBuffer ));			
			u.where(QueryBuilder.eq("email", user.getEmail()));
			cassandraOperations.execute(u);*/
		}catch(Exception e){
			logger.error("Error Occured whild doing profileCompleted .. "+e);
			return false;
		}
		return true;
	}

	
	public byte[] getImage(User user) {
		
		
	    
		//Statement readFile = QueryBuilder.select( "image" ).from( "registeredusers" ).where( QueryBuilder.eq( "email", user.getEmail() ) );
		Select s = QueryBuilder.select("image").from("registeredusers"); 
		 s.where(QueryBuilder.eq("email", user.getEmail()));
		 ResultSet result = cassandraOperations.query(s);
		 Row row = result.one();
		 if( row == null){
				return null;
		 }
		 
		 ByteBuffer fileBytes = row.getBytes("image");	 
		 if(fileBytes == null)
			 return new byte[1];
		 
		return  Bytes.getArray(fileBytes);
	     
	}
	
}
