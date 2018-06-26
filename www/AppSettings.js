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
    }
};
