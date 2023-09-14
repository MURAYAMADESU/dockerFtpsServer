FROM dokken/centos-7:latest
RUN yum install -y vsftpd man tail 
RUN rm -f /etc/vsftpd/vsftpd.conf \
    /etc/yum.conf
COPY /workspace/vsftpd.sh /usr/local/bin/vsftpd.sh
COPY /sysconf/yum.conf /etc/yum.conf 
COPY /sysconf/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 111 /usr/local/bin/vsftpd.sh
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
WORKDIR /workspace
##FTPSサーバーの実行
ENTRYPOINT [ "/usr/local/bin/vsftpd.sh" ]
