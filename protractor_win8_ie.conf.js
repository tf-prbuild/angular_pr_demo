protractor = require('./config.js');
var config = protractor.config;

config.capabilities = {
    browserName: 'internet explorer',
    version: '10',
    platform: 'Windows 8',
    name: 'win8-ie10',
    build: process.env('BUILD_TAG'),
    seleniumVersion: "3.8.1"
};

exports.config = config;
