class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
# パスワードを半角英数字にバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  #VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  #validates :password, format: { with: VALID_PASSWORD_REGEX }

  #  ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須でバリデーション
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
    validates :name1
    validates :name2
  end

# 全角カタカナ
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :name_kana1
    validates :name_kana2
  end

end
