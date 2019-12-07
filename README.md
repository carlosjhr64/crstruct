# crstruct

* [github](https://www.github.com/carlosjhr64/crstruct)
* [rubygems](https://rubygems.org/gems/crstruct)

## DESCRIPTION

Ruby gem for an extremely lite OpenStruct like class with
attributes that can only be set once, and then read thereafter.

The "CR" in `CRStruct` is for "Create and Read"...
no "Update"...
no "Delete".

## INSTALL:

    gem install crstruct

## SYNOPSIS

The following shows the intended use of CRStruct::Open:

    require 'crstruct'
    
    s = CRStruct::Open.new
    s.a = "A" #=> "A"
    
    begin
      # Not allowed to reset s.a...
      s.a = "B"
      # as there's no actual s.a=...
    rescue NoMethodError
      s.b = "B" #=> "B"
    end
    
    if s.b == "B" #=> true
      begin
        # There is no s.c...
        puts "s.c is #{s.c}"
      rescue NoMethodError
        s.c = "C" #=> "C"
        # Output:
        #   s.a is A
        #   s.b is B
        #   s.c is C
        puts "s.a is #{s.a}"
        puts "s.b is #{s.b}"
        puts "s.c is #{s.c}"
      end
    end

There's also a subclass CRStruct::Registered:

    require 'crstruct'
    
    s = CRStruct::Registered.new :a, :b, :c
    s.a = "A" #=> "A"
    s.b = "B" #=> "B"
    s.c = "C" #=> "C"
    begin
      s.d = "D"
    rescue NoMethodError
      # Can't set :d as it was not registered with s.
    end
    # Output:
    #  #<CRStruct::Registered:0x0000561d37006b08
    #   @h={:a=>"A", :b=>"B", :c=>"C"},
    #   @r=[:a, :b, :c]>
    pp s
  

## MORE

The following can be done, but
you'd be circumventing the intended use:

    require 'crstruct'
    
    s = CRStruct::Open.new a: "A", b: "B"
    s.set!(:c, "C") #=> "C"
    
    # s' internal hash does not have :d
    if s.get?(:d).nil?
      # Output:
      #   s.a is A
      #   s.b is B
      #   s.c is C
      #   s.d is nil
      puts "s.a is #{s.get?(:a)}"
      puts "s.b is #{s.get?(:b)}"
      puts "s.c is #{s.get?(:c)}"
      puts "s.d is #{s.get?(:d)}"
      # Output:
      #   {:a=>"A", :b=>"B", :c=>"C"}
      pp s.to_h
    end
    
    # The :free? method determines if a Symbol is avaible for setting.
    s.free?(:to_s) #=> false
    s.free?(:d) #=> true

## LICENSE:

(The MIT License)

Copyright (c) 2019 CarlosJHR64

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
