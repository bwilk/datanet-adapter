
### Build 

~~~~

docker build --tag=datanet-adapter .

~~~~

### Run 

~~~~

docker run -e AUTH=$AUTH --read-only -v /tmp:/data datanet-adapter

~~~~