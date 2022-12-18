module CRStruct
  VERSION = '1.0.221218'
  class Open
    def method_missing(key, *args, &blk)
      super unless blk.nil? and key[-1]=='=' and args.length==1
      k,v = key[0..-2].to_sym,args[0]
      raise FrozenError, "can't modify CRStruct method: :#{k}" if respond_to? k
      define_singleton_method(k){v}
    end
  end

  class Registered < Open
    def initialize(*keys)
      @keys = keys
    end

    def define_singleton_method(k,&blk)
      raise KeyError, "can't add unregistered key: :#{k}" unless @keys.include? k
      super(k,&blk)
    end
  end
end

# Requires:
#`ruby`
