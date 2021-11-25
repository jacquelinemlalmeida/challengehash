require "gruf"

Gruf.configure do |c|
  path = '/app/protos/'
  $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
  Dir.glob("#{path}/**/*_pb.rb").each do |path|
    load path
  end
  
  c.default_client_host = '0.0.0.0:50051'
end