#! /bin/bash

ssh  -i /var/lib/jenkins/.ssh/id_rsa ubuntu@52.16.102.105 << EOF

if [ ! -d install-scripts/ ]; then
  git clone https://github.com/LukeBenson/install-scripts.git
  cd install-scripts/
  ./docker_install.sh
  ./docker-compose-install.sh
  cd ~
  rm -rf install-scripts/
fi

if [ ! -d CNE-PracticalProj/ ]; then
  git clone https://github.com/AShakerQA/CNE-PracticalProj.git
fi
cd CNE-PracticalProj/

if ! which sql > /dev/null; then
  sudo apt-get update
  sudo apt install mysql-client-core-5.7
fi

mysql -h terraform-20201122151346712900000002.coaea37d1emt.eu-west-1.rds.amazonaws.com -P 3306 -u admin -pPassword1234 < ~/CNE-PracticalProj/database/Create.sql;

mysql -h terraform-20201122151346707800000001.coaea37d1emt.eu-west-1.rds.amazonaws.com -P 3306 -u admin -pPassword1234 < ~/CNE-PracticalProj/database/Create.sql;

sudo docker-compose up -d
sudo docker exec backend bash -c "pytest tests/ --cov application"
sudo docker exec frontend bash -c "pytest tests/ --cov application"

EOF
