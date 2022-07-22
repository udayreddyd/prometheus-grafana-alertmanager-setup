curl -LO url -LO https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz
tar -xvf prometheus-2.37.0.linux-amd64.tar.gz
mv prometheus-2.37.0.linux-amd64 prometheus-files
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus


sudo cp prometheus-files/prometheus /usr/local/bin/
sudo cp prometheus-files/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo yum install -y git
git clone https://github.com/udayreddyd/prom-graf-alertm-setup.git
sudo cp /home/opc/prom-graf-alertm-setup/prometheus.yml /etc/prometheus/
sudo cp /home/opc/prom-graf-alertm-setup/prometheus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl status prometheus