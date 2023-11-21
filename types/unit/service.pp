# @summary Possible keys for the [Service] section of a unit file
# @see https://www.freedesktop.org/software/systemd/man/systemd.service.html
# @see https://www.freedesktop.org/software/systemd/man/systemd.exec.html
#
type Systemd::Unit::Service = Struct[
  {
    Optional['AmbientCapabilities']       => Variant[Pattern[/^CAP_[A-Z_]+$/],Array[Pattern[/^CAP_[A-Z_]+$/],1]],
    Optional['UMask']                     => String[3,4],
    Optional['User']                      => String[1],
    Optional['Group']                     => String[1],
    Optional['DynamicUser']               => Boolean,
    Optional['SupplementaryGroups']       => Variant[String[0],Array[String[0],1]],
    Optional['WorkingDirectory']          => String[0],
    Optional['Type']                      => Enum['simple', 'exec', 'forking', 'oneshot', 'dbus', 'notify', 'idle'],
    Optional['ExitType']                  => Enum['main', 'cgroup'],
    Optional['RemainAfterExit']           => Boolean,
    Optional['GuessMainPID']              => Boolean,
    Optional['PIDFile']                   => Stdlib::Unixpath,
    Optional['BusName']                   => String[1],
    Optional['ExecStart']                 => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStartPre']              => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStartPost']             => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecCondition']             => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecReload']                => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStop']                  => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['ExecStopPost']              => Variant[Systemd::Unit::Service::Exec,Array[Systemd::Unit::Service::Exec,1]],
    Optional['KillSignal']                => Pattern[/^SIG[A-Z]+$/],
    Optional['KillMode']                  => Enum['control-group', 'mixed', 'process', 'none'],
    Optional['Nice']                      => Variant[String[0,0],Integer[-20,19]],
    Optional['IOSchedulingClass']         => Enum['','realtime','best-effort','idle'],
    Optional['IOSchedulingPriority']      => Variant[String[0,0],Integer[0,7]],
    Optional['SyslogIdentifier']          => String,
    Optional['LogLevelMax']               => Enum['emerg','alert','crit','err','warning','notice','info','debug'],
    Optional['LimitCPU']                  => Pattern['^\d+(s|m|h|d|w|M|y)?(:\d+(s|m|h|d|w|M|y)?)?$'],
    Optional['LimitFSIZE']                => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitDATA']                 => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitSTACK']                => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitCORE']                 => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitRSS']                  => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitNOFILE']               => Variant[Integer[-1],Pattern['^(infinity|\d+(:(infinity|\d+))?)$']],
    Optional['LimitAS']                   => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitNPROC']                => Variant[Integer[-1],Pattern['^(infinity|\d+(:(infinity|\d+))?)$']],
    Optional['LimitMEMLOCK']              => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitLOCKS']                => Integer[1],
    Optional['LimitSIGPENDING']           => Integer[1],
    Optional['LimitMSGQUEUE']             => Pattern['^(infinity|((\d+(K|M|G|T|P|E)?(:\d+(K|M|G|T|P|E)?)?)))$'],
    Optional['LimitNICE']                 => Variant[Integer[0,40], Pattern['^(-\+([0-1]?[0-9]|20))|([0-3]?[0-9]|40)$']],
    Optional['LimitRTPRIO']               => Integer[0],
    Optional['LimitRTTIME']               => Pattern['^\d+(ms|s|m|h|d|w|M|y)?(:\d+(ms|s|m|h|d|w|M|y)?)?$'],
    Optional['CPUAccounting']             => Boolean,
    Optional['CPUShares']                 => Integer[2,262144],
    Optional['StartupCPUShares']          => Integer[2,262144],
    Optional['CPUQuota']                  => Pattern['^([1-9][0-9]*)%$'],
    Optional['MemoryAccounting']          => Boolean,
    Optional['MemoryLow']                 => Pattern['\A(infinity|\d+(K|M|G|T|%)?(:\d+(K|M|G|T|%)?)?)\z'],
    Optional['MemoryMin']                 => Pattern['\A(infinity|\d+(K|M|G|T|%)?(:\d+(K|M|G|T|%)?)?)\z'],
    Optional['MemoryHigh']                => Pattern['\A(infinity|\d+(K|M|G|T|%)?(:\d+(K|M|G|T|%)?)?)\z'],
    Optional['MemoryMax']                 => Pattern['\A(infinity|\d+(K|M|G|T|%)?(:\d+(K|M|G|T|%)?)?)\z'],
    Optional['MemoryLimit']               => Pattern['\A(infinity|\d+(K|M|G|T|%)?(:\d+(K|M|G|T|%)?)?)\z'],
    Optional['MemorySwapMax']             => Pattern['\A(infinity|\d+(K|M|G|T|%)?(:\d+(K|M|G|T|%)?)?)\z'],
    Optional['TasksAccounting']           => Boolean,
    Optional['TasksMax']                  => Variant[Integer[1],Pattern['^(infinity|([1-9][0-9]?$|^100)%)$']],
    Optional['IOAccounting']              => Boolean,
    Optional['IOWeight']                  => Integer[1,10000],
    Optional['StartupIOWeight']           => Integer[1,10000],
    Optional['IODeviceWeight']            => Array[Hash[Stdlib::Absolutepath, Integer[1,10000], 1, 1]],
    Optional['IOReadBandwidthMax']        => Array[Hash[Stdlib::Absolutepath, Pattern['^(\d+(K|M|G|T)?)$'], 1, 1]],
    Optional['IOWriteBandwidthMax']       => Array[Hash[Stdlib::Absolutepath, Pattern['^(\d+(K|M|G|T)?)$'], 1, 1]],
    Optional['IOReadIOPSMax']             => Array[Hash[Stdlib::Absolutepath, Pattern['^(\d+(K|M|G|T)?)$'], 1, 1]],
    Optional['IOWriteIOPSMax']            => Array[Hash[Stdlib::Absolutepath, Pattern['^(\d+(K|M|G|T)?)$'], 1, 1]],
    Optional['DeviceAllow']               => String[1],
    Optional['DevicePolicy']              => Enum['auto','closed','strict'],
    Optional['Slice']                     => String[1],
    Optional['Delegate']                  => Boolean,
    Optional['OOMScoreAdjust']            => Integer[-1000,1000],
    Optional['RestartSec']                => String,
    Optional['TimeoutStartSec']           => String,
    Optional['TimeoutStopSec']            => String,
    Optional['TimeoutAbortSec']           => String,
    Optional['TimeoutAbortSec']           => String,
    Optional['TimeoutSec']                => String,
    Optional['TimeoutStartFailureMode']   => Enum['terminate', 'abort', 'kill'],
    Optional['TimeoutStopFailureMode']    => Enum['terminate', 'abort', 'kill'],
    Optional['RuntimeMaxSec']             => String,
    Optional['RuntimeRandomizedExtraSec'] => String,
    Optional['WatchdogSec']               => String,
    Optional['Restart']                   => Enum['no', 'on-success', 'on-failure', 'on-abnormal', 'on-watchdog', 'on-abort', 'always'],
    Optional['SuccessExitStatus']         => String,
    Optional['RestartPreventExitStatus']  => String,
    Optional['RestartForceExitStatus']    => String,
    Optional['RootDirectoryStartOnly']    => Boolean,
    Optional['NonBlocking']               => Boolean,
    Optional['NotifyAccess']              => Enum['none', 'default', 'main', 'exec',  'all'],
    Optional['OOMPolicy']                 => Enum['continue', 'stop','kill'],
    Optional['OOMScoreAdjust']            => Integer[-1000,1000],
    Optional['Environment']               => String,
    Optional['EnvironmentFile']           => Variant[
      Stdlib::Unixpath,Pattern[/-\/.+/],
      Array[Variant[Stdlib::Unixpath,Pattern[/-\/.+/]],1],
    ],
    Optional['StandardOutput']            => Variant[Enum['inherit','null','tty','journal','kmsg','journal+console','kmsg+console','socket'],Pattern[/\A(file:|append:|truncate:).+$\z/]],
    Optional['StandardError']             => Variant[Enum['inherit','null','tty','journal','kmsg','journal+console','kmsg+console','socket'],Pattern[/\A(file:|append:|truncate:).+$\z/]],
    Optional['StandardInput']             => Variant[Enum['null','tty','tty-force','tty-fail','data','socket'], Pattern[/\A(file:|fd:).+$\z/]],
    Optional['PrivateTmp']                => Boolean,
    Optional['RuntimeDirectory']          => String,
    Optional['RuntimeDirectoryMode']      => Stdlib::Filemode,
    Optional['StateDirectory']            => String,
    Optional['LogsDirectory']             => String,
    Optional['LogsDirectoryMode']         => Stdlib::Filemode,
    Optional['ProtectSystem']             => Variant[Boolean, Enum['full', 'strict']],
    Optional['ProtectHome']               => Variant[Boolean, Enum['read-only', 'tmpfs']],
    Optional['BindPaths']                 => Variant[Stdlib::Unixpath,Pattern[/-\/.+/], Array[Variant[Stdlib::Unixpath,Pattern[/-\/.+/]],1]],
    Optional['BindReadOnlyPaths']         => Variant[Stdlib::Unixpath,Pattern[/-\/.+/], Array[Variant[Stdlib::Unixpath,Pattern[/-\/.+/]],1]],
    Optional['PrivateDevices']            => Boolean,
    Optional['RemoveIPC']                 => Boolean,
    Optional['ProtectKernelModules']      => Boolean,
    Optional['ProtectKernelTunables']     => Boolean,
    Optional['ProtectControlGroups']      => Boolean,
    Optional['RestrictRealtime']          => Boolean,
    Optional['RestrictAddressFamilies']   => Variant[Enum['AF_UNIX', 'AF_INET', 'AF_INET6', 'AF_NETLINK', 'none'], Array[Enum['AF_UNIX', 'AF_INET', 'AF_INET6', 'AF_NETLINK', 'none']]],
    Optional['RestrictNamespaces']        => Variant[Boolean, Enum['ipc', 'net', 'mnt', 'pid', 'user', 'uts', 'cgroup'], Array[Enum['ipc', 'net', 'mnt', 'pid', 'user', 'uts', 'cgroup']]],
    Optional['SystemCallArchitectures']   => Variant[String, Array[String]],
    Optional['SystemCallFilter']          => Variant[String, Array[String]],
    Optional['SystemCallErrorNumber']     => String,
    Optional['ProtectClock']              => Boolean,
    Optional['PrivateUsers']              => Boolean,
    Optional['ProtectKernelLogs']         => Boolean,
    Optional['ProtectProc']               => Enum['noaccess', 'invisible', 'ptraceable', 'default'],
    Optional['ProtectHostname']           => Boolean,
    Optional['RestrictSUIDSGID']          => Boolean,
    Optional['CapabilityBoundingSet']     => Variant[String, Array[String]],
    Optional['NoNewPrivileges']           => Boolean,
    Optional['LockPersonality']           => Boolean,
  }
]
