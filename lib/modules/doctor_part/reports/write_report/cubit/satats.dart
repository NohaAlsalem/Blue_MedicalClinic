abstract class StatestoReport{}
class InitialState extends StatestoReport{}
class DropdownState extends StatestoReport{}
class ChooseImageState extends StatestoReport{}
class SuccessStates extends StatestoReport{}
//class InitialState extends StatestoReport{}

class SuccessState extends StatestoReport{

  List info;

  SuccessState(this.info);

}
class DoctorSelected extends StatestoReport{
  String name;
  DoctorSelected(this.name);
}
class RecepDataSuccess extends StatestoReport{
  List name;
  RecepDataSuccess(this.name);
}
