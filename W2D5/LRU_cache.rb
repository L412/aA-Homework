class LRUCache

    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      @cache.count
    end

    #this will be an inefficient method
    #.include? is O(n) because we have to go through the entire array
    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
        @cache.push(el)
      elsif @cache.count >= @size
        @cache.shift
        @cache.push(el)
      else
        @cache.push(el)
      end
    end

    def show
    p @cache
    end

  end
