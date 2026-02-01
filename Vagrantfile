Vagrant.configure("2") do |config|
  config.vm.hostname = "everydayuxlab"

  # ---------- Choose ONE ----------
  # Ubuntu 22.04 (recommended for Airflow / MLflow)
  config.vm.box = "ubuntu/jammy64"

  # CentOS Stream 9 (uncomment to use)
  # config.vm.box = "centos/stream9"
  # --------------------------------

  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "EverydayUXLab-VM"
    vb.memory = 4096
    vb.cpus = 2
  end

  # Shared folder (optional, good for logs & exports)
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Provisioning
  config.vm.provision "shell", path: "provision/common.sh"
  config.vm.provision "shell", path: "provision/ubuntu.sh", only: ["ubuntu"]
end
