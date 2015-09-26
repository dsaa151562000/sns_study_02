require 'rails_helper'

describe Relationship do
 #FactoryGirlでユーザーオブジェクトを作成 letで定義されたfollower、followedへ
  let(:follower) { FactoryGirl.create(:snsstudy) }
  let(:followed) { FactoryGirl.create(:snsstudy) }
  #followerと連携したrelationshipsオブジェクトを生成 followed_idはfollowedのidに
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  #subject itの主題 relationshipオブジェクト
  subject { relationship }


  it { should be_valid }  #relationshipオブジェクトの生成が成功

  it { should respond_to(:follower_id) }     #relationship  obj にメソッドfollower_idが定義されている
  it { should respond_to(:followed_id) }     #relationship  obj にメソッドfollowed_idが定義されている

  #follower_idの空白は無効
  it { is_expected.to validate_presence_of(:follower_id) }

  #followed_idの空白は無効
  it { is_expected.to validate_presence_of(:followed_id) }


  describe "フォロワーについて snsstudyとfollowerが連携　snsstudyとfollowedが連携している" do
    it { should respond_to(:follower) }    #relationship  obj にメソッド follower が定義されている
    it { should respond_to(:followed) }    #relationship  obj にメソッド followed が定義されている
    its(:follower) { should eq follower }  #このfollowerは　belongs_to :follower, class_name: "Snsstudy" snsstudyと同じ
    its(:followed) { should eq followed }  #このfollowedは　belongs_to :followed, class_name: "Snsstudy" snsstudyと同じ
  end



end




