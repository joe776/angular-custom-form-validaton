import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'my-app',
  directives: [coreDirectives, formDirectives, ParameterValidator],
  template: '''
  <h1>Hello {{name}}</h1>
  <form #myForm="ngForm">
    <input type="text" ngControl="myInput" validateParameters />
  </form>
  ''',
)
class AppComponent {
  var name = 'Angular';
}

@Directive(selector: '[validateParameters]', providers: [
  ExistingProvider.forToken(NG_VALIDATORS, ParameterValidator),
])
class ParameterValidator extends Validator {
  @override
  Map<String, dynamic> validate(AbstractControl control) {
    print('in validator');
    return {'invalid': 'for some reason...'};
  }
}
