class Application

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      item = @@items.find {|item| item.name == search_item}
      binding.pry
      if item
        resp.write item.price
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.status = 404
    end

    resp.finish

  end

end
