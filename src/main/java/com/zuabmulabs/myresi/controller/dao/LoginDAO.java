package com.zuabmulabs.myresi.controller.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.data.cassandra.core.CassandraTemplate;
import org.springframework.stereotype.Repository;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;
import com.datastax.driver.core.querybuilder.Update;
import com.zuabmulabs.myresi.model.User;

@Repository
public class LoginDAO {
	
	@Autowired
	private CassandraOperations cassandraOperations;
	
	

	public void createPerson(){
		 String query = "create table mykeyspace.person (id text primary key,name text, age text);";
		 ((CassandraTemplate)cassandraOperations).getSession().execute(query);
	}

	public boolean insertUser(User user) {
		try{
		 cassandraOperations.insert(user); 
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	

	public User validateRegistration(String token) {
		try{
			 Select s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("activationtoken", token)); 
			 ResultSet result = cassandraOperations.query(s);
			 Row row = result.one();
			if( row == null){
				return null;
			}else{
				 User user = new User();
				 user.setEmail(row.getString("email"));
				 user.setFirstName(row.getString("firstname"));
				 user.setLastName(row.getString("lastname"));
								
				Update u =	QueryBuilder.update("registeredusers");
				u.with(QueryBuilder.set("activate", "Y"));
				u.where(QueryBuilder.eq("email", row.getString(0)));
				cassandraOperations.execute(u);
				return user;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}


}
