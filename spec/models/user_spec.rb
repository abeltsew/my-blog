require 'rails_helper'

RSpec.describe User, type: :model do
    subject {User.new(name: "Abel Tsegaye", photo: "link to photo", bio:"Make a diffrence", posts_counter: 0 )}

    before {subject.save}

    it 'Should Have a name' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'should not allow non integer values' do
        subject.posts_counter = "hi"
        expect(subject).to_not be_valid
    end

    it 'post counter should be grater than or equal to 0' do
        subject.posts_counter = -2
        expect(subject).to_not be_valid
    end

end