class Developer < ApplicationRecord
  belongs_to :team

  class << self
    def add(name, phone_number, team_id)
      developer = self.create(name: name, phone_number: phone_number, team_id: team_id)
      return developer
    end
  end

end
