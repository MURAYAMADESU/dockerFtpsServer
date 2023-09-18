FROM dokken/centos-7:latest
RUN yum install -y vsftpd
RUN rm -f /etc/vsftpd/vsftpd.conf \
    /etc/yum.conf \
    /etc/skel/*
EXPOSE 20
EXPOSE 21000-21010
COPY /sysconf/vsftpd.sh /usr/local/bin/vsftpd.sh
COPY /sysconf/yum.conf /etc/yum.conf 
COPY /sysconf/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN useradd -m -d /workspace ftpuser
RUN echo "muradesuyoo" | passwd ftpuser --stdin
RUN chmod 111 /usr/local/bin/vsftpd.sh
RUN chmod 777 /workspace
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
WORKDIR /workspace
##FTPSサーバーの実行
ENTRYPOINT [ "/usr/local/bin/vsftpd.sh" ]
