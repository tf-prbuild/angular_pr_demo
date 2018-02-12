exports.config = {
  sauceUser: process.env.SAUCE_USERNAME,
  sauceKey: process.env.SAUCE_ACCESS_KEY,

  specs: ['specs/*spec.js'],

  getPageTimeout: 60000,
  allScriptsTimeout: 60000,

  onComplete: function() {

    var printSessionId = function(jobName){
      browser.getSession().then(function(session) {
        console.log('SauceOnDemandSessionID=' + session.getId() + ' job-name=' + jobName);
      });
    };
    printSessionId("Insert Job Name Here");
  },

  jasmineNodeOpts: {
    defaultTimeoutInterval: 60000
  }
};
