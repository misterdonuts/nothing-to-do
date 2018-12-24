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

Group.create(id: 1, group_name: 'pon de lion')
Group.create(id: 2, group_name: 'french cruller')
Group.create(id: 3, group_name: 'old fashion')

GroupRelation.create(user_id: 1, group_id: 1)
GroupRelation.create(user_id: 1, group_id: 2)
GroupRelation.create(user_id: 2, group_id: 2)
GroupRelation.create(user_id: 3, group_id: 2)
GroupRelation.create(user_id: 4, group_id: 2)
GroupRelation.create(user_id: 5, group_id: 3)

Invitation.create(time_limit: "2018-12-23 00:37:06.938725", user_id: 2, invitation_group_id: 1)
Invitation.create(time_limit: "2018-12-23 00:37:06.938725", user_id: 2, invitation_group_id: 1)
Invitation.create(time_limit: "2018-12-23 00:08:09.479402", user_id: 1, invitation_group_id: 2)
Invitation.create(time_limit: "2018-12-23 00:08:09.479402", user_id: 1, invitation_group_id: 2)
Invitation.create(time_limit: "2018-12-23 00:08:09.472162", user_id: 2, invitation_group_id: 3)

InvitationRelation.create(status: 0, receiver_id: 1, sender_id:2, invitation_group_id: 1)
InvitationRelation.create(status: 0, receiver_id: 3, sender_id:2, invitation_group_id: 1)
InvitationRelation.create(status: 0, receiver_id: 4, sender_id:2, invitation_group_id: 1)
InvitationRelation.create(status: 0, receiver_id: 2, sender_id:1, invitation_group_id: 2)
InvitationRelation.create(status: 0, receiver_id: 3, sender_id:2, invitation_group_id: 2)
InvitationRelation.create(status: 0, receiver_id: 1, sender_id:3, invitation_group_id: 1)
InvitationRelation.create(status: 0, receiver_id: 4, sender_id:3, invitation_group_id: 1)
InvitationRelation.create(status: 0, receiver_id: 5, sender_id:3, invitation_group_id: 1)
