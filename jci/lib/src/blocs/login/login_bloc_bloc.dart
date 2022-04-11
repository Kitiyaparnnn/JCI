import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/login/LoginModel.dart';
import '../../my_app.dart';
import '../../services/SharedPreferencesService.dart';
import '../../utils/Constants.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _preferencesService = SharedPreferencesService();

  LoginState get initialState => LoginStateInitial();

  LoginBloc() : super(LoginStateInitial()){
    on<LoginEventStart>(_mapLoginEventStartToState);
    on<LoginEventOnPress>(_mapLoginEventLoginToState);
    on<LoginEventIsShowPasswordToggle>(_mapLoginEventIsShowPasswordToggleToState);
  }
   _mapLoginEventStartToState(LoginEventStart event, Emitter emit) async {
    final bool isRemember = await _preferencesService.preferenceGetRememberUsername();
    emit(LoginStateIsRemember(isRemember: isRemember));
  }

  _mapLoginEventLoginToState(LoginEventOnPress event, Emitter emit) async {
    emit(LoginStateLoading());

    try {
      String? errorUsernamePassword;

      if (event.loginData.username!.isEmpty || event.loginData.password!.isEmpty) {
        errorUsernamePassword = Constants.TEXT_LOGIN_FAILED;
      }

      if (errorUsernamePassword == null) {
        await Future.delayed(Duration(seconds: 2));
        emit(LoginStateLoaded());
        // authenticationBloc!.add(AuthEventLoggedIn(user: event.loginData));
      } else {
        emit(LoginStateInValid(errorUsernamePassword: errorUsernamePassword.toString()));
      }
    } catch (error) {
      logger.e(error);
      emit(LoginStateFailure(error: Constants.TEXT_LOGIN_FAILED));
    }
  }

   _mapLoginEventIsShowPasswordToggleToState(LoginEventIsShowPasswordToggle event, Emitter emit) async {
    emit(LoginStateIsShowPassword(isShow: !event.isShow));
  }

}
