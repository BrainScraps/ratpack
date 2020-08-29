require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #database
    # set :database, "sqlite3:///database.db"

    #filters

    #routes
    get '/' do
      @current_covid_deaths = current_covid_deaths
      @city = City.new(@current_covid_deaths)
      @matrix = comparison_matrix(current_covid_deaths_per_m)
      @city_css_class = [@city.name, ' ', @city.state].join.gsub(' ', '-').downcase
      erb :index
    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end

      def separate_comma(number)
        number.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
      end

      def current_covid_deaths
        186024
      end

      def current_covid_deaths_per_m
        561
      end

      def us_pop
        331.309290
      end

      def comparison_matrix(per_m)
        {
          vietnam:  comp_arr(0.3),
          nigeria: comp_arr(5),
          new_zealand: comp_arr(4),
          india: comp_arr(45)
        }
      end

      def comp_arr(rate)
        potential = (rate*us_pop).to_i
        delta_deaths = current_covid_deaths.to_i - potential
        [potential,delta_deaths,rate]
      end
    end

  end
end
