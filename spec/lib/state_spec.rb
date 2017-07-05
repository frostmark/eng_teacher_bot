# frozen_string_literal: true

require_relative '../../lib/state'

describe State do
  subject!(:state_instance) { described_class.new(user_id, default_state) }
  let!(:user_id) { 1234 }
  let!(:default_state) { '/home' }

  describe '##user_init?' do
    it 'returns true' do
      expect(described_class.user_init?(user_id)).to be true
    end
  end

  describe '#change_state' do
    before { state_instance.change_state('/add') }

    it { expect(state_instance.state).to eq '/add' }
  end

  context 'when several instances' do
    before do
      5.times do |i|
        described_class.new(i, default_state)
      end
    end

    describe '##find' do
      it 'returns state with user id eq 1' do
        expect(described_class.find(1).user_id).to eq 1
      end
    end
  end
end
