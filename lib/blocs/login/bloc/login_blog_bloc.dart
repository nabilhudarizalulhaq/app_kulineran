import 'package:apps_kulineran/blocs/login/bloc/login_blog_event.dart';
import 'package:apps_kulineran/blocs/login/bloc/login_blog_state.dart';
import 'package:apps_kulineran/data/services/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginService.login(event.email, event.password);
        if (user != null) {
          emit(LoginSuccess(token: user.token));
        } else {
          emit(LoginFailure(error: "Login failed: Incorrect email or password"));
        }
      } catch (e) {
        emit(LoginFailure(error: "Login failed: ${e.toString()}"));
      }
    });
  }
}
