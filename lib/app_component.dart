import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'my-app',
  directives: [
    coreDirectives,
    formDirectives,
    ParameterValidator],
  template: '''
    <h1>Hello {{name}}</h1>
    <form #myForm="ngForm">
      <input type="text" ngControl="myInput" #myInput="ngForm" [class.valid]="myInput.valid" [class.invalid]="!myInput.valid" validateParameters />
    </form>''',
  styles: [
    ':valid {  border-color: #28a745 !important;  border-width: 3px !important; }',
    ':invalid {  border-color: #dc3545 !important;  border-width: 3px !important; }'])
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
