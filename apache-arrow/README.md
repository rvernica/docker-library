Apache Arrow
============

* Dockerfile to build [Apache Arrow](https://arrow.apache.org/)
* Build on top of [Debian Linux](https://www.debian.org/)
* Builds in release mode:
  * `arrow`
  * `parquet-cpp`
  * `pyarrow` with `parquet` and `jemalloc`


Usage
=====

The image comes with an example to verify that `pyarrow` is working:

```bash
> docker run --tty --interactive rvernica/apache-arrow python example.py -v
Trying:
    import pyarrow
Expecting nothing
ok
Trying:
    pyarrow.from_pylist([1,2,3]) # doctest: +ELLIPSIS
Expecting:
    <pyarrow.array.Int64Array object at 0x...>
    [
      1,
      2,
      3
    ]
ok
1 items passed all tests:
   2 tests in __main__
2 tests in 1 items.
2 passed and 0 failed.
Test passed.
```
