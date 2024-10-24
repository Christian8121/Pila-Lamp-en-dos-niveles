# Pila-Lamp-en-dos-niveles
# Proyecto Vagrant Apache & MySQL

Este proyecto configura dos máquinas virtuales con Vagrant: una con Apache y otra con MySQL. La máquina Apache tiene acceso a Internet, mientras que la máquina MySQL no tiene acceso a la red externa.

## Configuración de Vagrant

- **SeverinoApache**: Servidor Apache, acceso a internet a través de NAT, puerto 8080 mapeado.
- **SeverinoMysql**: Servidor MySQL, sin acceso a internet, red privada.

### Vagrantfile
```ruby
# Código del Vagrantfile aquí
Vagrant.configure("2") do |config|
  # Configuración para SeverinoApache
  config.vm.define "SeverinoApache" do |apache|
    apache.vm.box = "ubuntu/bionic64"
    apache.vm.hostname = "SeverinoApache"
    apache.vm.network "forwarded_port", guest: 80, host: 8080  # Reenvío de puertos
    apache.vm.network "public_network"  # Acceso a internet vía NAT
    apache.vm.provision "shell", path: "apache_provision.sh"  # Script de aprovisionamiento
  end

  # Configuración para SeverinoMysql
  config.vm.define "SeverinoMysql" do |mysql|
    mysql.vm.box = "ubuntu/bionic64"
    mysql.vm.hostname = "SeverinoMysql"
    mysql.vm.network "private_network", type: "dhcp"  # Red privada, sin acceso a internet
    mysql.vm.provision "shell", path: "mysql_provision.sh"  # Script de aprovisionamiento
  end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"  

# Código del script de aprovisionamiento para Apache aquí

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

# Código del mysql_provision.sh aquí

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


