= Cooperative works\nfor\nFluentd Community

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
  Kafka Connect is a framework included in Apache Kafka that integrates Kafka with other systems.

= Kafka Connect?

  # blockquote
  # title = Kafka Connect
  Its purpose is to make it easy to add new systems to your scalable and secure stream data pipelines.

= Kafka Connect?

  * Kafka Producer <-> Kafka Connector Source
    * I'll talk about this implementation.
  * Kafka Consumer <-> Kafka Connector Sink
    * This implementation also exists.

= fluent-plugin-kafka との違い

(ここに図を入れたい fluent-plugin-kafka + kafka)

= fluent-plugin-kafka との違い

(ここに図を入れたい fluentd + kafka-connect + kafka)

= fluent-plugin-kafka との違い

  * ... TODO

= ベンチマークに必要なもの

  * 使いやすいベンチマークツール
  * Make benchmark tests to be reproducible
  * Compare performance with same basis
    * 結果を確認しやすいこと

= 使いやすいベンチマークツール

  * There is no tool which is easy to use from command line.
  * Dummer + in_tail exist, but it is hard to apply high load.

= Crated benchmark test tool

  * ((<fluent-benchmark-client|URL:https://github.com/okkez/fluent-benchmark-client>))
    * Implemented by Kotlin language
    * Sending log relies on ((<fluency|URL:https://github.com/komamitsu/fluency>))
      * SSL/TLS is not supported for now.

= Make benchmark tests to be reproducible

  * Built with Terraform + Ansible
    * Developing specific branch on ((<fluentd-benchmark|URL:https://github.com/okkez/fluentd-benchmark/tree/add-benchmark-using-gcp>))
       * Need to tidy up implementation

= Compare performance with same basis

  * ((<kafka-fluent-metrics-reporter|URL:https://github.com/okkez/kafka-fluent-metrics-reporter>))
    * Kafka plugin which sends Kafka metrics into Fluentd
    * Process with Fluentd, send to influxdb, and visualize with grafana
  * Write a script which parses result of pidstat and sends into Fluentd
    * To measure CPU and memory usage

= VS. fluent-plugin-kafka

  * (ベンチマーク結果の説明)
  * (全部は入れなくていい)

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
    * lots of _outdated_ plugins

= How does handle outdated plugins?

  * Send PRs
  * Report issues
  * Become a maintainer

= What means _outdated_?

  * out-of-date dependencies
    * c.f. client libraries
  * out-of-date class inheritance
    * `Fluent::Input`
    * `Fluent::HttpInput` etc.
  * Using old API
    * Gap between v0.12 and v1.0 API

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

= Let's take over Fluentd plugins project

  * Ask plugin authors
    * to add project collaborator
    * to add gem owner
  * Create a cooperative working organization

= Become project collaborator

  * Maintaining only
    * takus/fluent-plugin-ec2-metadata
    * y-ken/fluent-plugin-anonymizer

= Become project collaborator and gem owner

  * Still exists in original place, but maintaining ourselves
    * uken/fluent-plugin-elasticsearch
    * y-ken/fluent-plugin-geoip
    * fluent/fluent-plugin-rewrite-tag-filter

= Create cooperative working organization

  * Cooperative working organization
    * Take over outdated fluentd plugin project
    * New plugins which will be widely used
       * c.f. fluent-plugin-concat
    * And some collaborations

= Create cooperative working organization

  * fluent-plugins-nursery

= fluent-plugins-nursery

  * For Fluentd plugins that are not maintained by original authors
  * Aim to provide a sustainable maintenance system for Fluentd community

= fluent-plugins-nursery

  * Almost plugins are taken over maintaining from original author.
    * fluent-plugin-map
    * fluent-plugin-redis
    * fluent-plugin-irc etc.

= fluent-plugins-nursery

  * Let's maintain fluentd plugins by community!

