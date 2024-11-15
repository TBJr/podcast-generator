# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.10 \
#     python3-pip \
#     git 

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]

FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN python3.10 -m pip install --upgrade pip && \
    pip3 install PyYAML

# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT [ "/entrypoint.sh" ]
