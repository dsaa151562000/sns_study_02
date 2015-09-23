require 'rails_helper'

describe Relationship do
 #FactoryGirlでユーザーオブジェクトを作成 letで定義されたfollower、followedへ
  let(:follower) { FactoryGirl.create(:snsstudy) }
  let(:followed) { FactoryGirl.create(:snsstudy) }
  #followerと連携したrelationshipsオブジェクトを生成 followed_idはfollowedのidに
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  #subject itの主題 relationshipオブジェクト
  subject { relationship }
  #relationshipオブジェクトのバリデーションが成功
  it { should be_valid }

  describe "フォロワーについて" do
    it { should respond_to(:follower) }    #relationship  obj にメソッド follower が定義されている
    it { should respond_to(:followed) }    #relationship  obj にメソッド followed が定義されている
    its(:follower) { should eq follower }  #このfollowerは　belongs_to :follower, class_name: "Snsstudy"と同じ
    its(:followed) { should eq followed }  #このfollowedは　belongs_to :followed, class_name: "Snsstudy"と同じ
  end
end




