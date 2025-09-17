class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  devise authentication_keys: [:email]

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def self.search_for(content, method)
    if method == 'perfect'
      Admin.where(name: content)
    elsif method == 'forward'
      Admin.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Admin.where('name LIKE ?', '%'+content)
    else
      Admin.where('name LIKE ?', '%'+content+'%')
    end
  end
  
end
