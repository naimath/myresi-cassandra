package com.zuabmulabs.sample.controller.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.data.cassandra.core.CassandraTemplate;
import org.springframework.stereotype.Repository;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;

@Repository
public class PersonDAO {
	
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

}
