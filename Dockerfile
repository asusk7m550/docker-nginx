FROM    centos:latest
MAINTAINER Jasper Aikema <jasper@aikema.nl>

# Update base image
RUN yum -y update && yum clean all

# Install EPEL
RUN yum -y install epel-release

# Install the ius repo
RUN rpm -ivh https://centos7.iuscommunity.org/ius-release.rpm

# Install the software
RUN yum -y install nginx

# Mount the webdir
VOLUME [ "/usr/share/nginx/html" ]

# Expose the ports
EXPOSE 80

# Start the deamon
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
