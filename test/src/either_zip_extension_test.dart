import 'package:dartz/dartz.dart';
import 'package:dartz_extensions/dartz_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('zip', () {
    const int tEitherValue = 42;
    final Either<String, int> tEither = right<String, int>(tEitherValue);

    test('Should return [Tuple<R, R2>] when both [Either]s are Right', () {
      const int tOtherValue = 50;
      final Either<String, int> tOther = right<String, int>(tOtherValue);

      final Either<String, Tuple2<int, int>> result = tEither.zip(tOther);

      expect(result, right(tuple2(tEitherValue, tOtherValue)));
    });

    test('Should return the first Left encountered, Right.zip(Left)', () {
      const String tOtherValue = 'foo';
      final Either<String, int> tOther = left<String, int>(tOtherValue);

      final Either<String, Tuple2<int, int>> result = tEither.zip(tOther);

      expect(result, left(tOtherValue));
    });

    test('Should return the first Left encountered, Left.zip(Left)', () {
      const String tEitherLeftValue = 'bar';
      final Either<String, int> tEitherLeft = left<String, int>(tEitherLeftValue);
      final Either<String, int> tOther = left<String, int>('foo');

      final Either<String, Tuple2<int, int>> result = tEitherLeft.zip(tOther);

      expect(result, left(tEitherLeftValue));
    });
  });

  group('zipLeft', () {
    const String tEitherValue = 'foo';
    final Either<String, int> tEither = left<String, int>(tEitherValue);

    test('Should return [Tuple<L, L2>] when both [Either]s are Left', () {
      const String tOtherValue = 'bar';
      final Either<String, int> tOther = left<String, int>(tOtherValue);

      final Either<Tuple2<String, String>, int> result = tEither.zipLeft(tOther);

      expect(result, left(tuple2(tEitherValue, tOtherValue)));
    });

    test('Should return the first Right encountered, Left.zipLeft(Right)', () {
      const int tOtherValue = 50;
      final Either<String, int> tOther = right<String, int>(tOtherValue);

      final Either<Tuple2<String, String>, int> result = tEither.zipLeft(tOther);

      expect(result, right(tOtherValue));
    });

    test('Should return the first Right encountered, Right.zipLeft(Right)', () {
      const int tEitherRightValue = 42;
      final Either<String, int> tEitherRight = right<String, int>(tEitherRightValue);
      final Either<String, int> tOther = right<String, int>(50);

      final Either<Tuple2<String, String>, int> result = tEitherRight.zipLeft(tOther);

      expect(result, right(tEitherRightValue));
    });
  });
}