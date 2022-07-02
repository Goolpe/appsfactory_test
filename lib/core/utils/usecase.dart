import 'package:appsfactory_test/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure<dynamic>, Type>> call(Params params);
}

class NoParams extends Equatable {
  
  @override
  List<Object> get props => <Object>[];
}
