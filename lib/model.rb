class City

  CITY_DATA = YAML.load_file 'city_data.yml'
  FIRST_RECORD = 174365
  attr_reader :name, :state

  def initialize
    city = CITY_DATA[FIRST_RECORD]
    @name = city['name']
    @state = city['state']
  end


end