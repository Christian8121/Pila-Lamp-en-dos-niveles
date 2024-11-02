# Actualiza los paquetes
apt-get update

# Instala MySQL
apt-get install -y mysql-server

# Asegúrate de que el servicio de MySQL esté habilitado
systemctl enable mysql

# Inicia el servicio de MySQL
systemctl start mysql

# Muestra el estado del servicio
systemctl status mysql