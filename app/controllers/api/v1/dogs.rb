module API
  module V1
    class Dogs < Grape::API
      include API::V1::Defaults

      resource :dogs do 
        desc "Return all dogs"
        get "", root: :dogs do 
          Dog.all
        end

        desc "Return a single dog"
        params do
          requires :id, type: String, desc: "ID of dog"
        end
        get ":id", root: "dog" do 
          Dog.where(id: permitted_params[:id]).first!
        end

      end

    end

  end

end
