require "fluent/plugin/filter"

module Fluent
  module Plugin
    class ArraySpinFilter < Fluent::Plugin::Filter
      Fluent::Plugin.register_filter("array_spin", self)
      
      desc "Key name to spin"
      config_param :key_name, :string
      
      desc "Keep original key in parsed result."
      config_param :reserve_key, :bool, default: false
      
      desc "Store parsed values as a hash value in a field in case of value is not an object."
      config_param :hash_value_field, :string, default: "data"
      
      def filter_stream(tag, es)
        new_es = Fluent::MultiEventStream.new
        
        es.each do |time, record|
          record[@key_name].each do |r|
            new_record = record.clone
            
            if r.is_a?(Hash) then
              new_record.update(r)
            else
              new_record[@hash_value_field] = r.clone
            end
            
            if !@reserve_key then
              new_record.delete(@key_name)
            end
            
            new_es.add(time, new_record)
          end
        end
        
        new_es
      end
    end
  end
end
