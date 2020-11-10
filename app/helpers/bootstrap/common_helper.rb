module Bootstrap::CommonHelper
  ArgumentError = Class.new(::ArgumentError)

  # Returns a new Hash with:
  # * keys converted to Symbols
  # * the +:class+ key has its value converted to an Array of String
  # @example
  # canonicalize_options("id" => "ID", "class" => "CLASS") # => {:id=>"ID", :class=>["CLASS"]}
  # canonicalize_options(:class => 'one two') # => {:class=>["one", "two"]}
  # canonicalize_options("class" => [:one, 2]) # => {:class=>["one", "2"]}
  # @param [Hash] hash typically an +options+ param to a method call
  # @raise [ArgumentError] if _hash_ is not a Hash
  # @return [Hash]
  def canonicalize_options(hash)
    raise ArgumentError, "expected a Hash, got #{hash.inspect}" unless hash.is_a?(Hash)

    hash.symbolize_keys.tap do |h|
      h[:class] = arrayify_and_stringify_elements(h[:class])
    end
  end

  # Returns a new Array of String from _arg_.
  # @example
  # arrayify_and_stringify_elements(nil) #=> []
  # arrayify_and_stringify_elements('foo') #=> ["foo"]
  # arrayify_and_stringify_elements('foo bar') #=> ["foo", "bar"]
  # arrayify_and_stringify_elements([:foo, 'bar']) #=> ["foo", "bar"]
  # @param [String, Array] arg
  # @return [Array of String]
  def arrayify_and_stringify_elements(arg)
    return false if arg == false

    if arg.blank? then []
    elsif arg.is_a?(Array) then arg
    else arg.to_s.strip.split(/\s/)
    end.map(&:to_s)
  end

  # Returns down-caret character used in various dropdown menus.
  # @param [Hash] options html options for
  # @example
  # caret(id: 'my-id') #=>
  # @return [String]
  def caret(options = {})
    options = canonicalize_options(options)
    options = ensure_class(options, 'caret')
    content_tag(:span, nil, options)
  end

  # Returns new (canonicalized) Hash where :class value includes _klasses_.
  #
  # @example
  # ensure_class({class: []}, 'foo') #=> {class: 'foo'}
  # ensure_class({class: ['bar'], id: 'my-id'}, ['foo', 'foo2']) #=> {:class=>["bar", "foo", "foo2"], :id=>"my-id"}
  # @param [Hash] hash
  # @param [String, Array] klasses one or more classes to add to the +:class+ key of _hash_
  # @return [Hash]
  def ensure_class(hash, klasses)
    canonicalize_options(hash)

    hash.dup.tap do |h|
      Array(klasses).map(&:to_s).each do |k|
        h[:class] << k unless h[:class].include?(k)
      end
    end
  end

  # Returns extra arguments that are Bootstrap modifiers. Basically 2nd argument
  # up to (not including) the last (Hash) argument.
  #
  # @example
  # extract_extras('text') #=> []
  # extract_extras('text', :small, :info, id: 'foo') #=> [:small, :info]
  # @return [Array]
  def extract_extras(*args)
    args.extract_options!
    args.shift
    args
  end

  def bootstrap_generator(*args, bs_class, element, &block)
    options = canonicalize_options(args.extract_options!)
    options = ensure_class(options, bs_class)

    content = block_given? ? capture(&block) : args.shift

    content_tag(element.to_sym, options) do
      content
    end
  end
end
