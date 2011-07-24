if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

require 'rubygems' rescue nil
require 'wirble'
require 'awesome_print'

module AwesomePrintMongoid

  def self.included(base)
    base.send :alias_method, :printable_without_mongoid, :printable
    base.send :alias_method, :printable, :printable_with_mongoid
  end

  # Add Mongoid class names to the dispatcher pipeline.
  #------------------------------------------------------------------------------
  def printable_with_mongoid(object)
    printable = printable_without_mongoid(object)
    return printable if !defined?(Mongoid::Document)

    if printable == :self
      if object.is_a?(Mongoid::Document)
        printable = :mongoid_instance
      end
    elsif printable == :class && object.ancestors.include?(Mongoid::Document)
      printable = :mongoid_class
    end
    printable
  end

  # Format Mongoid instance object.
  #------------------------------------------------------------------------------
  def awesome_mongoid_instance(object)
    return object.inspect if !defined?(ActiveSupport::OrderedHash)

    data = object.fields.keys.sort_by{|k| k}.inject(ActiveSupport::OrderedHash.new) do |hash, name|
      hash[name] = object[name]
      hash
    end
    "#{object} " + awesome_hash(data)
  end

  # Format Mongoid class object.
  #------------------------------------------------------------------------------
  def awesome_mongoid_class(object)
    return object.inspect if !defined?(ActiveSupport::OrderedHash)

    data = object.fields.sort_by{|k| k}.inject(ActiveSupport::OrderedHash.new) do |hash, c|
      hash[c.first] = (c.last.type || "undefined").to_s.underscore.intern
      hash
    end
    "class #{object} < #{object.superclass} " << awesome_hash(data)
  end
end

AwesomePrint.send(:include, AwesomePrintMongoid)


# load wirble
Wirble.init
Wirble.colorize

unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end

# load hirb

IRB.conf[:AUTO_INDENT] = true

if ENV.include?('RAILS_ENV')
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
  
  if ENV['RAILS_ENV'] == 'test'
    require 'test/test_helper'
  end

# for rails 3
elsif defined?(Rails) && !Rails.env.nil? && defined?(ActiveRecord)
  if Rails.logger
    Rails.logger =Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
  if Rails.env == 'test'
    require 'test/test_helper'
  end
else
  # nothing to do
end

if defined?(Mongoid)
  Mongoid.config.logger = Logger.new($stdout)
end

# annotate column names of an AR model
def show(obj)
  y(obj.send("column_names"))
end

puts "> all systems are go wirble/hirb/ap/show <"
