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
    <form #myForm="ngForm"><table><tr>
      <td>length &gt;= 4 </td><td> <input type="text" ngControl="myInput" #myInput="ngForm" validateParameters /></td>
      <td *ngIf="myInput.valid">control is valid</td>
      <td *ngIf="!myInput.valid">control is invalid</td>
      </tr><tr>
      <td>required </td><td> <input type="text" ngControl="myRequiredInput" #myRequiredInput="ngForm" required /></td>
      <td *ngIf="myRequiredInput.valid">control is valid</td>
      <td *ngIf="!myRequiredInput.valid">control is invalid</td>
    </tr></table></form>''',
  styles: [
    ':valid {  border-color: #28a745;  border-width: 3px; }',
    ':invalid {  border-color: #dc3545;  border-width: 3px; }'])
class AppComponent {
  var name = 'Custom Form Validation';
}

@Directive(selector: '[validateParameters]', providers: [
  ExistingProvider.forToken(NG_VALIDATORS, ParameterValidator),
])
class ParameterValidator extends Validator {
  @override
  Map<String, dynamic> validate(AbstractControl control) {
    print('in validator');
    final val = control.value;
    if (val == null || val is String && val.length < 4) {
      return {'invalid': 'for some reason...'};
    }
    return null;
  }
}
