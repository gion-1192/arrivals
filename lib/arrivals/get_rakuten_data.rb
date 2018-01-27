module Arrivals
  RakutenWebService.configuration do |c|
    c.application_id = 'app_id'
  end

  class GetRakutenData
    def get_search_data(keyword = nil, **options)
      options[:keyword] = keyword unless keyword.nil?
      RakutenWebService::Ichiba::Item.search(options)
    end
  end
end
