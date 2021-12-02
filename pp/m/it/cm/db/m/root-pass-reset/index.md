# How to reset root pass

	# Disable sqld service first.

	% sudo mysqld_safe --skip-grant-tables --skip-networking

	% mysql -u root

	# Without this command will not work.
	sql% FLUSH PRIVILEGES;

	# For >=MySQLv5.7.6 and >=MariaDBv10.1.20
	sql% ALTER USER 'root'@'localhost' IDENTIFIED BY 'yournewpass';
	# for <=MySQLv5.7.5 and < MariaDBv10.1.20
	sql% SET PASSWORD FOR 'root'@'localhost' = PASSWORD('yournewpass') ;

	# Note: If the ALTER USER command doesn’t work,
	# it’s usually indicative of a bigger problem.
	# However, you can try UPDATE ... SET to reset the root password instead.
	sql% UPDATE mysql.user SET authentication_string = PASSWORD('new_password')
		WHERE User = 'root' AND Host = 'localhost';

	# Restarting sqld service.
