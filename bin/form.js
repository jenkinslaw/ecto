
var casper = require('casper').create();
var includes = casper.cli.get('includes').split(',');

// Load our include files.
casper.each(includes, function(self, include) {
  phantom.injectJs(include);
});

var url       = casper.cli.get('url');
var id        = casper.cli.get('id');



casper.start().open(url).then(function() {Generate.FormTests();});
casper.run(function(){casper.exit();});


var Generate = {};
Generate.FormTests = function() {
  var form = new Form(id);
  var formValues = casper.getFormValues(form.getSelector());
  require('utils').dump(formValues);

  casper.echo(formValues);
  casper.echo("var form = Eval.getForm(id)");
};


