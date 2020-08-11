read -p 'Auth username for controllers: ' auth_basic_name
htpasswd -c nginx/controllers.htpasswd $auth_basic_name
