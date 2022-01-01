require "rails_helper"

RSpec.describe User, type: :model do
  #ユーザー名、メールアドレス、パスワードがあれば有効なこと
  it "is valid with name, mail, and password, password_confirmation" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  # ユーザー名がなければ無効な状態であること
  it "is invalid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without mail" do
    user = FactoryBot.build(:user, mail: nil)
    user.valid?
    expect(user.errors[:mail]).to include("を入力してください")
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # パスワード（確認）がなければ無効な状態であること
  it "is invalid without password_confirmation" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("を入力してください")
  end

  # ユーザー名の長さが50文字以下であれば有効な状態であること
  it "is valid with name of 50 characters or less" do
    user = FactoryBot.build(:user, name: "a" * 30)
    expect(user).to be_valid
  end

  # ユーザー名の長さが51文字以上であれば無効な状態であること
  it "is invalid with name of 51 characters or more" do
    user = FactoryBot.build(:user, name: "a" * 51)
    user.valid?
    expect(user.errors[:name]).to include("は50文字以内で入力してください")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, mail: "tester@example.com")
    user = FactoryBot.build(:user, mail: "tester@example.com")
    user.valid?
    expect(user.errors[:mail]).to include("はすでに存在します")
  end

  # メールアドレスの長さが255文字以下であれば有効な状態であること
  it "is valid with mail of 255 characters or less" do
    user = FactoryBot.build(:user, mail: "a" * 200 + "@example.com")
    expect(user).to be_valid
  end

  # メールアドレスの長さが256文字以上であれば無効な状態であること
  it "is invalid with mail of 256 characters or more" do
    user = FactoryBot.build(:user, mail: "a" * 244 + "@example.com")
    user.valid?
    expect(user.errors[:mail]).to include("は255文字以内で入力してください")
  end

  # メールアドレスに@が含まれていなければ無効な状態であること
  it "is invalid without @ in mail" do
    user = FactoryBot.build(:user, mail: "tester.example.com")
    user.valid?
    expect(user.errors[:mail]).to include("は不正な値です")
  end

  # パスワードの長さが6文字以上であれば有効な状態であること
  it "is valid with password of 6 characters or more" do
    user = FactoryBot.build(:user, password: "a" * 10, password_confirmation: "a" * 10)
    expect(user).to be_valid
  end

  # パスワードの長さが5文字以下であれば無効な状態であること
  it "is invalid with password of 5 characters or less" do
    user = FactoryBot.build(:user, password: "a" * 5, password_confirmation: "a" * 5)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  # パスワードとパスワード（確認）が一致しなければ無効な状態であること
  it "is invalid with matched password and password_confirmation" do
    user = FactoryBot.build(:user, password: "a" * 5, password_confirmation: "a" * 6)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("と新しいパスワードの入力が一致しません")
  end
end
