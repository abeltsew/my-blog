require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user1 = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  @user2 = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  @post1 = Post.new(author: @user1, title: 'Hello', text: 'This is my first post')

  subject { Comment.create(post: @post1, author: @user2, text: 'Hi Tom!') }

  before { subject.save }

  it 'should have text ' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'should have an author ' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have an Post ' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to an author' do
    comment = Comment.reflect_on_association('author')
    expect(comment.macro).to eq(:belongs_to)
  end

  it 'should belong to a post' do
    comment = Comment.reflect_on_association('post')
    expect(comment.macro).to eq(:belongs_to)
  end

  it 'updates likes counter of the post' do
    user1 = User.create(
      name: 'Tom', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
      bio: 'Teacher from Mexico.', posts_counter: 0 )
    post1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post',comment_counter: 0, likes_counter: 0)
    Comment.create(post: post1, author: user1, text: 'Hi Tom!')
    commented_post = Post.find_by_author_id(post1.author_id)
    expect(commented_post.comment_counter).to eq 1
  end
end
