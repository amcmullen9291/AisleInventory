# app/jobs/hello_world_job.rb
# frozen_string_literal: true
class HelloWorldJob < ApplicationJob
    queue_as :low_priority
  def perform
      puts 'Hello World!'
    end
  end