import 'package:fpdart/fpdart.dart';
import 'package:throtl/core/error_handling/failure.dart';

typedef FutureEither<T> = Future<Either<Failure,T>>;
typedef Futurevoid = Future<void>;