# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all
# Group.destroy_all
# Tool.destroy_all
# TakenTool.destroy_all

g = Group.new(name: 'Grupa Pierwsza')
g.save

User.create(name: 'Imie pierwszego', surname: 'Naziwsko pierwszego', group_id: g.id)
User.create(name: 'Imie drugiego', surname: 'Nazwisko drugiego', group_id: g.id)

t = Tool.new(name: 'Laptop', code: 'L001', count: '21', price: '500')
t.save

TakenTool.create(group_id: g.id, tool_id: t.id)
