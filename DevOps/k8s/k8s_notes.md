kubernetes concepts
---------------------
# Api Server
* For detail information about Api-Server component [refer_here](https://waytoeasylearn.com/learn/kube-api-server/#google_vignette)
* DevOps_Notes_60days_Internship
* The basic structure of k8s manifest(yaml file)
```sh
apiVersion:
Kind:
metadata:
spec:
```
# Volumes
* In volumes we have 3 components
    1. Persistent Volume Claim
       * Claimining volume or asking volume 
    2. Storage Class
       * Which volume storage class is required
       *  There are so many storage classes are there 
    3. Persistent Volume
       * Actual amount of volume that you require
* All these Persistent volume is nothing but like NFS(Network File Share) in AWS
* The same volume is available for all pods or pods which are in the same network.
* The storage classes, persistent volumesare belong to entire cluster not to a particular name space.
* persistent volume claims belongs to namespace
# Daemon Sets
* Daemon sets are used to collect the logs from every node
* To know the status of every node in the cluster
* Daemon sets are present in every node of the cluster to moniter the cluster including pods and nodes with the help of logs.
* After creation of daemon set pods in the nodes, if you intentionally delete the pods of Daemonsets they create on their own until Daemon set resource is running.