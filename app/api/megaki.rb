module Megaki
  class API < Grape::API


    version 'v1', using: :header, vendor: 'megaki'
    format :json

    resource :auth do

      desc "return moment."
      get :moment do

        {"name" => "megaki"}
      end

    end

  end