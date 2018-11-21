# frozen_string_literal: true

class User < ApplicationRecord
  has_many :ideas
  has_many :assigned_ideas, foreign_key: 'assigned_user_id', class_name: 'Idea'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, email: true
end
