FROM ubuntu
COPY ./ /app/
WORKDIR /app 
RUN apt-get update -qq 
RUN apt-get install -qqy software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt-get install -qqy python3.6 libpython3.6
RUN rm /usr/bin/python3
RUN ln -s python3.6 /usr/bin/python3
RUN apt-get install -qqy python3-pip
RUN mkdir app 
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate 
CMD python3.6 manage.py runserver 0.0.0.0:8000
