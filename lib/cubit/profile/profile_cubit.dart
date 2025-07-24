import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/cubit/profile/profile_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SupabaseClient supabase;

  ProfileCubit({required this.supabase}) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        emit(ProfileError("User belum login"));
        return;
      }

      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (data == null) {
        emit(ProfileError("Profil tidak ditemukan"));
        return;
      }

      final profile = UserModel.fromMap(data);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError("Gagal ambil profil: ${e.toString()}"));
    }
  }
}
