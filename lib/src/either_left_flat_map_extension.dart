import 'package:dartz/dartz.dart';

extension LeftFlatMap<L, R> on Either<L, R> {
  Either<L2, R> leftFlatMap<L2>(Function1<L, Either<L2, R>> f) => fold(f, right);
}
