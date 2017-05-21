# frozen_string_literal: true

require 'application/application'

describe Application do
  it 'should respond to :run' do
    expect(Application).to respond_to(:run)
  end
end
