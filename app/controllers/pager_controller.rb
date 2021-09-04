class PagerController < ApplicationController

    def receive_alert
        team_id = params[:team_id].to_i
        message = params[:message]
        if team_id
            team = Team.find_by_id(team_id)
            unless team
                return render json: { success: false, message: "Invalid team id" }
            end

            success = team.send_alert(message)
            return render json: {success: success, message: get_message(success)}
        else
            return render json: { success: false, message: "Invalid params" }
        end
    end

    private

    def get_message(success)
        case success
        when true
            "Alert successfully sent"
        else
            "Could not send alert to team"
        end
    end


end
