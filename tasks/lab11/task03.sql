DROP OWNED BY userb;
DROP USER userb;
CREATE USER userb PASSWORD 'password';
GRANT SELECT,INSERT ON departments TO userb;