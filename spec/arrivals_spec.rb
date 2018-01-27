require 'spec_helper'
require 'arrivals'

describe Arrivals do
  context 'Arrivals' do
    it '#create_arrivals_html_data' do
      #Arrivals.create_arrivals_html_data
    end

    it '#create_ranking_html_data' do
      Arrivals.create_ranking_html_data
    end
  end
  context 'GetRakutenData' do
    let(:target) { Arrivals::GetRakutenData.new }
    it '#get_search_rakuten_data' do
      expect(target.get_search_data('', shopcode: 'jewelry-total')).not_to eq nil
    end
  end

  context 'ErbConversion' do
    let(:target) { Arrivals::ErbConversion.new('spec/template/test.erb') }
    it '#get_conversion_data' do
      expect(target.get_conversion_data(test: 'test')).not_to eq nil
    end
  end
end
