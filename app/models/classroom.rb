class Classroom < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  before_save(:on => :create) do
        self.entry_at = Time.now.utc
    end
end
