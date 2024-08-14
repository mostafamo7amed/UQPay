part of 'company_cubit.dart';

abstract class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class GetCompanyLoading extends CompanyState {}
final class GetCompanySuccessState extends CompanyState {}
final class GetCompanyErrorState extends CompanyState {}

final class UpdateCompanyTokenSuccessState extends CompanyState {}
final class UpdateCompanyTokenErrorState extends CompanyState {}

final class PikOfferImageSuccessState extends CompanyState {}
final class PikOfferImageErrorState extends CompanyState {}

final class UploadOfferImageSuccessState extends CompanyState {}
final class UploadOfferImageErrorState extends CompanyState {}

final class UpdateCashbackLoadingState extends CompanyState {}
final class UpdateCashbackSuccessState extends CompanyState {}
final class UpdateCashbackErrorState extends CompanyState {}

final class AddOfferLoadingState extends CompanyState {}
final class AddOfferSuccessState extends CompanyState {}
final class AddOfferErrorState extends CompanyState {}

final class GetOfferSuccessState extends CompanyState {}
final class GetOfferErrorState extends CompanyState {}

final class DeleteOfferSuccessState extends CompanyState {}
final class DeleteOfferErrorState extends CompanyState {}

final class AddProductLoadingState extends CompanyState {}
final class AddProductSuccessState extends CompanyState {}
final class AddProductErrorState extends CompanyState {}

final class GetProductSuccessState extends CompanyState {}
final class GetProductErrorState extends CompanyState {}

final class PikProductImageSuccessState extends CompanyState {}
final class PikProductImageErrorState extends CompanyState {}

final class UploadProductImageSuccessState extends CompanyState {}
final class UploadProductImageErrorState extends CompanyState {}

final class SelectProductTypeState extends CompanyState {}

final class UpdateProductStatusSuccessState extends CompanyState {}
final class UpdateProductStatusErrorState extends CompanyState {}
