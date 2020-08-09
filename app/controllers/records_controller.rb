class RecordsController < ApplicationController
    def create
        @record = Record.new(record_params)
        @record.user_id = @current_user.id
        @record.save
        redirect_to record_path
    end 

    private
        def record_params
            params.require(:record).permit(:total, :p2p, :p2r, :r2p, :r2r)
        end
end
