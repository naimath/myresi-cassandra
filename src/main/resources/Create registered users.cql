CREATE TABLE IF NOT EXISTS myresitest.registeredusers (
  email text PRIMARY KEY,
  activationtoken text,
  activate text,
  id text
  firstname text,
  fullname text,
  imageurl text,
  lastname text,
  link text,
  password text,
  url text
);

CREATE INDEX IF NOT EXISTS registeredusers_activationtoken_idx ON myresitest.registeredusers (activationtoken);
CREATE INDEX IF NOT EXISTS registeredusers_activate_idx ON myresitest.registeredusers (activate);