module Arrivals
  def create_arrivals_html_data
    erb_data = {
      date: '1月7日', count: 50, data: GetRakutenData.new.get_search_data(nil,
                                                shopCode: 'jewelry-total',
                                                sort: 'standard',
                                                hits: 12)
    }


    File.open('html/test.html', 'w') do |f|
      f.write ErbConversion.new('spec/template/v3_pickups.erb').get_conversion_data(erb_data)
    end
  end

  def create_ranking_html_data
    erb_data = {
      data: {
          'jewelry' => GetRakutenData.new.get_search_data('ジュエリー',
                                                    shopCode: 'jewelry-total',
                                                    sort: '-updateTimestamp',
                                                    minPrice: '30000',
                                                    hits: 3),
          'brand' => GetRakutenData.new.get_search_data('ブランド',
                                                    shopCode: 'jewelry-total',
                                                    sort: '-updateTimestamp',
                                                    minPrice: '30000',
                                                    hits: 3),
          'watch' => GetRakutenData.new.get_search_data('時計',
                                                    shopCode: 'jewelry-total',
                                                    sort: '-updateTimestamp',
                                                    minPrice: '30000',
                                                    hits: 3)
      }
    }
    File.open('html/test.html', 'w') do |f|
      f.write ErbConversion.new('template/ranking.erb').get_conversion_data(erb_data)
    end
  end

  module_function :create_arrivals_html_data
  module_function :create_ranking_html_data
end
