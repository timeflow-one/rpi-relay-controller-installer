read -p 'Auth username for console: ' auth_basic_name
htpasswd -c nginx/console.htpasswd $auth_basic_name
