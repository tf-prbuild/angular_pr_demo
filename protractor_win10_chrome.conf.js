protractor = require('./config.js');
var config = protractor.config;

config.capabilities = {
    browserName: 'chrome',
    version: '61',
    platform: 'Windows 10',
    name: "win10-chrome",
    build: process.env('BUILD_TAG'),
    seleniumVersion: "3.8.1"
};

exports.config = config;
