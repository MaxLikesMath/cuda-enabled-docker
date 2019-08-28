#First, install the proper base image. I use CUDA 10 and Ubuntu 18.04, so I would run the following:
FROM nvidia/cuda:10.0-base-ubuntu18.04

#Create Directory
WORKDIR /usr/src/app
COPY . /usr/src/app

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
 && rm -rf /var/lib/apt/lists/*

#Now, we must install the proper Python version and the required tools needed to build our image.
RUN apt-get update && apt-get install -y python3.6 python3.6-dev python3-pip virtualenv libssl-dev libpq-dev git build-essential libfontconfig1 libfontconfig1-dev


# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt
#Run script
CMD [ "python3", "/usr/src/app/sub_file.py" ]

#Now, to actually use CUDA at runtime do sudo docker run --runtime=nvidia imagename


