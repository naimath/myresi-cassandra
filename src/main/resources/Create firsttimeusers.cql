CREATE TABLE IF NOT EXISTS myresitest.firsttimeusers (
  email text PRIMARY KEY,
  aboutme text,
  city text,
  country text,
  currentworkplace text,
  dateofbirth text,
  education text,
  expertskills set<text>,
  familiarskills set<text>,
  field text,
  firstname text,
  fullname text,
  imageurl text,
  intermediateskills set<text>,
  lastname text,
  password text,
  position text,
  solr_query text,
  state text,
  url text
);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_aboutme_index ON myresitest.firsttimeusers (aboutme);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_city_index ON myresitest.firsttimeusers (city);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_country_index ON myresitest.firsttimeusers (country);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_currentworkplace_index ON myresitest.firsttimeusers (currentworkplace);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_education_index ON myresitest.firsttimeusers (education);


CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_field_index ON myresitest.firsttimeusers (field);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_firstname_index ON myresitest.firsttimeusers (firstname);

CREATE INDEX IF NOT EXISTS firsttimeusers_fullname_idx ON myresitest.firsttimeusers (fullname);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_imageurl_index ON myresitest.firsttimeusers (imageurl);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_lastname_index ON myresitest.firsttimeusers (lastname);

CREATE INDEX IF NOT EXISTS firsttimeusers_password_idx ON myresitest.firsttimeusers (password);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_position_index ON myresitest.firsttimeusers (position);

CREATE INDEX IF NOT EXISTS myresitest_firsttimeusers_state_index ON myresitest.firsttimeusers (state);

CREATE INDEX IF NOT EXISTS firsttimeusers_url_idx ON myresitest.firsttimeusers (url);