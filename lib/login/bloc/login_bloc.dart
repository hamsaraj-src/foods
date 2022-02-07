import 'bloc.dart';
import 'package:bloc/bloc.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  // LogInBloc(LogInState initialState) : super(initialState);
  // LogInState get initialState => LogInInitialState(true);
  LogInBloc() : super(null) {}
  LogInState get initialState => LogInInitialState(true);

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    if (event is LoginNextbutton) {
      if (event.value == "hai") {
        print(event.value);
        print("object");
        yield LogInSuccessState(event.isEmail, event.value);
      } else {
        yield LogInFailureState("error");
      }
    } else {
      print("event.value");
    }
  }
}
