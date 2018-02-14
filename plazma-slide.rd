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

  * Kafka Producer ->\nKafka Connector Source
    * (('tag:x-small:I'll talk about this implementation.'))
  * Kafka Consumer ->\nKafka Connector Sink
    * (('tag:x-small:This implementation also exists.'))

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
      * (('note:SSL/TLS is not supported for now.'))

= Reproducible

  * (('tag:small:Built with Terraform + Ansible'))
    * Developing specific branch on ((<fluentd-benchmark|URL:https://github.com/okkez/fluentd-benchmark/tree/add-benchmark-using-gcp>))
       * (('note:Need to tidy up implementation'))

= Compare performance with same basis

  * ((<kafka-fluent-metrics-reporter|URL:https://github.com/okkez/kafka-fluent-metrics-reporter>))
    * Kafka plugin which sends Kafka metrics into Fluentd
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

