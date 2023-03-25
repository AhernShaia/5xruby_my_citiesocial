class CategoriesController < ApplicationController
before_action :find_category, only: [:show]
    def show
        
    end

    def find_category
        @categories = Category.find(params[:id])
    end
end
