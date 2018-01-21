class DriveSelection < ApplicationRecord
      validates :drive_system, presence: true, length: { maximum: 50 }, uniqueness: true
end
