class Amee
  require "yajl"

  def self.run
    url       = 'https://stage.amee.com'
    username  = 'smaameri'
    password  = 'ygz6aqng'
    
    connection = Faraday.new(:url => url)

    response = connection.get "/profiles" do |req|
      req.headers['Accept']         = 'application/json'
      req.headers['Authorization']  = 'Basic ' + ["#{username}:#{password}"].pack('m').delete("\r\n")
    end

    Yajl::Parser.parse response.body
  end

end