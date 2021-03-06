class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :categories

  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable



end
