class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:  :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent:  :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create, :update] }
  validates_uniqueness_of :handle, :email, case_sensitive: false, message:
  'THAT USERNAME AND/OR EMAIL HAS ALREADY BEEN TAKEN'
  validates :handle, :name, :email, presence: { message: 'FIELD CANNOT BE EMPTY' }
  validates :handle, :name, length: { in: 1...22, message:
  'MAX OF 22 CHARACTERS' }
  validates :handle, format: {
    with: /\A[a-zA-Z0-9]+\Z/,
    message: 'ONLY LETTERS/NUMBERS ALLOWED IN USERNAME'
  }

  before_create { handle.downcase! }
  before_create { email.downcase! }
end
