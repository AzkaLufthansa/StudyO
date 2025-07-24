import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit({required this.authService}) : super(AuthInitial());

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    try {
      final response = await authService.googleSignIn();

      if (response.session == null) {
        emit (AuthFailure(errMessage: 'Auth session not found.'));
        return;
      }

      emit(AuthSuccess(authSession: response.session!));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}