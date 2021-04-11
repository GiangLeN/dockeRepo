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
docker run --rm -p 8787:8787 -e PASSWORD=mumc  -v  /mnt/c/Users/giang/OneDrive/Maastricht/Tutorials/:/home/rstudio rocker/rstudio:4.0.4
```

**-p** port, *must be 8787*  
**-e** environment, *for this image (rocker/rstudio) must specify password*  
**-v** mount directory, *location you want your files to be saved*  
**docker image name** *at the end* 


Note: for windows user, you can access C: drive through /mnt/c/  
Note2: You can use double tab to fill in text

### Accessing Rstudio
Go to the docker app and click on open in browser   

or

Open you internet browser and type in:  
```http://localhost:8787/```

Fill in as follow:  
Username: ```rstudio```  
Password: ```mumc```  


### Make changes

You should be able to install R packages as usual.

```
install.packages("dygraphs")
install.packages("xts")
```
Create an interactive plot. Example taken from [r-graph-gallery](https://www.r-graph-gallery.com/)

```
# Libraries
library(dygraphs)
library(xts) # To make the convertion data-frame / xts format

# Format 3: Several variables for each date
data <- data.frame(
  time=seq(from=Sys.Date()-40, to=Sys.Date(), by=1 ), 
  value1=runif(41), 
  value2=runif(41)+0.7
)

# Then you can create the xts format:
don=xts( x=data[,-1], order.by=data$time)

# Chart
p <- dygraph(don)
p

# save the widget
library(htmlwidgets)
saveWidget(p, file=paste0( getwd(), "/dygraphs316-3.html"))
```

Using right hand side upload and export.  


### Accessing files (Expert command)

Check current running images:

```
docker ps # See current running images
# or
docker ps -a # See all images
```
Note down the container ID name.  

To ascess the files though the linux system run the following command.  

```
docker exec –it << Docker image >> /bin/bash
```

From there you can navigate around similarly to a linux system

#### Copying files using linux

Create empty file  

```
touch dockerfun.txt
```
Copy to the rstudio directory.
```
docker cp file/path << Docker image >>:/home/rstudio
```
You should be able to see the new file in rstudio


Copy from Rstudio to machine.
```
docker cp << Docker image >>:/home/rstudio/dygraphs316-3.html ./
```

### Save new image  

```
docker commit << Docker image >> hubName/imageName:tag
```
docker commit << Docker image >> ngocgiangle/interactive:latest  

Check with ``` docker images ```

Save as zip file
```
docker save hubUserName/imageName:tag > newname.tar
```

### Stop image

```
Ctrl + C

exit

docker stop container_name

```

### Upload to the hub

Login to docker hub
```
docker login --username=yourhubusername --email=youremail@company.com
```
You can change the tag of the image  
```
docker tag << Docker image >> hubUserName/imageName:newTag
```

### Clean up docker

```
docker images
docker rmi << Docker image >>
docker images
```

Load docker image from zip file

```
docker load --input interactive.tar
docker images
```

### Working with github


