module Arrivals
  def create_arrivals_html_data
    erb_data = {
      date: '1月7日', count: 50, data: GetRakutenData.new.get_search_data('リング',
                                                shopcode: 'jewelry-total',
                                                hits: 12)
    }
    File.open('test.html', 'w') do |f|
      f.write ErbConversion.new('spec/template/v3_pickups.erb').get_conversion_data(erb_data)
    end
  end

  module_function :create_arrivals_html_data
end
