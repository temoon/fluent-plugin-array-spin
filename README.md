# fluent-plugin-array-spin

[Fluentd](https://fluentd.org/) filter plugin to spin array field to multiple lines.

## Examples

In:
```json
{"foo": "bar", "baz": [{"a": 1}, {"a": 2}, {"b": 3}]}
```
Out:
```json
{"foo": "bar", "a": 1}
{"foo": "bar", "a": 2}
{"foo": "bar", "b": 3}
```

In:
```json
{"foo": "bar", "baz": [1, 2, {"b": 3}]}
```
Out:
```json
{"foo": "bar", "data": 1}
{"foo": "bar", "data": 2}
{"foo": "bar", "b": 3}
```

## Installation

### RubyGems

```
$ gem install fluent-plugin-array-spin
```

### Bundler

Add following line to your Gemfile:

```ruby
gem "fluent-plugin-array-spin"
```

And then execute:

```
$ bundle
```

## Configuration

You can generate configuration template:

```
$ fluent-plugin-config-format filter array_spin
```

You can copy and paste generated documents here.

## Copyright

* Copyright(c) 2017- Tema Novikov
* License
  * Apache License, Version 2.0
