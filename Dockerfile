# Docker Image with Amazon Correto 11 OpenJDK Environment
FROM ubuntu:bionic

# Before you install the JDK, install the java-common package
RUN apt-get update && apt-get install java-common

# Download the Linux file from Downlaod page
# https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/downloads-list.html
ADD https://d3pxv6yz143wms.cloudfront.net/11.0.5.10.1/java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb \
	/java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb

# Install the package
RUN dpkg --install java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb

# Clean cashe
RUN apt-get clean && rm -rf /var/lib/apt/lists/* \
	&& rm /java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb

CMD ["/bin/bash"]