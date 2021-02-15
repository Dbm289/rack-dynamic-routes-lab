require 'pry'

class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            #binding.pry
            item_name = req.path.split("/items/")[1]
            #binding.pry
            item = @@items.find{|i| i.name == item_name}
            #resp.write "#{ITEM NAME}"
            if item != nil
                resp.write item.price
            else 
                resp.status = 400
                resp.write "Item not found"
            end

        else 
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish

    end

end