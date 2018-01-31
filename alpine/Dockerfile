FROM alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN echo "https://mirrors.aliyun.com/alpine/latest-stable/main" > /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/latest-stable/community" >> /etc/apk/repositories \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk --no-cache add tzdata && rm -rf /etc/TZ \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD ["sh"]
