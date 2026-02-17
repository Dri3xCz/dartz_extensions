import 'package:dartz/dartz.dart';

extension Tap<L, R> on Either<L, R> {
  /// Perform a side-effecting operation on the [Right] value of this [Either], if it exists, and return the original [Either].
  Either<L, R> tap(Function1<R, void> f) => map((R r) { f(r); return r; });

  /// Perform a side-effecting operation on the [Left] value of this [Either], if it exists, and return the original [Either].
  Either<L, R> tapLeft(Function1<L, void> f) => leftMap((L l) { f(l); return l; });

  /// Perform side-effecting operations on both the [Left] and [Right] values of this [Either], depending on which one is present, and return the original [Either].
  Either<L, R> tapBoth(Function1<L, void> leftF, Function1<R, void> rightF) => fold(
    (L l) { leftF(l); return left(l); },
    (R r) { rightF(r); return right(r); }
  );
}