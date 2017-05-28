class Package
  include Mongoid::Document
  field :from, type: String
  field :to, type: String
  field :time, type: String
  field :protocol, type: String
  field :is_tcp, type: Mongoid::Boolean
end
