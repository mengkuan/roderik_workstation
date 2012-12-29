node.override['bash_it'] ={
  'enabled_plugins' => {
    'aliases'    => %w[general],
    'completion' => %w[defaults git brew gem rake ssh],
    'plugins'    => %w[base git rvm ssh vagrant ]
  },
  'custom_plugins' => %w[
    bash_it/custom/disable_ctrl-s_output_control.bash
    bash_it/custom/enable_ctrl-o_history_execution.bash
    bash_it/custom/history_settings.bash
    bash_it/custom/ensure_usr_local_bin_first.bash
    bash_it/custom/add_user_initials_to_git_prompt_info.bash
  ],
  'theme' => 'bobby',
  'dir' => '/etc/bash_it'
}

if node["platform"] == "ubuntu"
    node.override["bash_it"]["bashrc_path"]="/etc/bash.bashrc"
else
    node.override["bash_it"]["bashrc_path"]="/etc/bashrc"
end
