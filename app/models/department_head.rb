class Department_head < ApplicationRecord
    belongs_to :department
    has_one :doctor
end
