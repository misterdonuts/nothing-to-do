# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'aaa@gmail.com', user_name: 'sawa', icon_path: '7sadfs7s.png', invite_num: 6, be_invited_num: 100, accept_num:50, password:'foobar', password_confirmation: 'foobar')
User.create(email: 'iiaddadadad@gmail.com', user_name: 'iida', icon_path: '9sdfsafs.png', invite_num: 0, be_invited_num: 100, accept_num:100, password:'foobar', password_confirmation: 'foobar')
User.create(email: 'hogehoge@gmail.com', user_name: 'hoge', icon_path: '78sdfds.png', invite_num: 99, be_invited_num: 19932, accept_num:1999, password:'foobar', password_confirmation: 'foobar')
User.create(email: 'fugafuga@gmail.com', user_name: 'fuga', icon_path: 'sa8dfsd.png', invite_num: 6, be_invited_num: 10, accept_num:50, password:'foobar', password_confirmation: 'foobar')
User.create(email: 'piyopiyo@gmail.com', user_name: 'piyo', icon_path: 'sdfsd8f98f.png', invite_num: 100, be_invited_num: 10, accept_num:80, password:'foobar', password_confirmation: 'foobar')

Group.create(group_id: 1, group_name: 'pon de lion', user_id: 3)
Group.create(group_id: 1, group_name: 'pon de lion', user_id: 4)
Group.create(group_id: 1, group_name: 'pon de lion', user_id: 5)