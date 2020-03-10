import 'package:equatable/equatable.dart';

abstract class ViewState extends Equatable {
  const ViewState();

  @override
  List<Object> get props => [];
}

class StartedState extends ViewState {
  const StartedState();

  @override
  List<Object> get props => [];
}

class InitializedState extends ViewState {
  const InitializedState();

  @override
  List<Object> get props => [];
}

class UninitializedState extends ViewState {
  const UninitializedState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ViewState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class LoadedState extends ViewState {
  const LoadedState();

  @override
  List<Object> get props => [];
}

class EmptyState extends ViewState {
  const EmptyState();

  @override
  List<Object> get props => [];
}

class ErrorState extends ViewState {
  const ErrorState();

  @override
  List<Object> get props => [];
}

class CustomState extends ViewState {
  const CustomState();

  @override
  List<Object> get props => [];
}