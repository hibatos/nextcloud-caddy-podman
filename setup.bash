systemctl --user start podman.socket
systemctl --user enable podman.socket

mkdir -p ~/.config/containers/systemd
mkdir -p ~/.config/networks/systemd
mkdir -p ~/.config/systemd/user

mkdir -p ~/caddy
mkdir -p ~/mariadb_data
mkdir -p ~/nextcloud_data

cp mariadb.container ~/.config/containers/systemd
cp nextcloud.container ~/.config/containers/systemd
cp nextcloudcron.container ~/.config/containers/systemd
cp nextcloud.network ~/.config/containers/systemd
cp caddy.container ~/.config/containers/systemd
cp redis.container ~/.config/containers/systemd

echo "reloading daemon"
systemctl --user daemon-reload

echo "starting nextcloud-network.service"
systemctl --user restart nextcloud-network.service

echo "starting redis.service"
systemctl --user restart redis.service

echo "starting mariadb.service"
systemctl --user restart mariadb.service

echo "starting nextcloud.service"
systemctl --user restart nextcloud.service

echo "starting nextcloudcron.service"
systemctl --user restart nextcloudcron.service

echo "starting caddy.service"
systemctl --user restart caddy.service