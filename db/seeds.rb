# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

#CSV.foreach('db/kits-kyosho-off-20180113.csv') do |row|
#  Kit.create!(name: row[0], image: row[1], maker_id: row[2].to_i, maker_url: row[3], list_price: row[4], category: row[5], drive_system: row[6])

#CSV.foreach('db/kyosho-motor-20180112.csv') do |row|
#  Motor.create!(name: row[0], image: row[1], maker_id: row[2].to_i, maker_url: row[3], list_price: row[4], type: row[5], sencor: row[6],
#              turn: row[7], kv: row[8], rpm: row[9], torque: row[10], voltage: row[11], ampere: row[12], information: row[13])
#end


#CSV.foreach('db/battery_selections.csv') do |row|
#  BatterySelection.create!(battery_type: row[0])
#end

#CSV.foreach('db/brush_selections.csv') do |row|
#  BrushSelection.create!(motor_type: row[0])
#end

#CSV.foreach('db/category_selections.csv') do |row|
#  CategorySelection.create!(category: row[0])
#end

#CSV.foreach('db/drive_selections.csv') do |row|
#  DriveSelection.create!(drive_system: row[0])
#end

#CSV.foreach('db/frequency_selections.csv') do |row|
#  FrequencySelection.create!(frequency_type: row[0])
#end

#CSV.foreach('db/profile_selections.csv') do |row|
#  ProfileSelection.create!(profile_type: row[0])
#end

CSV.foreach('db/sencor_selections.csv') do |row|
  SencorSelection.create!(sensor: row[0])
end

CSV.foreach('db/servo_selections.csv') do |row|
  ServoSelection.create!(servo_type: row[0])
end