package com.zuabmulabs.sample.controller.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.data.cassandra.core.CassandraTemplate;
import org.springframework.stereotype.Repository;

import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;

@Repository
public class PersonDAO {
	
	@Autowired
	private CassandraOperations cassandraOperations;
	
	
	public void getPerson() {
		 Select s = QueryBuilder.select().from("person"); 
		 s.where(QueryBuilder.eq("id", "1234567890")); 
		 
		 System.out.println(cassandraOperations.queryForObject(s, Person.class).getId()); 
	}
	
	public void insertPerson(){
		 cassandraOperations.insert(new Person("1234567890", "David", "40")); 
	}
	
	public void createPerson(){
		 String query = "create table mykeyspace.person (id text primary key,name text, age text);";
		 ((CassandraTemplate)cassandraOperations).getSession().execute(query);
	}

}
