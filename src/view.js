var casper         = require('casper').create();
var url            = casper.cli.get('url');
var id             = casper.cli.get('id');
var casperIncludes = casper.cli.get('casperIncludes');


phantom.injectJs(casperIncludes + '/Eval.js');
phantom.injectJs(casperIncludes + '/../src/testGenerators.js');

casper.start().open(url).then(function() {Generate.ViewTests(id, this);});
casper.run(function(){this.exit();});

