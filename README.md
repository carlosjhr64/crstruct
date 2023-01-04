# CRStruct

* [VERSION 1.0.221218](https://www.github.com/carlosjhr64/crstruct/releases)
* [github](https://www.github.com/carlosjhr64/crstruct)
* [rubygems](https://rubygems.org/gems/crstruct)

## DESCRIPTION

Ruby gem for an extremely lite OpenStruct like class with
attributes that can only be set once, and then read thereafter.

The "CR" in `CRStruct` is for "Create and Read"...
No "Update"...
No "Delete".

## INSTALL:
```console
$ gem install crstruct
```
## SYNOPSIS

The following shows the intended use of CRStruct::Open:
```ruby
require 'crstruct'

s = CRStruct::Open.new
s.a = "A"
s.a #=> "A"

begin
  # Not allowed to reset s.a...
  s.a = "B" # raises error
rescue FrozenError
  s.b = "B"
end
s.a #=> "A"
s.b #=> "B"

begin
  s.c # There is no s.c so raises
rescue NoMethodError
  s.c = "C"
end
s.a #=> "A"
s.b #=> "B"
s.c #=> "C"
```
There's also a subclass CRStruct::Registered:
```ruby
s = CRStruct::Registered.new :a, :b, :c
s.a = "A"
s.b = "B"
s.c = "C"
begin
  s.d = "D"
rescue KeyError
  # Can't set :d as it was not registered with s.
end
s
#~> ^#<CRStruct::Registered:0x\h+ @keys=\[:a, :b, :c\]>$
```
## LICENSE:

(The MIT License)

Copyright (c) 2023 CarlosJHR64

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
