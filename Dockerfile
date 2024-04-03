# Use an Ubuntu base image
FROM ubuntu:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Add TablePlus GPG key and repo
RUN apt-get update && apt-get install -y wget gnupg software-properties-common && \
    wget -qO - https://deb.tableplus.com/apt.tableplus.com.gpg.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/tableplus-archive.gpg > /dev/null && \
    add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/22 tableplus main"

# Install TablePlus and dependencies
RUN apt-get update && apt-get install -y tableplus libjson-glib-1.0-0

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the environment variable for the display
ENV DISPLAY=host.docker.internal:0

# Run TablePlus
CMD ["tableplus"]
