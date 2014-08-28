require 'rails_helper'

describe Photo do
  it "tags a user in a photo" do
    user = User.create(username: "moof", email: "email", password: "abc")
    user2 = User.create(username: "austin", email: "email", password: "abc")
    photo = Photo.create(description: "pretty picture")
    photo.users << user
    photo.users << user2
    expect(photo.users).to eq [user, user2]
  end

  it "retains the photo's original user_id between tags" do
    user = User.create(username: "moof", email: "email", password: "abc")
    user2 = User.create(username: "austin", email: "email", password: "abc")
    photo = user.photos.create(description: "pretty picture")
    expect(photo.user_id).to eq user.id
    photo.users << user2
    expect(photo.users).to eq [user2]
    expect(photo.user_id).to eq user.id
  end

end
