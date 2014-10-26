# -*- coding: utf-8 -*-

Pod::Spec.new do |s|
  s.name         = "Parallel"
  s.version      = "0.0.1"
  s.summary      = "Perform selectors on a background thread with callbacks."

  s.description  = <<-DESC
Parallel allows you to perform selectors on a background thread, without spawning a new thread every time you want to perform a selector. This is useful when you want to frequently perform tasks in the background and don't want to muck around with run loops.
                   DESC
  s.homepage     = "http://github.com/AjayMT/Parallel"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Ajay MT" => "ajay.tatachar@gmail.com" }
  s.social_media_url   = "http://twitter.com/ajaymadhusudan"
  s.platform     = :osx, "10.9"
  s.source       = { :git => "http://github.com/AjayMT/Parallel.git", :tag => "0.0.1" }
  s.source_files  = "Parallel"
  s.exclude_files = "ParallelTests"
  s.requires_arc = true
end
