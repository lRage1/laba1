FROM ubuntu:22.04  
 
RUN apt-get update && apt-get install -y dpkg  
  
COPY factorial_1.0-1_amd64.deb /tmp/factorial.deb  
 
RUN dpkg -i /tmp/factorial.deb || apt-get install -f -y  
  
RUN ls -la /usr/bin/first && chmod +x /usr/bin/first  

CMD ["sh", "-c", "echo '5' | /usr/bin/first"]
