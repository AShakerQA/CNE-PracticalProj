# QAC SFIA2 Project

This application is a simple [Flask application](https://flask.palletsprojects.com/en/1.1.x/quickstart/#a-minimal-application), ready to be deployed, for your SFIA2 project.

The following information should be everything you need to complete the project.

## Contents
* [Brief](#brief)
* [Application](#Application)
* [Project Management](#Project-Management)
* [Testing](#Testing)
* [Database Connection](#Database-Connection)
* [Environment Variables](#Environment-variables)
* [Infrastructure](#Infrastructure)
* [User Info](#User-Info)
* [Starting Up](#Starting-Up)
* [Authors](#Authors)

## Brief

The application must:

- Be deployed to a **Virtual Machine for testing**
- Be deployed in a **managed Kubernetes Cluster for production**
- Make use of a **managed Database solution**

## Application

The application is a Flask application running in **2 micro-services** (*frontend* and *backend*).  

The database directory is available should you: 
  - want to use a MySQL container for your database at any point, *or*
  - want to make use of the `Create.sql` file to **set up and pre-populate your database**.

The application works by:
1. The frontend service making a GET request to the backend service. 
2. The backend service using a database connection to query the database and return a result.
3. The frontend service serving up a simple HTML (`index.html`) to display the result.

## Project Management 

Jira was utilised to track the progress of the project available at:
[here] (https://qac1.atlassian.net/secure/RapidBoard.jspa?rapidView=2&view=planning.nodetail&selectedIssue=CNEP-17&issueLimit=100)
![jiraboardsc](https://user-images.githubusercontent.com/71396007/99922985-44708300-2d2b-11eb-97db-6be2fbbf84f2.png)

## Testing
Using pytest had with 100% on coverage tests as well as a successful Jenkins build.
![jenkins](https://user-images.githubusercontent.com/71396007/99923097-045dd000-2d2c-11eb-9c74-8baf99f5bdfe.png)
![coveragereport](https://user-images.githubusercontent.com/71396007/99923189-8221db80-2d2c-11eb-96fc-fec7f51ab185.png)

### Database Connection

The database connection is handled in the `./backend/application/__init__.py` file.

A typical Database URI follows the form:

```
mysql+pymysql://[db-user]:[db-password]@[db-host]/[db-name]
```

An example of this would be:

```
mysql+pymysql://root:password@mysql:3306/orders
```

### Environment Variables

The application makes use of **2 environment variables**:

- `DATABASE_URI`: as described above
- `SECRET_KEY`: any *random string* will work here

## Infrastructure

The **Minimum Viable Product** for this project should at least demonstrate the following infrastructure diagram:

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

**Stretch goals** for this project include:

- Using **Terraform to configure the Kubernetes Cluster** for production 
- Using **Terraform and Ansible to configure the Test VM**

Completing the stretch goals should yield an infrastructure diagram similar to the following:

![stretch-digram](https://i.imgur.com/Q5zljVl.png)

## User info
need to export ec2-ip to jenkins: 
export ec2_ip=$(terraform output ec2-ip)

info is then passed to ansible via echo ${ec2_ip}

Terraform is used to provision the AWS infrastructure, whereas the code for EKS is available but was not utlised in full automation.
Things to also note, the database variables and end points should in future be referenced as variables as well as the secret.yaml file not being available on github.
The SSH IP in the Jenkinsfile needs to be replaced with the IP of the new manually created Test VM - this can be automated in the future very easily, after terraform apply.

The outputs of terraform apply include the ip for the Jenkins VM and the two database End points.
After run: ansible-playbook -i inventory.conf playbook.yaml --key-file "~/.ssh/id_rsa" which configures the environment for the Jenkins VM.

## Starting up

* ssh into Jenkins VM
* sudo visudo and add Jenkins with NOPASSWD:ALL and add jenkins to docker group
* sudo su - jenkins
* sudo cat /var/lib/jenkins/secrets/initialAdminPassword then manually enter into Jenkins GUI
* docker login
* aws eks --region (region) update-kubeconfig --name (cluster_name)
* Database is setup using the utility.sh, mysql -h (endpoint) - P 3306 -u (username) -p(password)
* either ssh once manually or turn of strict key checking and run the jenkinsfile to access the testVM
* configure a webhook for jenkins

## Future Updates
* More secure, including variable usage for endpoints and ips
* use the kubernetes role to deploy eks using terraform (files already avaiable -- time consuming)
* slurp Jenkins password and auto add using a register in ansible role
* automate more tedious tasks such as the inventory file taking variables (tried and didnt work)
* internal server error 500, nginx could not get frontend and backend to communicate (curl frontend container to see what it should be)


## Authors

Abdul Shaker
