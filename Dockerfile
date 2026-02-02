FROM alpine:3.20
COPY bin/api-linux-amd64 /usr/local/bin/api
RUN chmod +x /usr/local/bin/api
EXPOSE 8080
CMD ["api"]
