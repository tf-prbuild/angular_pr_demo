protractor = require('./config.js');
var config = protractor.config;

config.capabilities = {
    browserName: 'internet explorer',
    version: '11',
    platform: 'Windows 10',
    name: "win10-ie11",
    build: process.env('BUILD_TAG'),
    seleniumVersion: "3.8.1"
};

exports.config = config;
