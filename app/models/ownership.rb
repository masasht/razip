class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :kit, optional: true
  belongs_to :motor, optional: true
  belongs_to :esc, optional: true
  belongs_to :servo, optional: true
  belongs_to :recevier, optional: true
end
