FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y software-properties-common curl \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get remove -y software-properties-common \
    && apt autoremove -y \
    && apt-get update \
    && apt-get install -y python3.6 
RUN apt-get install -qqy python3-pip \
    && curl -o /tmp/get-pip.py "https://bootstrap.pypa.io/get-pip.py" \
    && python3.6 /tmp/get-pip.py \
    && apt-get remove -y curl \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir app
COPY ./ /app/
WORKDIR /app 
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate 
CMD python3.6 manage.py runserver 0.0.0.0:8000
