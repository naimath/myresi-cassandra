package com.zuabmulabs.sample.controller.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.data.cassandra.core.CassandraTemplate;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.querybuilder.Insert;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.querybuilder.Select;
 
public class CassandraApp { 
 
 private static final Logger LOG = LoggerFactory.getLogger(CassandraApp.class); 
 
 private static Cluster cluster; 
 private static Session session; 
 
 public static void main(String[] args) { 
 
  try { 
  cluster =  Cluster.builder().addContactPoint("192.168.109.130").withPort(9042).build();
   
 /* 
  * session = cluster.connect("mykeyspace");
  session.execute("CREATE KEYSPACE mykeyspace WITH replication " + 
	      "= {'class':'SimpleStrategy', 'replication_factor':3};");
  
 
   CassandraOperations cassandraOps = new CassandraTemplate(session); 
 
   cassandraOps.insert(new Person("1234567890", "David", 40)); 
 
   Select s = QueryBuilder.select().from("person"); 
   s.where(QueryBuilder.eq("id", "1234567890")); 
 
   LOG.info(cassandraOps.queryForObject(s, Person.class).getId()); 
 
   cassandraOps.truncate("person"); */
   
   
   try
   {
	   session = cluster.connect(); 
	   String createKS = "CREATE KEYSPACE test WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor': '2' }";
       session.execute(createKS);
       String query = "create table test.user (username text primary key,first text, last text);";
       session.execute(query);

       System.out.println("insert executed");
       Insert insert = QueryBuilder.insertInto("test", "user")
                                   .value("username", "jdoe")
                                   .value("first", "John")
                                   .value("last", "Doe");
       System.out.println(insert.toString());
       ResultSet result = session.execute(insert.toString());
       System.out.println(result);
   }
   catch (Exception ex)
   {
       ex.printStackTrace();
   }

 
  } catch (Exception e) { 
   e.printStackTrace(); 
  } 
 
 } 
} 
