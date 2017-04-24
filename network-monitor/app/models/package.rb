class Package
  include Mongoid::Document
  field :from_ip, type: String
  field :to_ip, type: String
  field :time, type: Timestamp
  field :protocol, type: String
  field :is_tcp, type: Mongoid::Boolean
end
