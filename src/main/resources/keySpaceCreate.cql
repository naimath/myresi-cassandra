CREATE KEYSPACE myresitest
  WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };