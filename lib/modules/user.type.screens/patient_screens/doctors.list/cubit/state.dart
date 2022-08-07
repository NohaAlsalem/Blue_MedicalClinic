
abstract class TimeStates{}


class InitialTimeState extends TimeStates{}

class CounterXTimeState extends TimeStates{

  var x=0;
  CounterXTimeState(this.x);
}

class StartTimeHourState extends TimeStates{

dynamic startH;

  StartTimeHourState(this.startH);
}

class StartTimeMinuteState extends TimeStates{

  dynamic startM;

  StartTimeMinuteState(this.startM);
}

class EndTimeHourState extends TimeStates{

  dynamic endH;

  EndTimeHourState(this.endH);
}

class EndTimeMinuteState extends TimeStates{

  dynamic endM;

  EndTimeMinuteState(this.endM);
}

class ErrorTimeState extends TimeStates{

  String error;
  ErrorTimeState(this.error);
}

class NameState extends TimeStates{

  String name;
  NameState(this.name);
}


class AgeState extends TimeStates{

  String age;
  AgeState(this.age);
}


class IdState extends TimeStates{

  String id;
  IdState(this.id);
}


class PhoneState extends TimeStates{

  String phone;
  PhoneState(this.phone);
}


class SuccessState extends TimeStates{

  SuccessState();
}

class FailedState extends TimeStates{

  String error;
  FailedState(this.error);
}

class FetchDataState extends TimeStates{

  FetchDataState();
}

class FetchNameDoctorState extends TimeStates{

  String name;

  FetchNameDoctorState(this.name);
}

class PatientHomeGastroenterology extends TimeStates
{
  String saction;
  PatientHomeGastroenterology(this.saction);

}


// class DoctorNameState extends TimeStates{
//   String name;
//
//   DoctorNameState(this.name);
// }


// class DayState extends TimeStates{
//
//   String day;
//   DayState(this.day);
// }




