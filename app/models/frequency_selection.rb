class FrequencySelection < ApplicationRecord
    validates :frequency_type, presence: true, uniqueness: true
end
