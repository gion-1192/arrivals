module Arrivals
  RakutenWebService.configuration do |c|
    c.application_id = 'app_id'
  end

  class GetRakutenData
    def get_search_data(keyword, **options)
      searches = { keyword: keyword }.merge(options)
      RakutenWebService::Ichiba::Item.search(searches)
    end
  end
end
