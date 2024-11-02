# Actualiza los paquetes
apt-get update

# Instala Apache
apt-get install -y apache2

# Habilita el servicio de Apache para que inicie automáticamente
systemctl enable apache2

# Inicia el servicio de Apache
systemctl start apache2

# Muestra el estado del servicio
systemctl status apache2