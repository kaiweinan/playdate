Playdate

belongs_to :user
has_many :comments
has_many :users through :comments
title
content
location

User

has_many :playdates
has_many :comments
has_many :commented_playdates, through comments
has_many :locations, through playdates
has_many :fieldtrips, through playdates
username
email
password_digest

Location

name
belongs_to :playdate
has_many :playdates
has_many :users, through :playdates

Fieldtrips

name
belongs_to :playdate
has_many :playdates
has_many :users, through :playdates
location
