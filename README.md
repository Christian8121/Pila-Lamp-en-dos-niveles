# Pila-Lamp-en-dos-niveles
# Proyecto Vagrant Apache & MySQL

Este proyecto configura dos máquinas virtuales con Vagrant: una con Apache y otra con MySQL. La máquina Apache tiene acceso a Internet, mientras que la máquina MySQL no tiene acceso a la red externa.

## Configuración de las maquinas

- **SeverinoApache**: Servidor Apache, acceso a internet a través de NAT, puerto 8080 mapeado.
- **SeverinoMysql**: Servidor MySQL, sin acceso a internet, red privada.

### Vagrantfile
```ruby
Vagrant.configure("2") do |config|

  # Configuración para la máquina de Apache
  config.vm.define "sevApache" do |apache|
    apache.vm.box = "ubuntu/bionic64"
    apache.vm.hostname = "sevApache"
    apache.vm.network "forwarded_port", guest: 80, host: 8080
    apache.vm.network "public_network"
    apache.vm.provision "shell", path: "apache_provision.sh"
  end

  # Configuración para la máquina de MySQL
  config.vm.define "sevMysql" do |mysql|
    mysql.vm.box = "ubuntu/bionic64"
    mysql.vm.hostname = "sevMysql"
    mysql.vm.network "private_network", ip: "192.168.40.10"
    mysql.vm.provision "shell", path: "mysql_provision.sh"
  end 

# Código del script de aprovisionamiento para Apache aquí

# Código del apache_provision.sh

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

# Código del mysql_provision.sh 

# Actualiza los paquetes
apt-get update

# Instala MySQL
apt-get install -y mysql-server

# Asegúra que el servicio de MySQL esté habilitado
systemctl enable mysql

# Inicia el servicio de MySQL
systemctl start mysql

# Muestra el estado del servicio
systemctl status mysql
```

## Capturas de Pantalla

### Apache en ejecución
![Apache en ejecución](Apache.png)

### MySQL en ejecución
![Captura de pantalla 2024-11-02 130516](https://github.com/user-attachments/assets/28bbb187-b8bb-4552-9db0-bc4c8d8e5e50)

![Captura de pantalla 2024-11-02 130624](https://github.com/user-attachments/assets/f7b73966-db85-4584-b62a-2f9043e270c0)
![Captura de pantalla 2024-11-02 130700](https://github.com/user-attachments/assets/c5edb394-0cca-4bab-bc7b-c15f1bf53089)

## Capturas de Pantalla de la conexion entre Vagrant y Github
![Captura de pantalla 2024-11-02 132127](https://github.com/user-attachments/assets/727c3eba-255d-4c04-b3f5-a205c211f566)
![Captura de pantalla 2024-11-02 132140](https://github.com/user-attachments/assets/2644c00b-a8bb-47b8-af7d-1ffab73ae975)
![Captura de pantalla 2024-11-02 132352](https://github.com/user-attachments/assets/f480038a-4c1a-45b3-b09b-bff40e7265f9)
![Captura de pantalla 2024-11-02 132952](https://github.com/user-attachments/assets/6e70032f-a2d3-4f06-9e8b-e6e22defc005)




## Capturas de Pantalla de los dos servicios en funcionamiento
![Captura de pantalla 2024-11-02 133440](https://github.com/user-attachments/assets/3859c100-b508-4399-b929-792b3ef7ca21)







