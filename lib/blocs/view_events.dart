import 'package:equatable/equatable.dart';

abstract class ViewEvent extends Equatable {
  const ViewEvent();

  @override
  List<Object> get props => [];
}

class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}