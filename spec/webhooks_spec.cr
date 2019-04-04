require "./spec_helper"
require "file"

describe Gitlab do
  Gitlab::Events.each do |event_name, event_class|
    100.times do |i|
      it ".event_from(json) : #{event_class}" do
        file = Dir.glob("./fixtures/#{event_name}/*.json").sample
        json = File.read(file)
        Gitlab.event_from(json).tap do |event|
          case event_class.to_s
          when /System/
            unless event_name == "merge_request"
              event.event_name.should eq(event_name.to_s)
            else
              event.event_type.should eq(event_name.to_s)
            end
          when /Projects/
            event.object_kind.should eq(event_name.to_s)
          end
        end
      end
    end
  end
end
