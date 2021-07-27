import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'unlogged_form_state.dart';

class UnloggedFormCubit extends Cubit<UnloggedFormState> {
  UnloggedFormCubit() : super(LoginForm());
}
