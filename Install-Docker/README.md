# Install Docker with Linux

*There are two ways of installing it. The official docker way is a bit more recent.*

##### 1st way..

### A) Official Ubuntu Repositories

`$ sudo apt-get install docker.io`

> and after verify the installation

`$ docker -v`

`$ sudo docker run hello-world`

------------------------

##### 2nd way

### (B) Official Docker Way

**(1) Set up the docker repository and Install Docker CE**

> Updating the apt package index

`$ sudo apt-get update`

> Installing packages to allow apt to use a repository over HTTPS:

`$ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`

> Adding Docker’s official key GPG

`$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

> Verifying that you now have the key with fingerprint:

`$ sudo apt-key fingerprint 0EBFCD88`

> sub-command below returns the name of your Ubuntu distribution

`$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`

> Updating the apt package index

`$ sudo apt-get update`

> Installing the latest version of Docker CE and containerd

`$ sudo apt-get -y install docker-ce docker-ce-cli containerd.io`

> and after verify the installation

`$ docker -v`

`$ sudo docker run hello-world`

###### Thankyou.
