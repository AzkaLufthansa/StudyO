part of 'material_cubit.dart';

abstract class MaterialState {
  final List<MaterialModel>? material;
  final String? errMessage;

  const MaterialState({
    this.material,
    this.errMessage,
  });
}

class MaterialInitial extends MaterialState {}

class MaterialLoading extends MaterialState {}

class MaterialSuccess extends MaterialState {
  final List<MaterialModel> material;

  const MaterialSuccess({required this.material})
      : super(material: material);
}

class MaterialFailure extends MaterialState {
  final String errMessage;

  const MaterialFailure({required this.errMessage})
      : super(errMessage: errMessage);
}
