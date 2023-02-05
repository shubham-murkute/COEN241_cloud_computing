FROM shubham-murkute/sysbench-ubuntu:version1
COPY docker_script.sh /docker_script.sh
COPY cpu_test.sh /cpu_test.sh
COPY fileio_test.sh /fileio_test.sh
RUN chmod +x docker_script.sh
RUN chmod +x cpu_test.sh
RUN chmod +x fileio_test.sh
ENTRYPOINT bash docker_script.sh