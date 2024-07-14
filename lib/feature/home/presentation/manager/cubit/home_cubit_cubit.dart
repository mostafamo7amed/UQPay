import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  static HomeCubit getCubit(context) => BlocProvider.of(context);
}
