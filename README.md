# dockeRepo
Using docker for reproducing analysis using R studio 

### Installing

#### Windows
You need to know what your Windows version: Start button > Settings > System > About.  

Download and install docker for the [64-bit: Pro, Enterprise, or Education](https://docs.docker.com/docker-for-windows/install/).  

For [64-bit: Home](https://docs.docker.com/docker-for-windows/install-windows-home/) edition, you also need to install [Docker Desktop WSL 2 backend](https://docs.docker.com/docker-for-windows/wsl/) and Linux [Linux Kernel](https://docs.microsoft.com/en-gb/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package).

##### Note: Install [Ubuntu SLT](https://ubuntu.com/tutorials/ubuntu-on-windows#1-overview) for the best way to run docker on you window system.

#### Mac/Linux
Please go [Here](https://docs.docker.com/engine/install/) for other engines.



## Topics to cover

### Introduction to Docker: Concept and usage  
Docker = Container  
Store information about the environment so that scripts can be reproduced.  
Can be recreate from "text" (Dockerfile) or image (Docker image).

### Search for images  

- Go to [https://hub.docker.com/](https://hub.docker.com/)  
- Search for:
``` rocker/rstudio ``` 
- **tag** specific time point of the image  

### Pull  

You can pull the image to your machine
```
docker pull rocker/rstudio:4.0.4
```
or  

Run straight away from the command. Docker will try to search and download the appropriate image.  

```
docker run --rm -p 8787:8787 -e PASSWORD=mumc  -v  /mnt/c/Users/giang/Documents/:/home/rstudio rocker/rstudio:4.0.4
```

**-p** port, *must be 8787*  
**-e** environment, *for this image (rocker/rstudio) must specify password*  
**-v** mount directory, *location you want your files to be saved*  
**docker image name** *at the end* 


Note: for windows user, you can access C: drive through /mnt/c/  

### Accessing Rstudio

Open you internet browser and type in:  
```http://localhost:8787/```

Username: ```rstudio```  

Password: ```mumc```  


### Make changes

### Save new image

### Upload to the hub

### Working with github

