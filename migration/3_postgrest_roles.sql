
-- Create the api role
create role authenticator noinherit login password 'F6SAQ48N56NV4S5';
grant nosdeputes to authenticator;


-- Create create a trusted role for POST PATCH DELETE
create role api_admin nologin;
grant api_admin to authenticator;
grant usage on schema public to api_admin;
grant all on ALL TABLES IN SCHEMA public TO api_admin;


-- Create create an anonymous role with read-only access
CREATE ROLE anonyme;
grant anonyme to authenticator;
GRANT USAGE ON SCHEMA public TO anonyme;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anonyme;
