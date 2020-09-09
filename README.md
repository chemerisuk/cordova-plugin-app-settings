# cordova-plugin-app-settings
[![NPM version][npm-version]][npm-url] [![NPM downloads][npm-downloads]][npm-url] [![Twitter][twitter-follow]][twitter-url]

| [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)][donate-url] | Your help is appreciated. Create a PR, submit a bug or just grab me :beer: |
|-|-|

## Index

<!-- MarkdownTOC levels="2" autolink="true" -->

- [Supported Platforms](#supported-platforms)
- [Installation](#installation)
- [Methods](#methods)

<!-- /MarkdownTOC -->

## Supported Platforms

- iOS
- Android

## Installation

    $ cordova plugin add cordova-plugin-app-settings

## Methods
Every method returns a promise that fulfills when a call was successful.

### getString(_key_) : Promise<String>
Get a string value for a key.
```js
cordova.plugins.settings.getString("foo").then(function(value) {
    console.log("foo value is:", value);
});
```

### setString(_key_, _value_) : Promise<Void>
Sets a string value for a key.
```js
cordova.plugins.settings.setString("foo", "bar").then(function() {
    console.log("foo value is updated");
});
```

### getNumber(_key_) : Promise<Number>
Get a numeric value for a key.
```js
cordova.plugins.settings.getNumber("foo").then(function(value) {
    console.log("foo value is:", value);
});
```

### setNumber(_key_, _value_) : Promise<Void>
Sets a numeric value for a key.
```js
cordova.plugins.settings.setNumber("foo", 123).then(function() {
    console.log("foo value is updated");
});
```

### getBoolean(_key_) : Promise<Boolean>
Get a boolean value for a key.
```js
cordova.plugins.settings.getNumber("foo").then(function(value) {
    console.log("foo value is:", value);
});
```

### setBoolean(_key_, _value_) : Promise<Void>
Sets a boolean value for a key.
```js
cordova.plugins.settings.setNumber("foo", true).then(function() {
    console.log("foo value is updated");
});
```

[npm-url]: https://www.npmjs.com/package/cordova-plugin-app-settings
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-app-settings.svg
[npm-downloads]: https://img.shields.io/npm/dm/cordova-plugin-app-settings.svg
[twitter-url]: https://twitter.com/chemerisuk
[twitter-follow]: https://img.shields.io/twitter/follow/chemerisuk.svg?style=social&label=Follow%20me
[donate-url]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ECY6LCPZDB5DJ&source=url