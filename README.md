# Description

This is the repository for the final test of the Continuous Delivery, Continuous Integration and Cloud Computing subject of the Software Architecture postgraduate course of the Infnet Academy

# Folders and Files

The system is divided in 3 different parts:

- frontend: a simple nextJS frontend app that is dockerized and pushed to the owner's DockerHub
- infrastructure-k8s: the service and deployment files necessary for our system to work in a minikube invironment
- infrastructure-swarm: the .yml files used to make the same system work locally using docker swarm technology

# Running the system

1. Make sure that you have a Docker environment and kubectl CLI installed running on the machine of your preference;

2. Make sure that you have a minikube setup on the machine of your preference;

3. Enter the infrastructure-k8s folder and run

   `chmod +x deployment.sh`

   `./deployment.sh`

   A successfull deployment would display the following prompt:

   
   <img width="694" alt="Screenshot 2025-04-13 at 13 44 21" src="https://github.com/user-attachments/assets/a4d84968-9d70-434d-b6b5-0b6794cc4ebf" />


5. Run the following processes to access the cluster service on your browser:

   a) _To access the frondend app:_ minikube service infnet-frontend-service -n infnet-system --url (click the url while the process is running)

   b) _To access the grafana app:_ minikube service grafana-service -n infnet-system --url (click the url while the process is running)
