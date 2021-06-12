require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/)
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    elsif req.path.match(/categories/) 
     
         if req.env["REQUEST_METHOD"] == "POST"
          input=JSON.parse(req.body.read)
          
          if req.path.split("/categories").length ==0
          
          category=Category.create(name: input["name"])
          return [200, {'Content-Type' => 'application/json'},[ category.to_json]]
        else
          
          category_id=req.path.split("/categories/").last
          cat = Category.find_by(id: category_id)
          avatar = cat.avatars.create({name:input["name"]})
          return [200, {'Content-Type' => 'application/json'},[ avatar.to_json]]
        end
        elsif
          req.env["REQUEST_METHOD"] == "DELETE"
          category_id=req.path.split("/categories/").last
          category=Category.find_by(id:category_id)
          category.destroy
          return [200, {'Content-Type' => 'application/json'},[ {message:"Successfully Deleted Category"}.to_json]]
        else
          if req.path.split("/categories").length ==0
            return [200, {'Content-Type' => 'application/json'},[ Category.all.to_json]]
          else
            category_id=req.path.split("/categories/").last
             return [200, {'Content-Type' => 'application/json'},[Category.find_by(id: category_id).to_json({:include => :avatars})]]
      end
    end
  
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end
end
