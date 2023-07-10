require 'rails_helper'

RSpec.describe Post, type: :model do
  abel = User.new(name: 'Abel Tsegaye', photo: 'link to photo', bio: 'Make a diffrence', posts_counter: 0)
  subject do
    Post.new(
      title: 'Ai take over the world',
      text: 'Ai take over the world by taking over the world',
      author: abel
    )
  end

  before { subject.save }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should have a positive integer for comments count' do
    subject.comment_counter = -4
    expect(subject).to_not be_valid
  end

  it 'should have a positive integer for likes count' do
    subject.likes_counter = -4
    expect(subject).to_not be_valid
  end

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end


end
