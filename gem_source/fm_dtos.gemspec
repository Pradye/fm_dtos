# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fm_dtos/version"

Gem::Specification.new do |s|
  s.name        = "fm_dtos"
  s.version     = FmDtos::VERSION
  s.authors     = ["Internet Business Systems Australia"]
  s.email       = ["gem@ibsglobalweb.com"]
  s.homepage    = 'http://www.ibsglobalweb.com/gems'
  s.summary     = 'DTOs used for communication between finance manager modules'
  s.description = 'The purpose of this gem is to maintain the data transfer ' \
                  'objects (DTOs) that form the contract for communication ' \
                  'between finance manager systems. These DTOs must be ' \
                  'versioned and that version respected in order to maintain ' \
                  'the integrity of the contract. The DTO version is ' \
                  'distinct from the gem version'

  s.metadata['allowed_push_host'] = 'https://geminabox.bryk.ai'
  s.metadata['homepage_uri'] = s.homepage

  s.files         = Dir.glob("lib/**/*")
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake', '~> 12.0'
end
