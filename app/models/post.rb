# -*- coding: utf-8 -*-

class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  field :url

  validates_presence_of :title, :description, :url
end
