CREATE TABLE IF NOT EXISTS myresitest.registeredusers (
  email text PRIMARY KEY,
  activationtoken text,
  activate text,
  firstname text,
  fullname text,
  imageurl text,
  lastname text,
  link text,
  password text,
  aboutme text,
  city text,
  state text,
  country text,
  position text,
  currentworkplace text,
  workfield text,
  educationalqualification text,
  expertskills text,
  intermediateskills text,
  familiarskills text,
  profileadded text,
  url text
);


CREATE INDEX IF NOT EXISTS registeredusers_activationtoken_idx ON myresitest.registeredusers (activationtoken);
CREATE INDEX IF NOT EXISTS registeredusers_activate_idx ON myresitest.registeredusers (activate);
CREATE INDEX IF NOT EXISTS registeredusers_firstname_idx ON myresitest.registeredusers (firstname);
CREATE INDEX IF NOT EXISTS registeredusers_lastname_idx ON myresitest.registeredusers (lastname);

ALTER TABLE myresitest.registeredusers  ADD ROLE  text;
