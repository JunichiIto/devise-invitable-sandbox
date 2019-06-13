class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, validate_on_invite: true

  attr_accessor :force_rollback

  validates :name, presence: true

  after_save :do_something

  private

  def do_something
    raise ActiveRecord::Rollback if force_rollback
  end
end
