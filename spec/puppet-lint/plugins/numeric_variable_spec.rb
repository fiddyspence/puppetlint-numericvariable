require 'spec_helper'

describe 'numeric_variable' do
  let(:msg) { 'variable is solely numeric' }

  context 'a variable that is a number' do
    let(:code) { "$3 = 'foo'" }

    it 'should only detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(1).in_column(1)
    end
  end
  context 'a variable that is partially a number' do
    let(:code) { "$l33t = 'foo'" }

    it 'should only detect a single problem' do
      expect(problems).to have(0).problem
    end

  end

end
