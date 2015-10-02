require 'rails_helper'

describe Relationship do
  #FactoryGirlでユーザーオブジェクトを作成 letで定義されたfollower、followedへ
  let(:follower) { FactoryGirl.create(:snsstudy) }
  let(:followed) { FactoryGirl.create(:snsstudy) }
  #followerと連携したrelationshipsオブジェクトを生成 followed_idはfollowedのidに
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }


  #it { should respond_to(:follower_id) }     #relationship  obj にメソッドfollower_idが定義されている
  it{ expect(relationship).to respond_to(:follower_id) }

  #it { should respond_to(:followed_id) }     #relationship  obj にメソッドfollowed_idが定義されている
  it{ expect(relationship).to respond_to(:follower_id) } 

  #follower_idの空白は無効
  it { is_expected.to validate_presence_of(:followed_id) }

  #followed_idの空白は無効
  it { is_expected.to validate_presence_of(:followed_id) }

  describe "フォロワーについて snsstudyとfollowerが連携　snsstudyとfollowedが連携している" do
    it{ expect(relationship).to respond_to(:follower) }   #relationship  obj にメソッド follower が定義されている
    it{ expect(relationship).to respond_to(:followed) }   #relationship  obj にメソッド followed が定義されている


    it { expect(relationship.follower).to eq(follower) } 
    it { expect(relationship.followed).to eq(followed) } 

  end


end




