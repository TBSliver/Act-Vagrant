CREATE USER act WITH PASSWORD 'act';
CREATE DATABASE act OWNER act;
CREATE DATABASE actwiki OWNER act;
GRANT ALL ON DATABASE act TO act;
GRANT ALL ON DATABASE actwiki TO act;
