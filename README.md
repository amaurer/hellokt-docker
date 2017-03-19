# hellokt-docker
Container running hellokt repo

`docker build -t amaurer/hellokt:1.0 .`
`docker run -e NODE_ENV='production' -e PORT='8080' -p 8080:8080 --name hellokt -d --restart=always amaurer/hellokt:1.0`

`docker build -t amaurer/hellokt:1.0 . && docker save -o hellokt.dkrsv amaurer/hellokt:1.0 && scp hellokt.dkrsv pi@192.168.2.11:/home/pi/hellokt.dkrsv`
