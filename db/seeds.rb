# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'one@gmail.com', 	user_name: '一郎', invite_num: 6, 	be_invited_num: 100, 	accept_num: 50,	password: 'foobar', password_confirmation: 'foobar', account_name: 'one',	is_free: 1)
User.create(email: 'two@gmail.com', 	user_name: '次郎', invite_num: 1, 	be_invited_num: 100, 	accept_num: 100,	password: 'foobar', password_confirmation: 'foobar', account_name: 'two',	is_free: 1)
User.create(email: 'three@gmail.com',	user_name: '三郎', invite_num: 99,	be_invited_num: 19_932,	accept_num: 1999,	password: 'foobar', password_confirmation: 'foobar', account_name: 'three',	is_free: 1)
User.create(email: 'four@gmail.com', 	user_name: '士郎', invite_num: 6,	be_invited_num: 100,	accept_num: 50,	password: 'foobar', password_confirmation: 'foobar', account_name: 'four',	is_free: 1)
User.create(email: 'five@gmail.com', 	user_name: '五郎', invite_num: 100, be_invited_num: 100,	accept_num: 80,	password: 'foobar', password_confirmation: 'foobar', account_name: 'five',	is_free: 1)
User.create(email: 'six@gmail.com',	user_name: '六郎', invite_num: 100, be_invited_num: 100,	accept_num: 80,	password: 'foobar', password_confirmation: 'foobar', account_name: 'six',	is_free: 1)
User.create(email: 'seven@gmail.com', 	user_name: '七郎', invite_num: 100, be_invited_num: 100, 	accept_num: 80, 	password: 'foobar', password_confirmation: 'foobar', account_name: 'seven', 	is_free: 1)
User.create(email: 'eight@gmail.com', 	user_name: '八郎', invite_num: 100, be_invited_num: 100, 	accept_num: 80, 	password: 'foobar', password_confirmation: 'foobar', account_name: 'eight', 	is_free: 1)
User.create(email: 'nine@gmail.com',	user_name: '苦郎', invite_num: 100, be_invited_num: 100, 	accept_num: 80, 	password: 'foobar', password_confirmation: 'foobar', account_name: 'nine',	is_free: 1)
User.create(email: 'ten@gmail.com',	user_name: '10浪', invite_num: 100, be_invited_num: 100, 	accept_num: 80, 	password: 'foobar', password_confirmation: 'foobar', account_name: 'ten',	is_free: 1)

Group.create(id: 1, group_name: '位置')
Group.create(id: 2, group_name: '煮')
Group.create(id: 3, group_name: '酸')
Group.create(id: 4, group_name: '史')
Group.create(id: 5, group_name: '碁')

GroupRelation.create(group_id: 1, user_id: 1)
GroupRelation.create(group_id: 1, user_id: 2)
GroupRelation.create(group_id: 1, user_id: 3)
GroupRelation.create(group_id: 1, user_id: 4)
GroupRelation.create(group_id: 1, user_id: 5)
GroupRelation.create(group_id: 2, user_id: 6)
GroupRelation.create(group_id: 2, user_id: 7)
GroupRelation.create(group_id: 2, user_id: 8)
GroupRelation.create(group_id: 2, user_id: 9)
GroupRelation.create(group_id: 2, user_id: 10)
GroupRelation.create(group_id: 3, user_id: 1)
GroupRelation.create(group_id: 3, user_id: 6)
GroupRelation.create(group_id: 4, user_id: 7)
GroupRelation.create(group_id: 4, user_id: 8)

Invitation.create(time_limit: '2018-12-30 00:37:06.938725', user_id: 1, remain_minutes: 30, contents: 'わわわわ')
Invitation.create(time_limit: '2018-12-23 00:37:06.938725', user_id: 6, remain_minutes: 30, contents: 'わわわわ')

InvitationRelation.create(status: 0, sender_id: 1, user_id: 2, invitation_id: 1)
InvitationRelation.create(status: 0, sender_id: 1, user_id: 3, invitation_id: 1)
InvitationRelation.create(status: 0, sender_id: 1, user_id: 4, invitation_id: 1)
InvitationRelation.create(status: 0, sender_id: 6, user_id: 1, invitation_id: 2)
InvitationRelation.create(status: 0, sender_id: 6, user_id: 7, invitation_id: 2)
InvitationRelation.create(status: 0, sender_id: 6, user_id: 8, invitation_id: 2)

GroupInvitation.create(group_id: 1, user_id: 1, receiver_id: 6, status: 0)
GroupInvitation.create(group_id: 1, user_id: 1, receiver_id: 7, status: 0)
GroupInvitation.create(group_id: 2, user_id: 8, receiver_id: 1, status: 0)
GroupInvitation.create(group_id: 4, user_id: 7, receiver_id: 1, status: 0)
