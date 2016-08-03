Size = Struct.new(:width, :height) do
  def to_s
    "#{width}x#{height}"
  end

  def *(factor)
    Size.new(width*factor, height*factor)
  end

  def /(factor)
    Size.new(width/factor, height/factor)
  end
end

