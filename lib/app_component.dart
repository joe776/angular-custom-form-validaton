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
      <input type="text" ngControl="myInput" #myInput="ngForm" validateParameters />
      <input type="text" ngControl="myRequiredInput" #myRequiredInput="ngForm" required />

      <br><span *ngIf="myInput.valid">myInput control is valid</span>
      <br><span *ngIf="!myInput.valid">myInput control is invalid</span>

      <br><span *ngIf="myRequiredInput.valid">myRequiredInput control is valid</span>
      <br><span *ngIf="!myRequiredInput.valid">myRequiredInput control is invalid</span>
    </form>''',
  styles: [
    ':valid {  border-color: #28a745;  border-width: 3px; }',
    ':invalid {  border-color: #dc3545;  border-width: 3px; }'])
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
