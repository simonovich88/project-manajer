class ProjectController < ApplicationController
    skip_before_action :verify_authenticity_token
    http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard


    def new
    end

    def create
        @project=Project.create(project_params)

    end


    def project_params

        {name: params[:nombre], description: params[:description], 
         start_date: params[:fecha_comienzo],
         end_date: params[:fecha_termino],
         state: params[:estado]     
        }

    end

    def dashboard

    if params[:estado].present?
       @projects=Project.where('state = ?',params[:estado])
        
    else
        @projects=Project.all
    end
        


    end

end
