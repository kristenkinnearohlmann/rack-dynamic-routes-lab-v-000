class Application

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      item = @@items.find {|item| item.name == search_item}
      if item
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
    end

  end

end
