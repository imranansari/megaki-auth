module Megaki
  class API < Grape::API


    version 'v1', using: :header, vendor: 'megaki'
    format :json

    #resque = MegakiServices::Application::RESQUE


    resource :megaki do

      desc "test."
      get :test do
        {"name" => "test"}
      end

    end

end