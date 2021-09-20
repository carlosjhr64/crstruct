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

    def method_missing(key, *args, &proc)
      if proc.nil?
        case args.length
        when 0
          return get?(key) if @h.has_key? key
        when 1
          if key=~/^\w+=$/
            k = key[0..-2].to_sym
            return set!(k, args[0]) if free?(k)
          end
        end
      end
      super
    end
  end
end
