curl -u administrator:workshop --data '{}' -X POST http://$(hostname):80/api/v1/scanner/registry/Docker%20Hub/image/onemtc%2fspringboot-recommendationservice:latest/scan
curl -u administrator:workshop --data '{}' -X POST http://$(hostname):80/api/v1/scanner/registry/Docker%20Hub/image/onemtc%2fspringboot-readinglistapplication:latest/scan
curl -u administrator:workshop --data '{}' -X POST http://$(hostname):80/api/v1/scanner/registry/Docker%20Hub/image/mysql%2fmysql-server:latest/scan
docker pull onemtc/springboot-recommendationservice:latest
docker pull onemtc/springboot-readinglistapplication:latest
docker pull mysql/mysql-server:latest 
