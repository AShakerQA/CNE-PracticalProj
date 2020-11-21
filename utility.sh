#! /bin/bash

ssh -tt -i /var/lib/jenkins/.ssh/id_rsa ubuntu@54.171.126.241 << EOF

git clone https://github.com/LukeBenson/install-scripts.git
cd install-scripts/
./docker_install.sh
./docker-compose-install.sh

cd ~
rm -rf install-scripts/
git clone https://github.com/AShakerQA/CNE-PracticalProj.git
cd CNE-PracticalProj
git checkout jenkins

sudo docker-compose up -d
sudo docker exec backend bash -c "pytest tests/ --cov application"
sudo docker exec frontend bash -c "pytest tests/ --cov application"

docker-compose down -d

EOF
