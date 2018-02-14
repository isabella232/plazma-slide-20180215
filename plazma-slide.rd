= Cooperative works \nfor \nFluentd Community

: author
  Kenji Okimoto\n
  Hiroshi Hatake

: institution
  ClearCode Inc.

: date
  2018-02-15

: theme
  .

= Summary

  * kafka-connect-fluentd and its benckmarking result
  * maintaining fluentd plugins

= kafka-connect-fluentd?

  * Fluentd Forward Protocol Server implemented with Kafka Connect API
    * ((<kakfa-connect-fluentd|URL:https://github.com/fluent/kafka-connect-fluentd>))

= kafka-connect-fluentd?

  * Use ((<influent|URL:https://github.com/okumin/influent>)) for server implementation
    * Partial SSL/TLS support
  * Aim to replace output plugins in ((<fluent-plugin-kafka|URL:https://github.com/fluent/fluent-plugin-kafka>))

= Kafka Connect?

  # blockquote
  # title = Kafka Connect
  (('tag:x-small:Kafka Connect is a framework included in Apache Kafka that integrates Kafka with other systems.'))
  (('tag:x-small:Its purpose is to make it easy to add new systems to your scalable and secure stream data pipelines.'))

= Kafka Connect?

  * Kafka Producer ->\nKafka Connector Source
    * (('tag:x-small:I'll talk about this implementation.'))
  * Kafka Consumer ->\nKafka Connector Sink
    * (('tag:x-small:This implementation also exists.'))

= kafka-connect-fluentd

(('tag:xx-small'))

  # image
  # src = images/Fluentd-with-kafka-connect-fluentd.001.jpeg
  # relative_height = 100

= fluent-plugin-kafka

(('tag:xx-small'))

  # image
  # src = images/Fluentd-to-kafka-with-fluent-plugin-kafka.002.jpeg
  # relative_height = 100


= The difference of fluent-plugin-kafka

  * kafka-connect-fluentd is implemented with Kafka connect framework on Java.
    * Run on Kafka side
  * fluent-plugin-kafka is implemented with Ruby.
    * Run on Fluentd side

= Requirements of benchmarking

  * Easy to use benchmark test tool
  * Make benchmark tests to be reproducible
  * Compare performance with same basis
    * Easy to confirm benchmark results

= Easy to use benchmarking test tool

  * There is no tool which is easy to use from command line.
  * Dummer + in_tail exist, but it is hard to apply high load.

= Crated benchmark test tool

  * ((<fluent-benchmark-client|URL:https://github.com/okkez/fluent-benchmark-client>))
    * Implemented by Kotlin language
    * Sending log relies on ((<fluency|URL:https://github.com/komamitsu/fluency>))
      * (('note:SSL/TLS is not supported for now.'))

= Reproducible

  * (('tag:small:Built with Terraform + Ansible'))
    * Developing specific branch on ((<fluentd-benchmark|URL:https://github.com/okkez/fluentd-benchmark/tree/add-benchmark-using-gcp>))
       * (('note:Need to tidy up implementation'))

= (('tag:small:Compare performance\\nwith same basis'))

  * ((<kafka-fluent-metrics-reporter|URL:https://github.com/okkez/kafka-fluent-metrics-reporter>))
    * (('tag:x-small:Kafka plugin which sends Kafka metrics into Fluentd'))
  * (('tag:small:Write a script which parses result of pidstat and sends into Fluentd'))
    * (('tag:x-small:To measure CPU and memory usage'))

= (('tag:small:Benchmark environment'))

  # image
  # src = images/structure.svg
  # relative_height = 85

(('note:GCP n1-standard-2 (vCPUx2, memory 7.5GB)'))

= (('tag:small:VS. fluent-plugin-kafka\\nCPU usage'))

  # image
  # src = images/out_kafka-max_buffer_size=1000-10k.png
  # relative_height = 80

(('note:out_kafka CPU usage is 40-60%'))

= (('tag:small:VS. fluent-plugin-kafka\\nCPU usage'))

  # image
  # src = images/kafka-connect-fluentd-worker1-10k.png
  # relative_height = 80

(('note:kafka-connect-fluentd CPU usage is less than 20%'))

= (('tag:small:VS. fluent-plugin-kafka\\nevents/sec'))

  # image
  # src = images/out_kafka_buffered-kafka_agg_max_bytes=4k-30k.png
  # relative_height = 80

(('note:out_kafka_buffered cannot process 30k events/sec'))

= (('tag:small:VS. fluent-plugin-kafka\\nevents/sec'))

  # image
  # src = images/kafka-connect-fluentd-worker1-50k.png
  # relative_height = 80

(('note:kafka-connect-fluentd can process about 50k events/sec'))

= Benchmark results

  * kafka-connect-fluentd can handle more 50,000 events/sec
  * output plugin of fluent-plugin-kafka can handle 10,000 events/sec
    * cannot handle 30,000 events/sec in this environment


= Fluentd Community

  * Fluentd community has...
    * lots of plugins
      * Over 700+ plugins

= Fluentd Community

  * Fluentd community has...
    * lots of up-to-date plugins
    * lots of outdated plugins

= Fluentd Community

  * Fluentd community has...
    * lots of up-to-date plugins
    * lots of ((*outdated*)) plugins

= How does handle outdated plugins?

  * Send PRs
  * Report issues
  * Become a maintainer

= What means ((*outdated*))?

  * out-of-date dependencies
    * c.f. client libraries
  * out-of-date class inheritance
    * (('Fluent::Input')), (('Fluent::HttpInput')) etc.

= What means ((*outdated*))?

  * Using old API
    * Gap between v0.12 and v1.0 API
  * ((*Fluent::Engine.emit*)) directly
  * Lack of requires etc.

= Maintaining Plugins

  * Normally, same as other rubygems

= Maintaining Plugins

  * Report issues
  * Send PRs

= Maintaining Plugins

  * 130+ PRs still opened...
  * 1400+ PRs merged

= Maintaining Plugins

  * But, sometimes plugin authors are busy....

= (('tag:small:Let\'s take over\\nFluentd plugins project'))

  * Ask plugin authors
    * to add project collaborator
    * to add gem owner
  * Create a cooperative working organization

= Become project collaborator

  * Maintaining only
    * takus/fluent-plugin-ec2-metadata
    * y-ken/fluent-plugin-anonymizer

= (('tag:small:Become project collaborator and gem owner'))

  * Still exists in original place, but maintaining ourselves
    * (('tag:x-small:uken/fluent-plugin-elasticsearch'))
    * (('tag:x-small:y-ken/fluent-plugin-geoip'))
    * (('tag:x-small:fluent/fluent-plugin-rewrite-tag-filter'))

= (('tag:small:Create cooperative working organization'))

  * (('tag:x-small:Take over outdated fluentd plugin project'))
  * (('tag:x-small:New plugins which will be widely used'))
     * (('note:c.f. fluent-plugin-concat'))
  * (('tag:x-small:And some collaborations'))

= (('tag:small:Create cooperative working organization'))

  * fluent-plugins-nursery

= fluent-plugins-nursery

  * (('tag:small:For Fluentd plugins that are not maintained by original authors'))
  * (('tag:small:Aim to provide a sustainable maintenance system for Fluentd community'))

= fluent-plugins-nursery

  * Almost plugins are taken over maintaining from original author.
    * fluent-plugin-map
    * fluent-plugin-redis
    * fluent-plugin-irc etc.

= fluent-plugins-nursery

  * Let's maintain fluentd plugins by community!
