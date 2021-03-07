# curl_ext

After executing in the template of project that is supposed work out box:

	% composer install

I get the error about not having some "ext-curl" package
installed *composer* by itself must install it though.

To make it work we need to enable this extension by hand in configuration
*ini* file:
	
	% php --ini # Get path of the config, which is second line in this one output.
	Configuration File (php.ini) Path: /etc/php
	Loaded Configuration File:         /etc/php/php.ini
	Scan for additional .ini files in: /etc/php/conf.d
	Additional .ini files parsed:      /etc/php/conf.d/composer.ini
	% vi /etc/php/php.ini # Uncomment ";extension=curl" with deleting leading ';' character.

