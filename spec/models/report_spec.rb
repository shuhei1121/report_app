require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryBot.build(:report)
  end

  describe '報告書作成' do
    context '報告書の作成ができる場合' do
      it '全ての項目を入力すれば作成できる' do
        expect(@report).to be_valid
      end

      it 'receiverが空でも作成できる' do
        @report.receiver = nil
        expect(@report).to be_valid
      end
    end

    context '報告書の作成ができない場合' do
      it 'titleが空では作成できない' do
        @report.title = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("タイトルを入力してください")
      end        

      it 'titleが16文字以上の場合作成できない' do
        @report.title = "testtesttesttest"
        @report.valid?
        expect(@report.errors.full_messages).to include("タイトルは15文字以内で入力してください")
      end

      it 'headlineが空では作成できない' do
        @report.headline= nil
        @report.valid?
        expect(@report.errors.full_messages).to include("件名を入力してください")
      end

      it 'headlineが141文字以上の場合作成できない' do
        @report.headline = "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、"
        @report.valid?
        expect(@report.errors.full_messages).to include("件名は140文字以内で入力してください")
      end

      it 'textが空では作成できない' do
        @report.text = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("本文を入力してください")
      end

      it 'textが1001文字以上の場合作成できない' do
        @report.text = "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ"
        @report.valid?
        expect(@report.errors.full_messages).to include("本文は1000文字以内で入力してください")
      end

      it 'dateが空では作成できない' do
        @report.date = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("日付を入力してください")
      end

      it 'format_idが空では作成できない' do
        @report.format_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("書式を入力してください", "書式は数値で入力してください")
      end

      it 'category_idが1(--)では出品できない' do
        @report.format_id = 1
        @report.valid?
        expect(@report.errors.full_messages).to include("書式を選択してください")
      end

      it 'category_idが空では作成できない' do
        @report.category_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーは数値で入力してください")
      end
    
      it 'category_idが1(--)では出品できない' do
        @report.category_id = 1
        @report.valid?
        expect(@report.errors.full_messages).to include("カテゴリーを選択してください")
      end

    end
  end
end
