class Map

  def initialize
    @map = []
  end

  def set(key, value)
    index = search_key(key)
    if index
      index = search_key(key)
      @map[index][1] = value
    else
      @map << [key, value]
      @map
    end
  end

  def search_key(key)

    @map.each_with_index do |arr, idx|
      if arr[0] == key
        return idx
      end
    end

    nil
  end

  def delete(key)
    index = search_key(key)
    if index
      @map = @map.take(index) + @map.drop(index+1)
    end
  end

  def show
    @map.sort
  end

end
