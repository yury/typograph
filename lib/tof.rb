require 'rubygems'
require File.dirname(__FILE__) + '/tool'
require "activesupport"

class Tof

  NBSP = "&nbsp;"

  attr_accessor :text, :disabled

  def initialize text
    @text = text
    @disabled = false
    @opts = ActiveSupport::OrderedHash.new
  end

  def add name, opts = {}
    @opts[name] = opts
  end

  def pre_parse

  end

  def parse
    return self.text if self.disabled

    self.pre_parse

    @opts.each_value do |opts|
      next if opts[:disabled]
      replacement = opts[:replacement]
      if replacement.class == Proc
        self.text.sub_each! opts[:pattern], &replacement
      else
        self.text.gsub! opts[:pattern], opts[:replacement]
      end
    end

    self.text
  end

  def post_parse

  end

  def self.run text
    t = self.new text
    t.parse
  end
  
end