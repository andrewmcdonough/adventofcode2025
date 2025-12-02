class PasswordDecoder
  attr_reader :rotations
  private :rotations

  def initialize(rotations)
    @rotations = rotations
  end

  def call
    position = 50
    zeros = 0
    rotations.each do |rotation|
      parts = rotation.match(/(.)(.*)/)
      direction = parts[1]
      movement = parts[2]
      if direction == "L"
        position = (position + movement.to_i) % 100
      else
        position = (position - movement.to_i) % 100
      end
      if position == 0
        zeros +=1
      end
    end
    zeros
  end
end
