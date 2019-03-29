# ✨ mirror_json

[![star this repo](https://githubbadges.com/star.svg?user=kekland&repo=mirror_json&style=flat)](https://github.com/kekland/mirror_json)
[![fork this repo](https://githubbadges.com/fork.svg?user=kekland&repo=mirror_json&style=flat)](https://github.com/kekland/mirror_json/fork)
![Build](https://img.shields.io/travis/kekland/mirror_json.svg)
![Pub](https://img.shields.io/pub/v/mirror_json.svg)

A **Dart** library for parsing JSON objects using `dart:mirrors`.

**Important: This library does not work in Flutter.**

## 🔨 Installation

Add [`mirror_json`](https://pub.dartlang.org/packages/mirror_json) to your dependencies.
```yaml
dependencies:
    ...
    mirror_json:
```

Now get the packages.
```bash
pub get
```

## 🔮 Getting started

`mirror_json` uses a concept of *Parsers*. There are a bunch of parsers for simple types (int, double, String) already in the package, but in order to parse a class, you have to make a `ClassParser` instance.

```dart
import 'package:mirror_json/mirror_json.dart';

@JsonParseable()
class MyClass {
...
}

void main() {
    GlobalJsonParserInstance.initialize();
    var parser = ClassParser<MyClass>();

    // From json
    var myObject = parser.fromJson({...});

    // To json
    var json = parser.toJson(myObject);
}
```

Woah, what just happened?

First, we initialized `mirror_json`'s main class, `GlobalJsonParserInstance`. Then, we created a parser for `MyClass`. Now you can use the parser to transform your JSON objects to `MyClass` instances or `MyClass` objects to JSON.

## 💡 Example

See example under `example` folder.

## 📚 Docs

See docs [**here**](https://kekland.github.io/mirror_json)

## 📭 Contact me

E-Mail: **kk.erzhan@gmail.com**