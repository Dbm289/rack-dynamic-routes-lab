require 'pry'

class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.params["#{ITEM NAME}"]
            #binding.pry
            item =@@items.find{|i| i.name == item_name}
            #resp.write "#{ITEM NAME}"
            if @@items.include?(item)
                resp.write item.price
            else 
                resp.status = 400
                resp.write "Item not found"
            end

        else 
            resp.write "Path not found"
            resp.status = 404
        end

    end

end