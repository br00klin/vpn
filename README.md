# vpn.sh
Для упрощения работы с VPN туннелями.
Стянуть bash скрипт в директорию где распологается *.ovpn ключ.

# Проброс туннеля: 
./vpn.sh
./vpn.sh up
./vpn.sh -u
# Закрыть соединение
./vpn.sh down
./vpn.sh -d
# Проверить статус работы openvpn
./vpn.sh status
./vpn.sh -s
