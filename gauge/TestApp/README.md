# The Active Admin Store

The [Gauge example](https://github.com/getgauge/gauge-example-java) is for this application.

# To run this app locally
```
bundle install
bundle exec rake db:drop db:create db:migrate db:seed
bundle exec rails s
```

# To run this app on Docker

Run the following commands and navigate to localhost:8000
```
docker build -t gauge-demo-app .
docker run -p 8000:8000 gauge-demo-app
```

If you are using VirtualBox to manage docker machines, ensure you have enabled port forwarding.
  * Open VirtualBox. Go to Network Settings of the docker machine.
  * Click port forwarding
  * Add a new rule with the following details
    * Name: `Gauge`
    * Protocol: `TCP`
    * Host IP: `127.0.0.1`
    * Host Port: `8000`
    * Guest IP: `127.0.0.1`
    * Guest Port: `8000`
