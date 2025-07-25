part of 'post_material_cubit.dart';

abstract class PostMaterialState {
  final String? errorMessage;

  const PostMaterialState({
    this.errorMessage,
  });
}

class PostMaterialInitial extends PostMaterialState {}

class PostMaterialLoading extends PostMaterialState {}

class PostMaterialSuccess extends PostMaterialState {
  final String materialId;

  const PostMaterialSuccess({required this.materialId});
}

class PostMaterialFailure extends PostMaterialState {
  final String errorMessage;

  const PostMaterialFailure(this.errorMessage) : super(errorMessage: errorMessage);
}
