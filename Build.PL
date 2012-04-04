
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Dist::Zilla like SHARYANTO when you build your dists",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Dist-Zilla-PluginBundle-SHARYANTO",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "Dist::Zilla::PluginBundle::SHARYANTO",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dist::Zilla" => 0,
    "Dist::Zilla::Plugin::CheckChangeLog" => 0,
    "Dist::Zilla::Plugin::InstallRelease" => 0,
    "Dist::Zilla::Plugin::OurPkgVersion" => 0,
    "Dist::Zilla::Plugin::PodWeaver" => 0,
    "Dist::Zilla::Plugin::ReadmeFromPod" => 0,
    "Dist::Zilla::Plugin::Run::Release" => 0,
    "Dist::Zilla::Plugin::TaskWeaver" => 0,
    "Dist::Zilla::Plugin::Test::Compile" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
