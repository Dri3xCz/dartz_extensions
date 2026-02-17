import 'package:dartz/dartz.dart';
import 'package:dartz_extensions/src/either_left_flat_map_extension.dart';

extension Zip<L, R> on Either<L, R> {
  /// Zip two [Either]s together, returning a tuple of their values if both are [Right], or the first [Left] encountered.
  Either<L, Tuple2<R, R2>> zip<R2>(Either<L, R2> other)
    => flatMap((R r) => other.map((R2 r2) => Tuple2<R, R2>(r, r2)));

  /// Zip two [Either]s together, returning a tuple of their values if both are [Left], or the first [Right] encountered.
  Either<Tuple2<L, L2>, R> zipLeft<L2>(Either<L2, R> other)
    => leftFlatMap((L l) => other.leftMap((L2 l2) => Tuple2<L, L2>(l, l2)));
}