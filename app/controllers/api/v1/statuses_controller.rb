class Api::V1::StatusesController < Api::V1::ApiController
 before_action :set_status, only: [:show, :update, :destroy]
 before_action :require_authorization!, only: [:show, :update, :destroy]
 # GET /api/v1/status

 def index
   @status = Status.all
   render json: @status
 end

 # GET /api/v1/status/1
 def show
   render json: @status
 end

 # POST /api/v1/status
 def create
   @status = Status.new(status_params)
   if @status.save
     render json: @status, status: :created
   else
     render json: @status.errors, status: :unprocessable_entity
   end
 end

 # PATCH/PUT /api/v1/status/1
 def update
   if @status.update(status_params)
     render json: @status
   else
     render json: @status.errors, status: :unprocessable_entity
   end
 end

 # DELETE /api/v1/status/1
 def destroy
   @status.destroy
 end

 private
   # Use callbacks to share common setup or constraints between actions.
   def set_status
     @status = Status.find(params[:id])
   end

   # Only allow a trusted parameter "white list" through.
   def status_params
     params.require(:status).permit(:name)
   end

   def require_authorization!
     unless current_user == @status.user
       render json: {}, status: :forbidden
     end
   end

end
