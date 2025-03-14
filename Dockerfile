# FROM ubuntu:24.04
FROM python:3.9-slim

# Update and install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    vim \
    ssh \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Copy from github repository by
ADD https://github.com/corngang/TicketService_FastAPI_Streamlit/archive/refs/heads/main.tar.gz main.tar.gz
RUN tar --strip-components=1 -xvf main.tar.gz
RUN rm -rf main.tar.gz

# Set working directory
WORKDIR /TicketService_FastAPI_Streamlit/fastapi

# Set Python 3.9 as default
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Install pip (remove old pip if exists)
# RUN apt-get remove -y python3-pip && \
#     curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
#     python3 get-pip.py && \
#     rm get-pip.py

CMD ["python3", "main.py"]
