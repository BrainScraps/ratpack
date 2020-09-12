class City

  CITY_DATA = YAML.load_file 'city_data.yml'
  BARCLAYS_CAPACITY = 17732
  FIRST_RECORD = 174365
  attr_reader :name, :state, :population, :extra_barclays

  def initialize(current_covid_deaths)
    # city = CITY_DATA[FIRST_RECORD]
    city_key = CITY_DATA.keys.select{|x| x < current_covid_deaths }.sample
    city = CITY_DATA[city_key]
    @population = city_key
    @name = city['name']
    @state = city['state']
    @extra_barclays = init_extra_barclays(current_covid_deaths)
  end

  def init_extra_barclays(deaths)
    diff = deaths - @population
    if diff > BARCLAYS_CAPACITY
      diff / BARCLAYS_CAPACITY
    else
      0
    end
  end

end