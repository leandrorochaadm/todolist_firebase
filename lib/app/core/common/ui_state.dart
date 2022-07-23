import 'package:equatable/equatable.dart';

abstract class UIState extends Equatable {
  final String description;

  const UIState(this.description);
}

class UIInitialState extends UIState {
  const UIInitialState() : super('');

  @override
  List<Object> get props => [description];
}

class UIInactiveState extends UIState {
  const UIInactiveState() : super('');

  @override
  List<Object> get props => [description];
}

class UILoadingState extends UIState {
  const UILoadingState() : super('');

  @override
  List<Object> get props => [description];
}

class UIErrorState extends UIState {
  final bool shouldRetry;

  const UIErrorState(String description, {this.shouldRetry = true})
      : super(description);

  @override
  List<Object> get props => [description, this.shouldRetry];
}

class UISuccessState extends UIState {
  const UISuccessState(String description) : super(description);

  @override
  List<Object> get props => [description];
}
