"""
>>> import pyarrow
>>> import pyarrow.feather
>>> import pandas
>>> import numpy

>>> pyarrow.from_pylist([1,2,3]) # doctest: +ELLIPSIS
<pyarrow.array.Int64Array object at 0x...>
[
  1,
  2,
  3
]

>>> fn = 'example.feather'
>>> df = pandas.DataFrame({'ints': numpy.random.randint(0, 10, 5)})
>>> pyarrow.feather.write_feather(df, fn)
>>> pyarrow.feather.read_feather(fn) == df
   ints
0  True
1  True
2  True
3  True
4  True
"""

if __name__ == "__main__":
    import doctest
    doctest.testmod()
