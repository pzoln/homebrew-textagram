#!/usr/bin/env ruby
# frozen_string_literal: true

require "open-uri"

DEFAULT_FORMULA_PATH = "Formula/tg.rb"
REPO = "pzoln/tg"
TARGETS = {
  /version "[^"]+"/ => ->(tag, _) { %(version "#{tag.delete_prefix("tg-v")}") },
  %r{url "https://github\.com/pzoln/tg/releases/download/tg-v[^/]+/tg-v[^"]+-aarch64-apple-darwin\.tar\.gz"} =>
    ->(tag, _) { %(url "https://github.com/#{REPO}/releases/download/#{tag}/#{tag}-aarch64-apple-darwin.tar.gz") },
  %r{url "https://github\.com/pzoln/tg/releases/download/tg-v[^/]+/tg-v[^"]+-x86_64-unknown-linux-gnu\.tar\.gz"} =>
    ->(tag, _) { %(url "https://github.com/#{REPO}/releases/download/#{tag}/#{tag}-x86_64-unknown-linux-gnu.tar.gz") },
  /(aarch64-apple-darwin\.tar\.gz"\n\s+sha256 ")[^"]+(")/ =>
    ->(_, checksums) { "\\1#{checksums.fetch(:mac)}\\2" },
  /(x86_64-unknown-linux-gnu\.tar\.gz"\n\s+sha256 ")[^"]+(")/ =>
    ->(_, checksums) { "\\1#{checksums.fetch(:linux)}\\2" },
}.freeze

def prompt_version
  $stdout.print("Release version (e.g. 0.1.0-beta.1): ")
  $stdin.gets&.strip.to_s
end

def normalize_version(value)
  value.to_s.sub(/\Atg-v/, "")
end

def fetch_checksums(tag)
  sums_url = "https://github.com/#{REPO}/releases/download/#{tag}/#{tag}-SHA256SUMS.txt"
  [URI.open(sums_url).read, sums_url]
rescue OpenURI::HTTPError => error
  abort("Failed to download #{sums_url}: #{error.message}")
end

def checksum_for(contents, archive)
  contents.each_line do |line|
    checksum, file = line.strip.split(/\s+/, 2)
    next unless checksum && file

    return checksum if file.sub(/\A\*/, "") == archive
  end

  nil
end

def replace!(content, pattern, replacement, formula_path)
  updated = content.sub(pattern, replacement)
  abort("Failed to update #{pattern.inspect} in #{formula_path}") if updated == content
  updated
end

version = normalize_version(ARGV[0].nil? ? prompt_version : ARGV[0])
abort("Release version is required.") if version.empty?

formula_path = ARGV.fetch(1, DEFAULT_FORMULA_PATH)
tag = "tg-v#{version}"
checksums_text, sums_url = fetch_checksums(tag)

checksums = {
  mac: checksum_for(checksums_text, "#{tag}-aarch64-apple-darwin.tar.gz"),
  linux: checksum_for(checksums_text, "#{tag}-x86_64-unknown-linux-gnu.tar.gz"),
}

if checksums.value?(nil)
  abort("Missing expected checksum entries in #{sums_url}")
end

content = File.read(formula_path)
TARGETS.each do |pattern, replacement|
  content = replace!(content, pattern, replacement.call(tag, checksums), formula_path)
end

File.write(formula_path, content)
puts "Updated #{formula_path} for #{tag}"
