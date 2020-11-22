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

sudo apt-get update
        sudo apt install mysql-client-core-5.7


mysql -h terraform-20201122151346712900000002.coaea37d1emt.eu-west-1.rds.amazonaws.com -P 3306 -u admin -pPassword1234
use testdb;
source ~/CNE-PracticalProj/database/Create.sql;
exit

sudo docker-compose up -d
sudo docker exec backend bash -c "pytest tests/ --cov application"
sudo docker exec frontend bash -c "pytest tests/ --cov application"

sudo docker-compose down 

EOF
