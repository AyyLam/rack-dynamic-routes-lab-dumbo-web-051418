class Application 
  
  def call(env) 
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/) 
      item_req = req.path.split("/items/").last 
      if @@items.find(|i| i.title == item_req) 
        resp.write item_req.price 
      else 
        return "400"
