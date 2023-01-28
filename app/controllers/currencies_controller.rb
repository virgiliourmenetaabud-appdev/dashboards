class CurrenciesController < ApplicationController
  
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read

    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")

    @symbols_keys = @symbols_hash.keys

    render({ :template => "currency_templates/first_currency.html.erb"})
  end

  def select_destination

    @raw_data = open("https://api.exchangerate.host/symbols").read

    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")

    @symbols_keys = @symbols_hash.keys

    @origin_curr = params.fetch(:origin)

    render({ :template => "currency_templates/convert_origin.html.erb"})
  end

  def convert
    @raw_data = open("https://api.exchangerate.host/symbols").read

    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")

    @symbols_keys = @symbols_hash.keys

    @origin_curr = params.fetch(:origin)

    @destination_curr = params.fetch(:destination)

    @new_url = "https://api.exchangerate.host/convert?from=" + @origin_curr.to_s + "&to=" + @destination_curr.to_s

    @raw_conversion_data = open(@new_url).read

    @parsed_conversion_data = JSON(@raw_conversion_data)

    @conversion_data = @parsed_conversion_data.fetch("info")

    @rate = @conversion_data.fetch("rate")

    render({ :template => "currency_templates/conversion_result.html.erb"})

  end

end
