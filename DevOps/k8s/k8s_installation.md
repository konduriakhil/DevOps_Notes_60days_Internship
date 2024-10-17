# Kubeadm Setup
[refer_here](https://directdevops.blog/2024/06/11/devops-classroom-notes-11-june-2024/) for kubeadm installation steps
```sh
# Installing docker on all nodes
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh
sudo usermod -aG docker azureuser
exit

# Install kubeadm, kubectl and kubelet on 3 nodes 
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Configuring cri-runtime on all nodes
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.14/cri-dockerd_0.3.14.3-0.ubuntu-jammy_amd64.deb
sudo dpkg -i cri-dockerd_0.3.14.3-0.ubuntu-jammy_amd64.deb

#  Execute the following on master node, Lets initialize the cluster using the following command as a root user
kubeadm init --cri-socket unix:///var/run/cri-dockerd.sock

# When executed this command will give the output as shown below
Your Kubernetes control-plane has initialized successfully!
## To start using your cluster, you need to run the following as a regular user on master node:
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
# Alternatively, if you are the root user, you can run:
  export KUBECONFIG=/etc/kubernetes/admin.conf
You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/
## Then you can join any number of worker nodes by running the following on each as root:
kubeadm join 10.0.0.4:6443 --token l6r787.27rpwz58au2gsmdn
```
# AKS Installation
## CLI
### Install Azure cli on your system through choco
```sh
# Installing azure-cli
choco install azure-cli

# Login to Azure account
az login
  EMAILID:
  PASSWORD: 
```
### Creating AKS cluster
```sh
# Create new resource group
az group create --name akscentralindia --location centralindia

# This is one time setup, Register for Microsoft conatainer service
az provider register --namespace Microsoft.ContainerService
az provider show --namespace Microsoft.ContainerService

# Creating AKS cluster
az aks create --resource-group akscentralindia --name MyAKSCluster --node-count 1 --generate-ssh-keys --node-vm-size Standard_D2s_v3

# Installing kubectl in local system and configuring with aks master 
az aks install-cli
az aks get-credentials --resource-group akscentralindia --name MyAKSCluster

# Deleting AKS cluster
az group delete --name $MY_RESOURCE_GROUP_NAME --yes --no-wait
```

## Terraform

```aks.tf

```