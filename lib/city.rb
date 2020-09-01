class City

  CITY_DATA = YAML.load_file 'city_data.yml'
  FIRST_RECORD = 174365
  attr_reader :name, :state, :population

  def initialize(current_covid_deaths)
    # city = CITY_DATA[FIRST_RECORD]
    city_key = CITY_DATA.keys.select{|x| x < current_covid_deaths }.sample
    city = CITY_DATA[city_key]
    @population = city_key
    @name = city['name']
    @state = city['state']
  end

end