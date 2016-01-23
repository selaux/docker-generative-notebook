FROM ubuntu:wily

RUN apt-get update -y

RUN apt-get install -y python-skimage python-numpy python-scipy python-matplotlib

# Shoebot dependencies
RUN apt-get install -y gir1.2-pango-1.0 libyaml-dev libjpeg-dev libcairo2-dev python-pip python-cairo python-cairocffi python-gtk2 python-gobject python-rsvg python-xcffib python-imaging libx11-xcb1
RUN pip install shoebot==1.0b

RUN apt-get install -y python-dev build-essential libzmq-dev
RUN pip install --upgrade ipython[notebook]

RUN pip install pymunk

RUN mkdir /notebooks

ADD *.ipynb /notebooks/
ADD run.sh /
ADD config.py /etc/
WORKDIR /notebooks
ENTRYPOINT "/run.sh"
