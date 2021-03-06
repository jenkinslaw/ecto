var Generate = {};
(function(){
  "use strict";
  Generate.FormTests = function(id, casper) {
    /* global FormFactory: true */
    var form = new FormFactory(id, casper);
    var fields = form.fields;

    var formName = id.toCamel();
    casper.echo('var ' + formName + ' = new FormFactory("' + id +'", casper);');
    casper.echo('var fields = ' + formName + '.fields;');
    casper.echo(formName + '.assertExists(' + '"The form: ' + id +' exists.");');
    casper.echo('');

    for(var field_id in fields) {
      var field = fields[field_id];
      // Do not generate automatic tests for hidden fields.
      if (field.type !== 'hidden') {
        Generate.FormTests.Fields(field, casper);
      }
    }
  };

  Generate.FormTests.Fields = function(field, casper) {
    var field_id = field.field_id;

    casper.echo('var ' + field_id + ' = fields.' + field_id  + ';' );
    casper.echo(field_id);
    casper.echo('  .assertExists("The field - ' + field.name + ' is present.")');
    if (field.label) {
      casper.echo('  .assertLabel("' + field.label + '", "The field label is: ' + field.label + '")');
    }
    casper.echo('  .assertType("' + field.type + '", "The field type is: ' + field.type + '")');
    casper.echo('  .assertValue("' + field.value + '", "The field value is: ' + field.value + '");');

    if (field.nodeType === 'select') {
      Generate.FormTests.Selectors(field, casper);
    }
    casper.echo('casper.echo(\'\');');
    casper.echo('');
  };

  Generate.FormTests.Selectors = function(field, casper) {
    var field_id = field.field_id;
    casper.echo('');
    for (var option in field.options) {
      var value = field.options[option].value;
      var label = field.options[option].label;
      var fieldText = field_id + '.options.' + option;
      var assertValueText = fieldText + '.assertValue("' + value + '", "The option value is: ' + value + '")';
      var assertLabelText = ' .assertLabel("' + label + '", "The option label  is: ' + label + '");';
      casper.echo(assertValueText);
      casper.echo(assertLabelText);
    }
  };


  Generate.ViewTests = function(id, casper) {
    /* global ViewFactory: true */
    var view = new ViewFactory(id, casper);
  };
}())
