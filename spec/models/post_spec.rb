require "rails_helper"

RSpec.describe Post, type: :model do
  # サークル名、大学名、本文があれば有効なこと
  it "is valid with circle_name, university, and body" do
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

  # サークル名がなければ無効な状態であること
  it "is invalid without circle_name" do
    post = FactoryBot.build(:post, circle_name: nil)
    post.valid?
    expect(post.errors[:circle_name]).to include("を入力してください")
  end

  # 大学名がなければ無効な状態であること
  it "is invalid without university" do
    post = FactoryBot.build(:post, university: nil)
    post.valid?
    expect(post.errors[:university]).to include("を入力してください")
  end

  # 本文がなければ無効な状態であること
  it "is invalid without body" do
    post = FactoryBot.build(:post, body: nil)
    post.valid?
    expect(post.errors[:body]).to include("を入力してください")
  end

  # サークル名の長さが30文字以下であれば有効な状態であること
  it "is valid with cirle_name of 30 characters or less" do
    post = FactoryBot.build(:post, circle_name: "a" * 20)
    expect(post).to be_valid
  end

  # サークル名の長さが31文字以上であれば無効な状態であること
  it "is invalid with cirle_name of 31 characters or more" do
    post = FactoryBot.build(:post, circle_name: "a" * 31)
    post.valid?
    expect(post.errors[:circle_name]).to include("は30文字以内で入力してください")
  end

  # 大学名の長さが30文字以下であれば有効な状態であること
  it "is valid with university of 30 characters or less" do
    post = FactoryBot.build(:post, university: "a" * 20)
    expect(post).to be_valid
  end

  # 大学名の長さが31文字以上であれば無効な状態であること
  it "is invalid with university of 31 characters or more" do
    post = FactoryBot.build(:post, university: "a" * 31)
    post.valid?
    expect(post.errors[:university]).to include("は30文字以内で入力してください")
  end

  # 本文の長さが2000文字以下であれば有効な状態であること
  it "is valid with body of 2000 characters or less" do
    post = FactoryBot.build(:post, body: "a" * 1000)
    expect(post).to be_valid
  end

  # サークル名の長さが2001文字以上であれば無効な状態であること
  it "is invalid with body of 2001 characters or more" do
    post = FactoryBot.build(:post, body: "a" * 2001)
    post.valid?
    expect(post.errors[:body]).to include("は2000文字以内で入力してください")
  end
end
