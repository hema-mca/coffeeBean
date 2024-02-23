require 'rails_helper'

RSpec.describe EventService, type: :model do

  describe 'creation' do

    before(:all) do
      @user = User.create(
        email: Faker::Internet.email,
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    context 'with valid attributes' do
      it 'creates an event' do
        response = EventService.new(type: 'B', user: @user).call
        expect(response[:success]).to be_truthy
        expect(response[:event]).to be_truthy
        expect(response[:errors].count).to eq(0)
      end
    end

    context 'with invalid attributes' do
      it 'does not create an event' do
        response = EventService.new(type: 'BA', user: nil).call
        expect(response[:success]).to be_falsey
        expect(response[:event]).to be_nil
        expect(response[:errors].count).to be_positive
      end
    end
  end

end

