package com.zuabmulabs.myresi.controller.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.data.cassandra.core.CassandraTemplate;
import org.springframework.stereotype.Repository;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.querybuilder.Clause;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;
import com.zuabmulabs.myresi.model.User;

@Repository
public class LoginDAO {
	
	@Autowired
	private CassandraOperations cassandraOperations;
	
	
	public Person getPerson() {
		 Select s = QueryBuilder.select().from("person"); 
		 s.where(QueryBuilder.eq("id", "1234567890")); 
		ResultSet result = cassandraOperations.query(s);
		Person p = new Person();
		for(Row row:result.all()){
			System.out.println("Frist value "+row.getString(0));
			System.out.println("Second value "+row.getString(1));
			System.out.println("Second value "+row.getString(2));
			p.setId(row.getString(0));			
			p.setAge(row.getString(1));
			p.setName(row.getString(2));
		}
		
	 return p;
	}
	
	public void insertPerson(){
		 cassandraOperations.insert(new Person("1234567890", "David", "40")); 
	}
	
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
	
	public boolean verifyUser(User user) {
		try{
			
			
			 Select s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("email", user.getEmail())).and(QueryBuilder.eq("activate", "Y"));
			 
			 ResultSet result = cassandraOperations.query(s);
			if( result.one() == null){
				return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean validateRegistration(String token) {
		try{
			 Select s = QueryBuilder.select().from("registeredusers"); 
			 s.where(QueryBuilder.eq("activationtoken", token)); 
			 ResultSet result = cassandraOperations.query(s);
			if( result.one() == null){
				return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}


}
