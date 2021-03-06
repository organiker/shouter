require 'spec_helper'

describe User do 
	it "#can_follow? unless self" do
		user = create(:user)
		expect(user.can_follow?(user)).to eq(false)
		# or should syntax
		# user.can_follow?(user).should == false
	end

	it "#can_follow? unless already following" do
		user = create(:user)
		followed_user = create(:user)
		user.follow followed_user
		user.can_follow?(followed_user).should == false
	end

	it "#can_follow? everyone else" do
		follower = create(:user)
		unfollowed_user = create(:user)
		expect(follower.can_follow?(unfollowed_user)).to eq(true)
	end
end