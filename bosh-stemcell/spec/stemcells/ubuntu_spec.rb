require 'spec_helper'

describe 'Ubuntu Stemcell' do

  it_behaves_like 'a stemcell'

  describe package('apt') do
    it { should be_installed }
  end

  describe package('rpm') do
    it { should_not be_installed }
  end

  context 'installed by base_debootstrap' do
    {
      'adduser' => '3.113ubuntu2',
      'apt' => '0.8.16~exp12ubuntu10.16',
      'apt-utils' => '0.8.16~exp12ubuntu10.16',
      'bzip2' => '1.0.6-1',
      'console-setup' => '1.70ubuntu5',
      'dash' => '0.5.7-2ubuntu2',
      'debconf' => '1.5.42ubuntu1',
      'isc-dhcp-client' => '4.1.ESV-R4-0ubuntu5.9',
      'eject' => '2.1.5+deb1+cvs20081104-9',
      'gnupg' => '1.4.11-3ubuntu2.5',
      'ifupdown' => '0.7~beta2ubuntu10',
      'initramfs-tools' => '0.99ubuntu13.4',
      'iproute' => '20111117-1ubuntu2.1',
      'iputils-ping' => '3:20101006-1ubuntu1',
      'kbd' => '1.15.2-3ubuntu4',
      'less' => '444-1ubuntu1',
      'locales' => '2.13+git20120306-3',
      'lsb-release' => '4.0-0ubuntu20.3',
      'makedev' => '2.3.1-89ubuntu2',
      'mawk' => '1.3.3-17',
      'module-init-tools' => '3.16-1ubuntu2',
      'net-tools' => '1.60-24.1ubuntu2',
      'netbase' => '4.47ubuntu1',
      'netcat-openbsd' => '1.89-4ubuntu1',
      'ntpdate' => '1:4.2.6.p3+dfsg-1ubuntu3.1',
      'passwd' => '1:4.1.4.2+svn3283-3ubuntu5.1',
      'procps' => '1:3.2.8-11ubuntu6.3',
      'python' => '2.7.3-0ubuntu2.2',
      'sudo' => '1.8.3p1-1ubuntu3.4',
#      'tasksel' => '2.73ubuntu26',
      'tzdata' => '2013g-0ubuntu0.12.04',
      'ubuntu-keyring' => '2011.11.21.1',
      'udev' => '175-0ubuntu9.4',
      'upstart' => '1.5-0ubuntu7.2',
      'ureadahead' => '0.100.0-12',
      'vim-tiny' => '2:7.3.429-2ubuntu2.1',
      'whiptail' => '0.52.11-2ubuntu10',
#      'ubuntu-minimal' => '1.267.1',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    describe file('/etc/lsb-release') do
      it { should be_file }
      it { should contain 'DISTRIB_RELEASE=12.04' }
      it { should contain 'DISTRIB_CODENAME=precise' }
    end
  end

  context 'installed by base_apt' do
    {
      'upstart'              => '1.5-0ubuntu7.2',
      'build-essential'      => '11.5ubuntu2.1',
      'libssl-dev'           => '1.0.1-4ubuntu5.11',
      'lsof'                 => '4.81.dfsg.1-1build1',
      'strace'               => '4.5.20-2.3ubuntu1',
      'bind9-host'           => '1:9.8.1.dfsg.P1-4ubuntu0.7',
      'dnsutils'             => '1:9.8.1.dfsg.P1-4ubuntu0.7',
      'tcpdump'              => '4.2.1-1ubuntu2',
      'iputils-arping'       => '3:20101006-1ubuntu1',
      'curl'                 => '7.22.0-3ubuntu4.6',
      'wget'                 => '1.13.4-2ubuntu1',
      'libcurl3'             => '7.22.0-3ubuntu4.6',
      'libcurl4-openssl-dev' => '7.22.0-3ubuntu4.6', # installed because of 'libcurl3-dev'
      'bison'                => '1:2.5.dfsg-2.1',
      'libreadline6-dev'     => '6.2-8',
      'libxml2'              => '2.7.8.dfsg-5.1ubuntu4.6',
      'libxml2-dev'          => '2.7.8.dfsg-5.1ubuntu4.6',
      'libxslt1.1'           => '1.1.26-8ubuntu1.3',
      'libxslt1-dev'         => '1.1.26-8ubuntu1.3',
      'zip'                  => '3.0-4',
      'unzip'                => '6.0-4ubuntu2',
      'nfs-common'           => '1:1.2.5-3ubuntu3.1',
      'flex'                 => '2.5.35-10ubuntu3',
      'psmisc'               => '22.15-2ubuntu1.1',
      'apparmor-utils'       => '2.7.102-0ubuntu3.9',
      'iptables'             => '1.4.12-1ubuntu5',
      'sysstat'              => '10.0.3-1',
      'rsync'                => '3.0.9-1ubuntu1',
      'openssh-server'       => '1:5.9p1-5ubuntu1.1',
      'traceroute'           => '1:2.0.18-1',
      'libncurses5-dev'      => '5.9-4',
      'quota'                => '4.00-3ubuntu1',
      'libaio1'              => '0.3.109-2ubuntu1',
      'gdb'                  => '7.4-2012.04-0ubuntu2.1',
      'tripwire'             => '2.4.2.2-1',
      'libcap2-bin'          => '1:2.22-1ubuntu3',
      'libcap-dev'           => '1:2.22-1ubuntu3', # installed because of 'libcap2-dev'
      'libbz2-dev'           => '1.0.6-1',
      'libyaml-dev'          => '0.1.4-2',
      'cmake'                => '2.8.7-0ubuntu5',
      'scsitools'            => '0.12-2.1ubuntu1',
      'mg'                   => '20110905-1',
      'htop'                 => '1.0.1-1',
      'module-assistant'     => '0.11.4',
      'debhelper'            => '9.20120115ubuntu3',
      'runit'                => '2.1.1-6.2ubuntu2',
      'sudo'                 => '1.8.3p1-1ubuntu3.4',
      'rsyslog'              => '5.8.6-1ubuntu8.6',
#      'rsyslog-relp'         => '5.8.6-1ubuntu8.5',
      'parted'              => '2.3-8ubuntu5.1',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    describe file('/sbin/rescan-scsi-bus') do
      it { should be_file }
      it { should be_executable }
    end
  end

  context 'installed by system_grub' do
    {
      'grub' => '0.97-29ubuntu66',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end

    %w(e2fs_stage1_5 stage1 stage2).each do |grub_stage|
      describe file("/boot/grub/#{grub_stage}") do
        it { should be_file }
      end
    end
  end

  context 'installed by system_kernel' do
    {
      'linux-image-virtual'       => '3.2.0.58.69',
      'linux-image-extra-virtual' => '3.2.0.58.69',
    }.each do |pkg, version|
      describe package(pkg) do
        it { should be_installed.with_version(version) }
      end
    end
  end

  context 'installed by image_install_grub' do
    describe file('/boot/grub/grub.conf') do
      it { should be_file }
      it { should contain 'default=0' }
      it { should contain 'timeout=1' }
      it { should contain 'title Ubuntu 12.04.3 LTS (3.2.0-58-virtual)' }
      it { should contain '  root (hd0,0)' }
      it { should contain '  kernel /boot/vmlinuz-3.2.0-58-virtual ro root=UUID=' }
      it { should contain ' selinux=0' }
      it { should contain '  initrd /boot/initrd.img-3.2.0-58-virtual' }
    end

    describe file('/boot/grub/menu.lst') do
      before { pending 'until aws/openstack stop clobbering the symlink with "update-grub"' }
      it { should be_linked_to('./grub.conf') }
    end
  end

  context 'installed by bosh_user' do
    describe file('/etc/passwd') do
      it { should be_file }
      it { should contain '/home/vcap:/bin/bash' }
    end
  end

  context 'installed by system_parameters' do
    describe file('/var/vcap/bosh/etc/operating_system') do
      it { should contain('ubuntu') }
    end
  end

  context 'installed by bosh_harden' do
    describe 'disallow unsafe setuid binaries' do
      subject { backend.run_command('find / -xdev -perm +6000 -a -type f')[:stdout].split }

      it { should match_array(%w(/bin/su /usr/bin/sudo /usr/bin/sudoedit)) }
    end

    describe 'disallow root login' do
      subject { file('/etc/ssh/sshd_config') }

      it { should contain /^PermitRootLogin no$/ }
    end
  end

  context 'installed by system-aws-network', exclude_on_vsphere: true do
    describe file('/etc/network/interfaces') do
      it { should be_file }
      it { should contain 'auto eth0' }
      it { should contain 'iface eth0 inet dhcp' }
    end
  end

  context 'installed by rsyslog' do
    describe file('/etc/init/rsyslog.conf') do
      it { should contain('/usr/local/sbin/rsyslogd') }
    end
  end
end

