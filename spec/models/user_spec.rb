require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    context "can save" do
      it "is valid with required value" do
        expect(build(:user)).to be_valid
      end
    end
    context "can not save" do
      context "with blank" do
        it 'is invalid without nickname' do
          user = build(:user, nickname: nil)
          user.valid?
          expect(user.errors[:nickname]).to include("を入力してください")
        end

        it 'is invalid without email' do
          user = build(:user, email: nil)
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end

        it 'is invalid without password' do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end

        it 'is invalid without password_confirmation' do
          user = build(:user, password_confirmation: "")
          user.valid?
          expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
        end

        it 'is invalid with password more than 6 words' do
          user = build(:user, password: 'aaaaaa')
          user.valid?
          expect(user.errors[:password]).to include("は7文字以上で入力してください")
        end

        it 'is invalid without first_name' do
          user = build(:user, first_name: nil)
          user.valid?
          expect(user.errors[:first_name]).to include('を入力してください')
        end
        it 'is invalid without family_name' do
          user = build(:user, family_name: nil)
          user.valid?
          expect(user.errors[:family_name]).to include('を入力してください')
        end
        it 'is invalid without hurigana_first' do
          user = build(:user, hurigana_first: nil)
          user.valid?
          expect(user.errors[:hurigana_first]).to include('を入力してください')
        end
        it 'is invalid without hurigana_family' do
          user = build(:user, hurigana_family: nil)
          user.valid?
          expect(user.errors[:hurigana_family]).to include('を入力してください')
        end
        it 'is invalid without birthday' do
          user = build(:user, birthday: nil)
          user.valid?
          expect(user.errors[:birthday]).to include('を入力してください')
        end
      end
      context 'with invalid input letter type' do
        it 'is invalid with password more than 6 words' do
          user = build(:user, password: 'aaaaaa')
          user.valid?
          expect(user.errors[:password]).to include("は7文字以上で入力してください")
        end
        it 'is invalid with half letter space at first_name' do
          user = build(:user, first_name: 'aa')
          user.valid?
          expect(user.errors[:first_name]).to include('は全角で入力してください')
        end
        it 'is invalid with half letter space at family_name' do
          user = build(:user, family_name: 'aa')
          user.valid?
          expect(user.errors[:family_name]).to include('は全角で入力してください')
        end
        it 'is invalid without hiragana at hurigana_first' do
          user = build(:user, hurigana_first: '漢字')
          user.valid?
          expect(user.errors[:hurigana_first]).to include('は全角ひらがなで入力してください')
        end
        it 'is invalid without hiragana at hurigana_family' do
          user = build(:user, hurigana_family: '漢字')
          user.valid?
          expect(user.errors[:hurigana_family]).to include('は全角ひらがなで入力してください')
        end
      end
    end
  end
end