# Cooperative works for Fluentd Community

author
:   Kenji Okimoto, Hiroshi Hatake

institution
:   ClearCode Inc.

theme
:   clear-code

# Summary

* kafka-connect-fluentd and its benckmarking result
* maintaining fluentd plugins

# kafka-connect-fluentd?

* Fluentd Forward Protocol Server implemented with Kafka Connect API
  * Use [influent](https://github.com/okumin/influent) for server implementation
    * Partial SSL/TLS support
  * Aim to replace out_kafka, out_kafka_buffered, out_kafka2 in fluent-plugin-kafka
  * [fluent/kakfa-connect-fluentd](https://github.com/fluent/kafka-connect-fluentd)

# Kafka Connect?

* It is generalized from Kafka Producer/Consumer and easy to implement Kafka Connector Source/Sink
  * Kafka Producer <-> Kafka Connector Source
    * I'll talk about this implementation.
  * Kafka Consumer <-> Kafka Connector Sink
    * This implementation also exists.

# VS. fluent-plugin-kafka

* Want to run benchmark tests
  * There is no tool which is easy to use from command line.
  * Dummer + in_tail exist, but it is hard to apply high load.

# VS. fluent-plugin-kafka

* Crated benchmark test tool
  * [okkez/fluent-benchmark-client](https://github.com/okkez/fluent-benchmark-client)
    * Implemented by Kotlin language
    * Sending log relies on [komamitsu/fluency](https://github.com/komamitsu/fluency)
      * SSL/TLS is not supported for now.

# VS. fluent-plugin-kafka

* Make benchmark tests to be reproducible
  * Built with Terraform + Ansible
    * Developing specific branch on [fluentd-benchmark](https://github.com/okkez/fluentd-benchmark/tree/add-benchmark-using-gcp)
       * Need to tidy up implementation

# VS. fluent-plugin-kafka

* Compare performance with same basis
  * [okkez/kafka-fluent-metrics-reporter](https://github.com/okkez/kafka-fluent-metrics-reporter)
    * Kafka plugin which sends Kafka metrics into Fluentd
    * Process with Fluentd, send to influxdb, and visualize with grafana
  * Write a script which parses result of pidstat and sends into Fluentd
    * To measure CPU and memory usage

# VS. fluent-plugin-kafka

* (ベンチマーク結果の説明)
* (全部は入れなくていい)
* (パフォーマンスチューニングについては、できればいれたい)

# Fluentd Community

* Fluentd community has...
  * lots of plugins
    * Over 700+ plugins

# Fluentd Community

* Fluentd community has...
  * lots of up-to-date plugins
  * lots of outdated plugins

# Fluentd Community

* Fluentd community has...
  * lots of up-to-date plugins
  * lots of _outdated_ plugins

# How does handle outdated plugins?

* Send PRs
* Report issues
* Become a maintainer

# What means _outdated_?

* out-of-date dependencies
  * c.f. client libraries
* out-of-date class inheritance
  * `Fluent::Input`
  * `Fluent::HttpInput` etc.
* Using old API
  * Gap between v0.12 and v1.0 API

# Maintaining Plugins

* Normally, same as other rubygems

# Maintaining Plugins

* Report issues
* Send PRs

# Maintaining Plugins

* 130+ PRs still opened...
* 1400+ PRs merged

# Maintaining Plugins

* But, sometimes plugin authors are busy....

# Let's take over Fluentd plugins project

* Ask plugin authors
  * to add project collaborator
  * to add gem owner
* Create a cooperative working organization

# Become project collaborator

* Maintaining only
  * takus/fluent-plugin-ec2-metadata
  * y-ken/fluent-plugin-anonymizer

# Become project collaborator and gem owner

* Still exists in original place, but maintaining ourselves
  * uken/fluent-plugin-elasticsearch
  * y-ken/fluent-plugin-geoip
  * fluent/fluent-plugin-rewrite-tag-filter

# Create cooperative working organization

* Cooperative working organization
  * Take over outdated fluentd plugin project
  * New plugins which will be widely used
     * c.f. fluent-plugin-concat
  * And some collaborations

# Create cooperative working organization

* fluent-plugins-nursery

# fluent-plugins-nursery

* For Fluentd plugins that are not maintained by original authors
* Aim to provide a sustainable maintenance system for Fluentd community

# fluent-plugins-nursery

* Almost plugins are taken over maintaining from original author.
  * fluent-plugin-map
  * fluent-plugin-redis
  * fluent-plugin-irc etc.

# fluent-plugins-nursery

* Let's maintain fluentd plugins by community!

# Powered By

* Rabbit shocker

![](https://raw.github.com/rabbit-shocker/rabbit/master/sample/lavie.png){:relative_height='80'}
