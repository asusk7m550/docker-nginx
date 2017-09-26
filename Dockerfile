FROM       centos:latest
MAINTAINER Jasper Aikema <jaikema@it-ernity.nl>

# Update base image
RUN yum -y update && yum clean all

# Install EPEL
RUN yum -y install epel-release

# Install the ius repo
RUN rpm -ivh https://centos7.iuscommunity.org/ius-release.rpm

# Install the software
RUN yum -y install nginx php71u-fpm-nginx

# Clenup after
RUN rm -rf /var/cache/yum

# Send logging to stdout or stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

# Mount the webdir
VOLUME [ "/usr/share/nginx/html" ]

# Expose the ports
EXPOSE 80
EXPOSE 443

# Start the deamon
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
