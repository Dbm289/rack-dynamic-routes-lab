class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path=="/items/&lt;ITEM NAME>"
            search_term = req.params["#{ITEM NAME}"]
            #resp.write "#{ITEM NAME}"
            if @@items.include?(search_term)
                resp.write "#{@price}"
            else 
                resp.write "We don't have that item"
                resp.status = 400
            end

        else 
            resp.write "Path not found"
            resp.status = 404
        end

    end

end