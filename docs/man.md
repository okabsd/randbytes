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
- `file` defaults to `'urandom'`, used internally

Defaults can be modified with `:setdefault ()`.

## Methods

- `:open ()` - Opens, or reopens, the `/dev/urandom` & `/dev/random` file references. The module initially calls this internally. Returns the interface.

- `:close ()` - Closes the `/dev/urandom` & `/dev/urandom` file references, if they are open. Returns the interface.

- `:uread (bytes)` - Reads _n_ bytes from `/dev/urandom`.

- `:read (bytes)` - Same as above, reading from `/dev/random` instead.

- `:urandom (bytes, mask)` - Reads _n_ _bytes_ from `/dev/urandom`, and returns a random number where _mask_ is the factor.

- `:random (bytes, mask)` - Same as above, reading from `/dev/random` instead.

- `:setdefault (key, value)` - Sets a default value. Returns the indexed value from the defaults table, which will indicate if it was set properly. _key_ and _value_ pairs are as follows:
  - `'bytes'`, _numeric_
  - `'mask'`, _numeric_
  - `'file'`, `'urandom'` or `'random'`

## Metacall

The interface can be invoked directly.

- `randbytes (bytes)` - Reads _n_ bytes from the default file.

## Notes

When files are closed, calls to `:read` and `:random` type methods will return `nil`.
