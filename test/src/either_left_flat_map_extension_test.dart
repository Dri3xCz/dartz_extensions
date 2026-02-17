import 'package:dartz/dartz.dart';
import 'package:dartz_extensions/dartz_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('leftFlatMap', () {
    test('Should return [Either<L, R>] when calling on Left, executing the combinator function', () {
      const String tEitherValue = 'foo';
      final Either<String, int> tEither = left<String, int>(tEitherValue);

      final Either<String, int> result = tEither.leftFlatMap((String l) => left('$l bar'));

      expect(result, left('$tEitherValue bar'));
    });

    test('Should return [Either<L, R>] when calling on Right, without executing the combinator function', () {
      final Either<String, int> tEither = right<String, int>(42);

      final Either<String, int> result = tEither.leftFlatMap((String l) => left('$l bar'));

      expect(result, tEither);
    });
  });
}