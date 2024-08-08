part of 'login_controller.dart';

enum LoginStatus { initial, login, success, loginError, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;

  const LoginState({required this.status, this.errorMessage});

  @override
  List get props => [status, errorMessage];

  const LoginState.initial()
      : status = LoginStatus.initial,
        errorMessage = null;

  LoginState copyWith({LoginStatus? status, ValueGetter<String?>? errorMessage}) {
    return LoginState(status: status ?? this.status, errorMessage: errorMessage != null ? errorMessage() : this.errorMessage);
  }
}
