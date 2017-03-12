"""
>>> import pyarrow
>>> pyarrow.from_pylist([1,2,3]) # doctest: +ELLIPSIS
<pyarrow.array.Int64Array object at 0x...>
[
  1,
  2,
  3
]
"""

if __name__ == "__main__":
    import doctest
    doctest.testmod()
