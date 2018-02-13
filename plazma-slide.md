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

* Kafka Connect API を使って実装した Fluentd Forward Protocol を話すサーバー
  * サーバー部分の実装には influent を使用
    * SSL/TLSは部分的にサポート
  * fluent-plugin-kafka の out_kafka, out_kafka_buffered, out_kafka2 の置き換えを目指している
  * [fluent/kakfa-connect-fluentd](https://github.com/fluent/kafka-connect-fluentd)

# Kafka Connect?

* Kafka Producer/Consumer を汎用化して実装しやすくしたもの
  * Kafka Producer <-> Kafka Connector Source
    * 今回はこっちについて話します
  * Kafka Consumer <-> Kafka Connector Sink
    * こちらの実装もあります

# VS. fluent-plugin-kafka

* ベンチマークしたい
  * コマンドラインで簡単に使えるベンチマークツールがない
  * dummer + in_tail はあるけど、セットアップに手間がかかる
    * 強いサーバーに負荷をかけるのが大変

# VS. fluent-plugin-kafka

* ベンチマークツール作った
  * [okkez/fluent-benchmark-client](https://github.com/okkez/fluent-benchmark-client)
    * Kotlin で実装
    * ログ送信部分は [komamitsu/fluency](https://github.com/komamitsu/fluency)
      * SSL/TLS は未サポート

# VS. fluent-plugin-kafka

* 再現性のあるベンチマークを簡単にしたい
  * Terraform + Ansible で環境構築
    * [fluentd-benchmark](https://github.com/okkez/fluentd-benchmark/tree/add-benchmark-using-gcp) にブランチを切って開発中
       * もう少し整理が必要

# VS. fluent-plugin-kafka

* 同じ基準で性能を比較したい
  * [okkez/kafka-fluent-metrics-reporter](https://github.com/okkez/kafka-fluent-metrics-reporter)
    * Kafka の metrics を Fluentd に送信する Kafka のプラグイン
    * Fluentd で加工してから influxdb に投げて grafana で可視化
  * pidstat の結果をパースして Fluentd に投げるスクリプト書いた
    * CPU使用率とメモリー使用量を測定するため

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

* But, sometimes plugin authors are busy....

# Let's take over Fluentd plugins project

* Ask plugin authors
  * to add project collaborator
  * to add gem owner
* Create cooperative working organization

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

* This organization is for Fluentd plugins that are not maintained by original authors.
* This organization aims to provide a sustainable maintenance system for Fluentd community.

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
