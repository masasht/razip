class AddChannelToRecevier < ActiveRecord::Migration[5.0]
  def change
    add_column :receviers, :channel, :integer, after: :frequency
  end
end
