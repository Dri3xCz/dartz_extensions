# dartz_extensions

**A small companion package for [dartz](https://pub.dev/packages/dartz) that extends `Either` with additional functional utilities.**

---

## Motivation

`dartz_plus` was created to **extend the capabilities of dartz** in a clean, idiomatic way, providing common functional combinators that are missing from the core library. This helps make working with `Either` more expressive and concise.

---

## Features

### Zip combinators

- **`zip`** – Combine two `Either` values into a `Tuple2` of their `Right` values, returns Right<Tuple> or first encountered Left.
- **`zipLeft`** – Combine two `Either` values into a `Tuple2` of their `Left` values, returns Left<Tuple> or first encountered Right.

### Side-effect combinators

- **`tap`** – Perform a side effect function on the `Right` value and return the original `Either`.
- **`tapLeft`** – Perform a side effect on the `Left` value and return the original `Either`.
- **`tapBoth`** – Perform a side effect on both values and return the original `Either`.

### Left-side mapping

- **`leftFlatMap`** – FlatMap operation on the `Left` side of an `Either`.

---

## Contributing

Contributions of any kind are **welcome**!  

Whether it’s:

- Bug reports  
- Feature suggestions  
- Pull requests

Feel free to open an issue or submit a pull request — all help is appreciated.  

