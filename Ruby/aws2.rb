require 'aws-sdk'
configs = YAML.load(File.read(ARGV.first))
AWS.config(configs)
ec2 = AWS::EC2.new

EXPIRED = 30

instances = ec2.regions[configs['region']].instances

puts "Starting backups"
instances.each do |server|

  unless server.status == "stopped"
    disks = server.block_device_mappings.to_a
    disks.each do |disk|
      p server.id
      p disk.last.volume.create_snapshot("BACKUP OF #{server.id} at #{Time.now.strftime("%b-%d-%Y")}")
    end
  end
end

puts "Removing old snapshots of #{EXPIRED} days or older."
#ec2.snapshots.with_owner(configs['ownerid']).filter('description','*BACKUP*').each{|snapshot| p (Time.now - snapshot.start_time)/86400 > EXPIRED ? "Too Old" : "Not that old"}
