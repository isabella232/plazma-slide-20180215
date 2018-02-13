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
