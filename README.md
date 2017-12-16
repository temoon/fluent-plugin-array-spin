# fluent-plugin-array-spin

[Fluentd](https://fluentd.org/) filter plugin to spin entry with an array field into multiple entries.

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

* **key_name** (string) (required): Key name to spin
* **reserve_key** (bool) (optional): Keep original key in parsed result.
* **hash_value_field** (string) (optional): Store parsed values as a hash value in a field in case of value is not an object.
  * Default value: `data`.

* See also: [Filter Plugin Overview](https://docs.fluentd.org/v0.14/articles/filter-plugin-overview)

## Copyright

* Copyright(c) 2017, Tema Novikov
* License
  * Apache License, Version 2.0
