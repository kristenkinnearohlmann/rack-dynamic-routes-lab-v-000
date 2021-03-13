class Application

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      item = rew.path.split("/items/").last
      binding.pry
    else
      resp.status = 404
    end

  end

end
