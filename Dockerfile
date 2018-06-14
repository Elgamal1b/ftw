FROM python:2.7
ADD OWASP-CRS-regressions/CRS_Tests.py /
ADD docker/docker_entry.sh /
ADD tools/build_journal.py /
RUN chmod 0655 /build_journal.py
RUN chmod 0655 /docker_entry.sh
RUN mkdir /CRS
RUN git clone https://github.com/SpiderLabs/OWASP-CRS-regressions.git /CRS
RUN pip install git+https://github.com/fastly/ftw.git@cperon/destaddr_journal
ENTRYPOINT [ "/docker_entry.sh" ]
CMD [ ]
