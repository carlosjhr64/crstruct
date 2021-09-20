module CRStruct
  class Registered < Open
    # Registered.new :a, :b, :c, :d
    # Registered.new {a: 1, b: 2}, :c, :d
    # Registered.new {a: 1, b: 2}, [:c, :d]
    # (*keys).flatten! should result to an Array(Symbol)
    def initialize(h, *keys)
      keys.flatten!
      if h.is_a? Symbol
        keys.unshift(h)
        h = {}
      end
      @r = keys
      super(h)
    end

    def free?(k)
      return false unless @r.include? k
      super(k)
    end
  end
end
