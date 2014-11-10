require 'uri'
require 'net/http'
require 'nokogiri'

module Quinigem
  class Scrapper
    URL = "http://www.loteria-nacional.gov.ar/Internet/Extractos/resultados.php?juego=quiniela"

    def initialize game="quiniela", game_type, date
      throw ArgumentError "no game_type" unless game_type
      throw ArgumentError "no date" unless date
      @game = game
      @game_type = game_type
      @date = date
    end

    def winners
      @winners ||= execute
    end

    private

    def get_response
      uri     = URI.parse(URL)
      http    = Net::HTTP.new(uri.host, uri.port)
      headers = {"User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36"}
      post_data = { "tiposorteo" => @game_type,
                    "tipo_juego" => @quiniela,
                    "fechasorteo" => @date,
                    "enviar" => "Buscar Extracto" }

      request = Net::HTTP::Post.new(uri.request_uri, init_header = headers)
      request.set_form_data(post_data)
      http.request(request)
    end

    def execute
      response = get_response
      return [] unless response.code == "200"

      doc = Nokogiri::HTML response.body
      one_to_ten_results    = doc.css( "#Columna1Quiniela > div strong").map {|v| v.text}
      ten_to_twenty_results = doc.css( "#Columna2Quiniela > div strong").map {|v| v.text}
      @winners = one_to_ten_results + ten_to_twenty_results
    end
  end
end
