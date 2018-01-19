require 'erb'

module Arrivals
  class ErbConversion
    def template(filename = nil)
      unless filename.nil?
        @template = File.open(filename) do |f|
          ERB.new(f.read)
        end
      end
      @template
    end

    def initialize(filename)
      template(filename)
    end

    def get_conversion_data(erb_data)
      erb_data.each do |key, value|
        instance_variable_set("@#{key}".to_sym, value)
      end
      template.result(binding)
    end
  end
end
