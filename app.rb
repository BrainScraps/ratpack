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
      @current_covid_deaths = 183700
      @city = City.new(@current_covid_deaths)
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
    end

  end
end
