// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_controller.dart';

enum RegisterStatus { initial, register, success, error }

class RegisterState extends Equatable {
  final RegisterStatus status;

  const RegisterState({required this.status});

  @override
  List<Object> get props => [status];

  const RegisterState.initial() : status = RegisterStatus.initial;

  RegisterState copyWith({RegisterStatus? status}) {
    return RegisterState(status: status ?? this.status);
  }
}
