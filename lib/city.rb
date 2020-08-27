class City

  CITY_DATA = YAML.load_file 'city_data.yml'
  FIRST_RECORD = 174365
  attr_reader :name, :state, :population

  def initialize(current_covid_deaths)
    city = CITY_DATA[FIRST_RECORD]
    @population = FIRST_RECORD
    @name = city['name']
    @state = city['state']
  end


end