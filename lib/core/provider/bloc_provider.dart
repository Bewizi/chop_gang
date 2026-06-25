import 'package:chop_gang/core/data/di/injection.dart';
import 'package:chop_gang/features/auth/domain/auth_repository.dart';
import 'package:chop_gang/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> appBlocProvider = [
  BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(sl<AuthRepository>()),
  ),
];
