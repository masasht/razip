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

FrequencySelection.create(frequency_type: 'FASST（フタバ）')
FrequencySelection.create(frequency_type: 'T-FHSS（フタバ）')
FrequencySelection.create(frequency_type: 'S-FHSS（フタバ）')
FrequencySelection.create(frequency_type: 'FHSS（フタバ）')
FrequencySelection.create(frequency_type: 'FH4（サンワ）')
FrequencySelection.create(frequency_type: 'FH3（サンワ）')
FrequencySelection.create(frequency_type: 'DSSS（サンワ）')
FrequencySelection.create(frequency_type: 'Dual FHSS（KO）')
FrequencySelection.create(frequency_type: 'Single FHSS（KO）')
FrequencySelection.create(frequency_type: 'Gyro FHSS（KO）')
FrequencySelection.create(frequency_type: 'DSSS（KO）')
FrequencySelection.create(frequency_type: 'LYNX 4S/LYNX 4S PLUS専用（HiTEC）')
