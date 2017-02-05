# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Rootstock.create(name: '101-14', comment: 'Comment on rootstock characteristics')
Rootstock.create(name: 'Richter 110', comment: 'Comment on rootstock characteristics')

Clone.create(name: 'SA125', comment: 'Comment on clone characteristics')
Clone.create(name: 'LC10', comment: 'Comment on clone characteristics')

Vine.create(name: 'Cabernet Sauvignon', colour: 'red', comment: 'Further comments on characteristics, and suitable climates and soils')
Vine.create(name: 'Shiraz', colour: 'red', comment: 'Also known as syrah. Further comments on characteristics, and suitable climates and soils')
Vine.create(name: 'Sauvignon Blanc', colour: 'white', comment: 'Further comments on characteristics, and suitable climates and soils')

Vine.first.clones << Clone.first
Vine.first.clones << Clone.second