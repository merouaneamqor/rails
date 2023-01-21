class HomeController < ApplicationController
    def index
        render 'index', formats: [:html], handlers: [:haml]
    end
end
