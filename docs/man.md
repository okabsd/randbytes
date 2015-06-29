# Documentation

There's not much, I promise.

## Requiring

```lua
randbytes = require 'randbytes'
```

Requiring the module will return the interface, so assign it to a variable.

## Defaults

In all appropriate methods:
- `bytes` defaults to `4`
- `mask` defaults to `256`
- `file` defaults to `'urandom'`, used internally by the metacall
- `filetable` defaults to `{'urandom', 'random'}`, used internally by `:open ()` & `:close ()`

Defaults can be modified with `:setdefault ()`.

## Methods

- `:open (...files)` - Opens, or reopens, files. The module initially calls this internally, opening files from the default _filetable_. Returns the interface.

- `:close (...files)` - Closes files. Returns the interface.

> Both `:open ()` & `:close ()` take a variable number of string parameters, indicating which files to use. Passing no parameters will populate these strings from the default _filetable_

```lua
randbytes:open ('urandom', 'random')
randbytes:close ('random')
```

- `:uread (bytes)` - Reads _n_ bytes from `/dev/urandom`.

- `:read (bytes)` - Same as above, reading from `/dev/random` instead.

```lua
randbytes:uread (16)
randbytes:read (16)
```

- `:urandom (bytes, mask)` - Reads _n_ _bytes_ from `/dev/urandom`, and returns a random number where _mask_ is the factor.

- `:random (bytes, mask)` - Same as above, reading from `/dev/random` instead.

```lua
randbytes:urandom (8, 128)
randbytes:random (8, 128)
```

- `:setdefault (key, value)` - Sets a default value. Returns the indexed value from the defaults table, which will indicate if it was set properly. _key_ and _value_ pairs are as follows:
  - `'bytes'`, _numeric_
  - `'mask'`, _numeric_
  - `'file'`, `'urandom'` or `'random'`
  - `'filetable'`, _table_ containing file strings `'urandom'`, `'random'`, or both

```lua
randbytes:setdefault ('bytes', 8)
```

## Metacall

The interface can be invoked directly.

- `randbytes (bytes)` - Reads _n_ bytes from the default file.

```lua
randbytes (64)
```

## Notes

When files are closed, calls to `:read` and `:random` type methods will return `nil`.
