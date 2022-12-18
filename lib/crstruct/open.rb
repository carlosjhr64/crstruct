module CRStruct
  class Open
    ### h should support interface ###
    # raise "need Hash(Symbol,Value)" unless
    #   [:to_h, :keys, :has_key?, :[], :[]=].all?{|_|h.respond_to?_} and
    #   h.keys.all?{|_|_.is_a? Symbol}
    def initialize(h={})
      @h = h
    end

    # Can it somehow be converted into a Hash?
    # Most likely.
    def to_h
      @h.to_h
    end

    #########################################
    ### free?, set!, and get? ###
    # make purposeful access to @h possible,
    # and easier to subclass CRStruct.
    #########################################

    def free?(k)
      !(@h.has_key?(k) or respond_to?(k))
    end
    def set!(k, v)
      @h[k]=v
    end
    def get?(k)
      @h[k]
    end

    def method_missing(key, *args, &blk)
      super if blk or (n=args.length)>1 or
               (c=key[-1])=='!' or c=='?' or
               not (c=='=' or n==0)
      if c == '='
        k = key[0..-2].to_sym
        raise NoMethodError, "can't modify key: :#{k}" unless free?(k)
        set!(k, args[0])
      else
        raise NoMethodError, "key not found: :#{key}" unless @h.has_key? key
        get?(key)
      end
    end
  end
end
