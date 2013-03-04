# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! email: "godoy.ccp@gmail.com", password: "godoy123"
Admin.create! email: "natalia.avila@planb.com.br", password: "godoy123"

#User.Create!([{ email: "tiago.braga@planb.com.br", name: "Tiago Braga" }])
#User.Create!({ email: "rodrigo.dias@planb.com.br", name: "Rodrigo Dias" })