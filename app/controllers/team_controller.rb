class TeamController < ApplicationController

    def map_developer
        team = params[:team]
        if team && team['name']
            dev_team = Team.find_by(name: team['name'].to_s)
            if !dev_team
                dev_team = Team.create_team(team['name'].to_s)
            end

            new_devs = dev_team.add_developers(params[:developers])
            return render json: { success: true, data: new_devs, message: "fetched successfully"}
        else
            return render json: {success: false, data: [], message: "Invalid params"}
        end
    end
end
