module Api
 module Translation
  require 'net/http'

  class MessageTranslator
    attr_accessor :dialect_id, :message

    def initialize(dialect_id, message)
      @dialect_id = dialect_id
      @message = message
    end

    def translate_message
      @dialect = Dialect.find(@dialect_id)
      translated_message = send("#{@dialect.dialect.downcase.gsub(' ','_')}_translator_api")
    end

    def pirate_translator_api
     begin
      request_url = "#{@dialect.translation_url}?text=#{@message}&format=json"
      res = make_get_request(request_url)
      json_out = JSON.parse(res.body)
      message = json_out['translation']['pirate']
     rescue => e
      puts "Error while connecting api: #{e.message}"
      return options[:message]
    end
    end

    def yoda_translator_api
      begin
        request_url = "#{@dialect.translation_url}?d=#{@dialect.dialect.split(' ').first.downcase}&url=&w=#{@message}"
        res = make_get_request(request_url)
        page = Nokogiri::HTML(res.body)
        message =  page.css('p')[0].text
      rescue => e
        puts "Error while connecting api: #{e.message}"
        return options[:message]
      end

    end
    alias_method :valley_girl_translator_api, :yoda_translator_api

    def make_get_request(request_url)
      encoded_url = URI.encode(request_url)
      url = URI.parse(encoded_url)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
    end

 end
end
end

