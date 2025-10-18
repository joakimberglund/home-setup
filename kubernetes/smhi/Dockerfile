FROM frolvlad/alpine-python3:latest


RUN pip3 install requests && \
    rm -r /root/.cache

ADD smhi.py test.py /
RUN chmod 777 /smhi.py



ENTRYPOINT ["python", "/test.py"]
