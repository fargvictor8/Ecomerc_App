part of 'homee_cubit.dart';

@immutable
sealed class HomeeState {}

final class HomeeInitial extends HomeeState {}
final class HomeLoading extends HomeeState {}
final class HomeeSuccess extends HomeeState {
  final User? user;

  HomeeSuccess(this.user);
}
final class HomeeError extends HomeeState {
final String message;
  HomeeError(this.message);
}