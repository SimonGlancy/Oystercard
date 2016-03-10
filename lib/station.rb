class Station
  LIST = {
          holborn: 1,
          algate: 1,
          arsenal: 2,
          kilburn: 2,
          turnpike_lane: 3,
          wimbledon: 3,
          richmond: 4,
          kew_garden: 4,
          hounslow_west: 5,
          heathrow_Terminals: 6
          }

  attr_reader :zone, :name

  def initialize (name)
    @name = name.downcase.gsub(' ', '_').to_sym
    @zone = LIST[@name]
  end

end
