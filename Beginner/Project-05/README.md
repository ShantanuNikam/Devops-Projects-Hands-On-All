# Deploy your code on a Docker Container using Jenkins on AWS

  ![AWS](https://imgur.com/Hk28ffE.png)


### Agenda

* Setup Jenkins
* Setup & Configure Maven and Git
* Integrating GitHub and Maven with Jenkins
* Setup Docker Host
* Integrate Docker with Jenkins
* Automate the Build and Deploy process using Jenkins
* Test the deployment

### Prerequisites

* AWS Account
* Git/ Github Account with the Source Code
* A local machine with CLI Access
* Familiarity with Docker and Git


## Step 1: Setup Jenkins Server on AWS EC2 Instance

* Setup a Linux EC2 Instance 
* Don't worry , I know that you can see the Public Ips of instance in screenshot , but before commiting the changes , I will terminate the sandbox ec2 


    ![alt text](image-1.png)

 * Checking ec2 instance status , should be running 

    ![alt text](image.png)

   - `ssh -i ".pem" ec2-user@IP_ADDRESS`

    ![alt text](image-2.png)

* Install Java
 - `sudo dnf update`
 - `sudo dnf install fontconfig openjdk-21`
 - `java -version`

* Another method o install in ec2 , which is easier

- `sudo dnf install java-21-amazon-corretto-devel -y`

![alt text](image-3.png)

* Install Jenkins

- `sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo`
- `sudo yum upgrade`
* Add required dependencies for the jenkins package
- `sudo yum install fontconfig java-21-openjdk`
- `sudo yum install jenkins`
- `sudo systemctl daemon-reload`


 ![alt text](image-4.png)

* Start Jenkins
- `sudo systemctl enable jenkins`
- `sudo systemctl start jenkins`
- `sudo systemctl status jenkins`

![alt text](image-5.png)

* Access Web UI on port 8080

![alt text](image-6.png)


## Step 2: Integrate GitHub with Jenkins

* Install Git on Jenkins Instance

- `sudo dnf install git `
  ![alt text](image-7.png)

* Install Github Plugin on Jenkins GUI
  
![alt text](image-8.png)

* Configure Git on Jenkins GUI

![alt text](image-9.png)

## Step 3: Integrate Maven with Jenkins

* Setup Maven on Jenkins Server

![alt text](image-10.png)

* Setup Environment Variables
JAVA_HOME,M2,M2_HOME
* Install Maven Plugin


* Configure Maven and Java




## Step 4: Setup a Docker Host

* Setup a Linux EC2 Instance
   ![alt text](image-11.png)
* Install Docker
  sudo dnf install docker
   ![alt text](image-12.png)
* Start Docker Services

  sudo systemctl status docker
  sudo systemctl enable docker
  sudo systemctl start docker
  ![alt text](image-13.png)
* Run Basic Docker Commands

  sudo docker ps
  sudo docker images
   ![alt text](image-14.png)


### Create Tomcat Docker Container
    
* Create a Docker image first manually:
    sudo docker pull tomcat
    ![alt text](image-15.png)


    sudo docker images
    ![alt text](image-16.png)

    sudo docker run -d --name mytomcat-container -p 8081:8080 tomcat 

    ![alt text](image-17.png)
    ![alt text](image-18.png)
    
* Create a Customized Dockerfile for Tomcat:

  sudo docker build -t mytomcatserver_using_dockerfile .
   ![alt text](image-19.png)

    
    sudo docker run -d --name mytomcat-container -p 8081:8080 mytomcatserver_using_dockerfile

    ![alt text](image-20.png)
### Step 5: Integrate Docker with Jenkins

* Create a dockeradmin user
* Install the “Publish Over SSH” plugin
* Add Dockerhost to Jenkins “configure systems”



### Step 6: Create Jenkins Job to Build and Copy Artifacts on to Docker Host



## Step 7: Update Dockerfile to copy Artifacts to launch New Container