class Team < ApplicationRecord
    include TeamHelper

    def add_developers(params)
        return unless params.is_a? Array

        new_devs = []
        params.each do |entity|
            phone = entity['phone_number']
            name = entity['name']

            if !phone || !name
                # log error or send exception
                return
            end

            dev = Developer.add(name, phone, self.id)
            new_devs << dev
        end
        new_devs
    end

    def send_alert(message)
        dev_phone = find_on_call_developer
        message ||= "Test Message!"
        unless dev_phone
            return false
        end

        send_notification(dev_phone, message)
    end

    private

    def find_on_call_developer
        # picking 1st developer -- logic can be modified
        on_call_dev = Developer.find_by(team_id: self.id)
        unless on_call_dev
            return false
        end
        on_call_dev.phone_number
    end

    class << self
        def create_team(name)
            self.create(name: name)
        end
    end
end
