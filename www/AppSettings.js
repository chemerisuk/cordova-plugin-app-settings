var exec = require("cordova/exec");
var PLUGIN_NAME = "AppSettings";

module.exports = {
    getString: function(key) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "getString", [key]);
        });
    },
    setString: function(key, value) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setString", [key, value]);
        });
    },
    getNumber: function(key) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "getNumber", [key]);
        });
    },
    setNumber: function(key, value) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setNumber", [key, value]);
        });
    },
    getBoolean: function(key) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "getBoolean", [key]);
        });
    },
    setBoolean: function(key, value) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "setBoolean", [key, value]);
        });
    }
};
