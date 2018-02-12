protractor = require('./config.js');
var config = protractor.config;

config.capabilities = {
    browserName: 'firefox',
    version: '58',
    platform: 'macOS 10.12',
    build: process.env('BUILD_TAG'),
    name: "mac12-firefox"
};

exports.config = config;
