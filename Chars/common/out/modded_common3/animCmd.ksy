meta:
  id: anim_cmd
  ks-debug: false
  ks-opaque-types: false
  encoding: ascii
  endian: be
types:
  command:
    seq:
      - {id: namespace, type: u1}
      - {id: code, type: u1}
      - {id: num_arguments, type: u1}
      - {id: modifier, type: u1}
      - {id: arguments, type: s4}
  instances:

enums:
  module:
    0x00: control_flow
    0x01: control_flow_loop
    0x02: status
    0x03: model
    0x04: motion
    0x05: posture
    0x06: collision
    0x07: controller
    0x08: ground
    0x09: situation
    0x0A: sound
    0x0B: visibility
    0x0C: ft_specific
    0x0D: anim_cmd
    0x0E: kinetic
    0x0F: link
    0x10: generate_article_manage
    0x11: effect
    0x12: work_manage
    0x13: combo
    0x14: ft_area
    0x15: territory
    0x16: target_search
    0x17: physics
    0x18: slope
    0x19: shadow
    0x1A: camera
    0x1B: unk_procedures
    0x1C: ft_stop
    0x1D: shake
    0x1E: damage
    0x1F: item_manage
    0x20: turn
    0x21: color_blend
    0x22: team
    0x23: slow
    0x64: ft_cancel
    0x65: unk_sse_x65
    0x66: unk_sse_x66
    0x69: unk_sse_x69
    0x6A: unk_sse_x6a
  commands:
    # 0x00: control_flow
    0x00_01_01_00: synchronous_timer
    0x00_02_00_00: no_event
    0x00_02_01_00: asynchronous_timer
    0x00_03_00_00: flow_03
    0x00_04_01_00: set_loop
    0x00_05_00_00: execute_loop
    0x00_06_00_00: loop_break
    0x00_07_01_00: sub_routine
    0x00_08_00_00: return
    0x00_09_01_00: goto
    0x00_0A_01_00: if_req
    0x00_0A_02_00: if_req_equals
    0x00_0A_04_00: if_comparison
    0x00_0B_01_00: and_req
    0x00_0B_02_00: and_req_equals
    0x00_0B_04_00: and_comparison
    0x00_0C_01_00: or_req
    0x00_0C_02_00: or_req_equals
    0x00_0C_04_00: or_comparison
    0x00_0D_01_00: else_if_req
    0x00_0D_02_00: else_if_req_equals
    0x00_0D_04_00: else_if_comparison
    0x00_0E_00_00: else
    0x00_0F_00_00: end_if
    0x00_10_02_00: switch
    0x00_11_01_00: case
    0x00_12_00_00: default_case
    0x00_13_00_00: end_switch
    0x00_18_00_00: break
    # 0x01: control_flow_loop
    0x01_00_00_00: go_to_loop_rest_01
    0x01_01_00_00: load_rest
    0x01_02_00_00: go_to_loop_rest_02
    # 0x02: status
    0x02_00_03_00: change_action_status
    0x02_00_04_00: change_action_status
    0x02_00_06_00: change_action_status
    0x02_01_02_00: change_action
    0x02_01_03_00: change_action
    0x02_01_05_00: change_action
    0x02_04_01_00: additional_requirement
    0x02_04_02_00: additional_requirement
    0x02_04_04_00: additional_requirement
    0x02_05_03_00: additional_action_interrupts_requirement
    0x02_05_04_00: additional_action_interrupts_requirement
    0x02_05_06_00: additional_action_interrupts_requirement
    0x02_06_01_00: enable_action_status_id
    0x02_08_01_00: disable_action_status_id
    0x02_09_02_00: invert_action_status_id
    0x02_0A_01_00: allow_specific_interrupt
    0x02_0B_01_00: prevent_specific_interrupt
    0x02_0C_01_00: clear_prevent_interrupt
    0x02_0D_01_00: change_reading_action
    # 0x03: model
    0x03_01_04_00: override_bone_rotate
    0x03_02_02_00: override_bone_rotate_x
    0x03_03_02_00: override_bone_rotate_y
    0x03_04_02_00: override_bone_rotate_z
    0x03_06_04_00: override_bone_scale
    0x03_07_02_00: override_bone_scale_x
    0x03_08_02_00: override_bone_scale_y
    0x03_09_02_00: override_bone_scale_z
    0x03_0B_04_00: override_bone_offset
    0x03_0C_02_00: override_bone_offset_z_0_c
    0x03_0D_02_00: override_bone_offset_z_0_d
    0x03_0E_02_00: override_bone_offset_z_0_e
    # 0x04: motion
    0x04_00_01_00: change_sub_action
    0x04_00_02_00: change_sub_action
    0x04_01_02_00: set_requirement_01
    0x04_02_01_00: set_requirement
    0x04_02_02_00: set_requirement
    0x04_02_04_00: set_requirement
    0x04_03_01_00: set_extra_requirement
    0x04_03_02_00: set_extra_requirement
    0x04_03_04_00: set_extra_requirement
    0x04_06_01_00: set_animation_frame
    0x04_07_01_00: frame_speed_modifier
    0x04_08_03_00: set_bone_motion_override
    0x04_09_01_00: sub_action_09
    0x04_0A_01_00: sub_actions_0_a
    0x04_0B_01_00: sub_actions_0_b
    0x04_0C_01_00: change_sub_action_reverse_play
    0x04_0D_01_00: end_bone_motion_override
    0x04_14_01_00: set_animation_timer_frame
    # 0x05: posture
    0x05_00_00_00: reverse_direction
    0x05_01_00_00: left_direction
    0x05_02_00_00: right_direction
    0x05_03_00_00: set_direction
    0x05_04_00_00: decide_direction
    0x05_05_01_00: change_model_size
    0x05_06_03_00: rotate_character_model
    0x05_09_03_00: teleportation_stage_based
    0x05_0A_03_00: teleportation_stage_based_2
    0x05_0B_03_00: teleportation_character_based
    0x05_0C_00_00: reverse_model_direction_transient
    # 0x06: collision
    0x06_00_0D_00: offensive_collision
    0x06_01_02_00: change_hitbox_damage
    0x06_02_02_00: change_hitbox_size
    0x06_03_01_00: delete_hitbox
    0x06_04_00_00: terminate_collisions
    0x06_05_01_00: body_collision
    0x06_06_01_00: undo_bone_collision
    0x06_08_02_00: bone_collision
    0x06_0A_08_00: catch_collision
    0x06_0C_01_00: delete_catch_collision
    0x06_0D_00_00: terminate_catch_collisions
    0x06_0E_11_00: throw_attack_collision
    0x06_0F_05_00: throw_collision
    0x06_10_11_00: inert_collision
    0x06_14_02_00: add_hitbox_damage
    0x06_15_0F_00: special_offensive_collision
    0x06_16_01_00: hitbox_damage_multiplier
    0x06_17_03_00: defensive_collision
    0x06_18_03_00: delete_defensive_collision
    0x06_19_2F_00: special_offensive_collision_enemy_hitbox
    0x06_1B_05_00: move_hitbox
    0x06_1E_03_00: defensive_collision_property
    0x06_24_10_00: generate_defensive_collision_bubble
    0x06_2B_0D_00: thrown_collision
    0x06_2C_0F_00: special_collateral_collision
    0x06_2D_00_00: collisions_2_d
    # 0x07: controller
    0x07_00_00_00: reset_flick_x
    0x07_01_00_00: reset_flick_y
    0x07_02_00_00: reset_button_press
    0x07_03_03_00: start_mashing_3
    0x07_03_04_00: start_mashing_4 
    0x07_03_05_00: start_mashing_5 
    0x07_03_06_00: start_mashing_6
    0x07_04_01_00: add_clatter_time_1
    0x07_04_02_00: add_clatter_time_2
    0x07_05_01_00: subtract_clatter_time 
    0x07_06_01_00: nothing_due_to_bug
    0x07_07_02_00: rumble
    0x07_08_02_00: stop_rumble_kind
    0x07_09_02_00: rumble_unk1
    0x07_0A_02_00: rumble_unk2
    0x07_0B_02_00: rumble_loop
    0x07_0C_00_00: clear_buffer
    # 0x08: ground
    0x08_00_01_00: set_aerial_or_onstage
    0x08_01_01_00: set_cliff_check
    0x08_02_01_00: select_cliff_hang_data
    0x08_03_01_00: set_exclusive_line_attr
    0x08_04_01_00: set_passable_check
    0x08_05_00_00: modify_rhombus_x05
    0x08_07_01_00: pass_through_floor_if_possible
    0x08_08_01_00: attach_ground
    0x08_09_01_00: set_shape_flag
    0x08_0A_01_00: set_gr_collision_mode
    0x08_0B_01_00: attach_to_surface
    0x08_0C_00_00: detach_from_surface
    0x08_0D_00_00: module_start_trace
    0x08_0E_00_00: module_get_trace_target_vec
    0x08_0F_00_00: module_get_trace_target_posture_pos
    0x08_10_00_00: module_renew_tarce
    0x08_11_00_00: module_end_trace
    0x08_13_00_00: module_get_dist_from_current_trace
    0x08_14_00_00: module_get_trace_vec_from_line
    0x08_15_00_00: ground_module_update # hothead: module_get_trace_distance_from_line
    0x08_16_00_00: initialize_ecb
    0x08_17_00_00: modify_rhombus_x17
    0x08_18_00_00: modify_rhombus_x18
    0x08_19_00_00: modify_rhombus_x19
    0x08_1A_01_00: modify_flag
    0x08_1B_01_00: set_evt_to_ground_status
    # 0x09: situation    
    0x09_00_01_00: module09_00
    # 0x0A: sound    
    0x0A_00_01_00: sound_effect
    0x0A_01_01_00: stepping_sound_effect
    0x0A_02_01_00: sound_effect_transient
    0x0A_03_01_00: stop_sound_effect
    0x0A_05_01_00: victory_sound_effect
    0x0A_06_00_00: stop_transient_sound_effect
    0x0A_07_01_00: sound_effect_occurs_when_landing
    0x0A_08_00_00: call_setted_sound_effect
    0x0A_09_01_00: landing_sound_effect
    0x0A_0A_01_00: impact_sound_effect
    # 0x0B: visibility    
    0x0B_00_02_00: model_changer
    0x0B_01_02_00: model_changer_permanent
    0x0B_02_01_00: visibility
    0x0B_03_01_00: undo_model_changer
    # 0x0C: ft_specific
    0x0C_01_00_00: character_specific_01
    0x0C_04_00_00: set_state_aerial
    0x0C_05_00_00: terminate_article__ft_transform
    0x0C_06_00_00: enter_final_smash_state
    0x0C_07_00_00: exit_final_smash_state
    0x0C_07_01_00: exit_final_smash_state_bool
    0x0C_08_00_00: terminate_self__ft_remove_dragoon
    0x0C_09_01_00: enable__disable_ledgegrab
    0x0C_0A_01_00: broadcast_special_taunt_event
    0x0C_0B_00_00: low_voice_clip
    0x0C_0C_00_00: slow_stage_speed
    0x0C_0D_00_00: reset_stage_speed
    0x0C_0E_00_00: stop_stage_speed
    0x0C_0F_00_00: slow_stage_speed
    0x0C_10_00_00: broadcast_stage_enter_end
    0x0C_11_00_00: broadcast_result_end
    0x0C_12_00_00: attach_item_hold_anim
    0x0C_13_00_00: remove_item_hold_anim
    0x0C_14_02_00: generate_article_win
    0x0C_15_01_00: remove_article_win
    0x0C_16_00_00: disable_magifying_glass
    0x0C_17_01_00: unk_ra_bit_27
    0x0C_17_02_00: unk_ra_bit_27_variable
    0x0C_18_00_00: play_random_sfx_pool1
    0x0C_19_00_00: play_rand_damage_sfx
    0x0C_1A_02_00: play_sound_from_projectile_item
    0x0C_1_B01_00: broadcast_result_win
    0x0C_1C_02_00: set_staling_id_with0
    0x0C_1C_03_00: set_staling_id
    0x0C_1D_00_00: play_teeter_sfx
    0x0C_1E_00_00: play_teeter_or_attack_sfx
    0x0C_1F_00_00: play_module_eat_sfx
    0x0C_20_02_00: add_int_stat_to_log
    0x0C_21_02_00: add_float_stat_to_log
    0x0C_23_02_00: set_slow_effect_enemy_fighter
    0x0C_24_01_00: broadcast_yoshi_egg_start_or_end
    0x0C_25_01_00: set_tag_display
    0x0C_26_01_00: set_ft_manager_bool
    0x0C_27_00_00: character_specific_27
    0x0C_27_01_00: set_movement_module_bool
    0x0C_28_00_00: detach_if_attached_and_reset_movement
    0x0C_2A_01_00: set_ft_manager_bool2
    0x0C_2B_00_00: reset_combo_meter
    # 0x0D: anim_cmd    
    0x0D_00_02_00: concurrent_infinite_loop
    0x0D_01_01_00: terminate_concurrent_infinite_loop
    # 0x0E: kinetic
    0x0E_00_01_00: set_air_ground
    0x0E_01_02_00: add_subtract_momentum
    0x0E_02_00_00: reset_momentum
    0x0E_02_01_00: reset_certain_momentum
    0x0E_04_01_00: enable_specified_movement
    0x0E_05_01_00: disable_specified_movement
    0x0E_06_01_00: disallow_certain_movements
    0x0E_07_01_00: reallow_certain_movements
    0x0E_08_02_00: set_momentum
    0x0E_08_04_00: set_add_momentum
    0x0E_0B_02_00: graphic_model_specf
    # 0x0F: link
    0x0F_03_02_00: link_03
    # 0x10: generate_article_manage
    0x10_00_01_00: generate_article
    0x10_00_02_00: generate_article_subaction_exclusive
    0x10_01_01_00: article_event_02
    0x10_01_02_00: set_ex_anchored_article_action
    0x10_02_01_00: only_article_event
    0x10_03_01_00: remove_article
    0x10_04_02_00: set_article_action
    0x10_04_03_00: set_anchored_article_action
    0x10_05_02_00: article_visibility
    0x10_07_02_00: set_article_action_07
    0x10_08_02_00: set_remote_article_action
    0x10_0A_03_00: link_article_to_bone
    0x10_0C_02_00: article_frame_speed
    0x10_13_01_00: link_character_and_article
    # 0x11: effect
    0x11_00_10_00: graphic_effect
    0x11_01_0A_00: graphic_effect_attached
    0x11_02_0A_00: graphic_effect_attached_2
    0x11_03_14_00: sword_glow
    0x11_04_17_00: sword_hammer_glow
    0x11_05_01_00: terminate_sword_glow
    0x11_0B_05_00: graphic_effect_reoccurs_when_move
    0x11_0D_01_00: end_graphic_effect_reoccurs_when_move
    0x11_14_02_00: terminate_all_graphic_effect
    0x11_15_03_00: terminate_graphic_effect
    0x11_19_0A_00: graphic_effect_attached_19
    0x11_17_06_00: screen_tint_full
    0x11_17_07_00: screen_tint
    0x11_18_02_00: end_screen_tint
    0x11_1A_10_00: graphic_effect_stepping
    0x11_1B_10_00: graphic_effect_landing
    0x11_1C_10_00: graphic_effect_tumbling
    0x11_1E_01_00: set_flashing_effect
    0x11_1F_01_00: end_flashing_effect
    # 0x12: work_manage
    0x12_00_02_00: basic_variable_set
    0x12_01_02_00: basic_variable_add
    0x12_02_02_00: basic_variable_subtract
    0x12_03_01_00: basic_variable_increment
    0x12_04_01_00: basic_variable_decrement
    0x12_05_03_00: basic_variable_random
    0x12_06_02_00: float_variable_set
    0x12_07_02_00: float_variable_add
    0x12_08_02_00: float_variable_subtract
    0x12_09_03_00: float_variable_random
    0x12_0A_01_00: bit_variable_set
    0x12_0B_01_00: bit_variable_clear
    0x12_0D_02_00: basic_variable_multiply
    0x12_0E_02_00: basic_variable_divide
    0x12_0F_02_00: float_variable_multiply
    0x12_10_02_00: float_variable_divide
    0x12_11_02_00: basic_variable_set_absolute
    0x12_12_02_00: float_variable_set_absolute
    # 0x13: combo
    # 0x14: ft_area
      # AREA IDs
      # 0 = nop?, empty presenter used by boxes that dont outwardly state their function
      # 1 = surrounds ecb, unknown purpose
      # 2 = footstool event
      # 3 = under feat in air
      # 4 = item grabbox presented action? if an item wants to know if in range? no items have the counterpart afaik
      # 5 = eatbox (17) presented action, same as above
      # 6 =
      # 7 =
      # 8 = 
      # 9 = surrounds ecb of all subspace enemies
      # 10 = unk 
      # 11 = subspace ai controller logic? theres a tonne of presenters on each primid + surrounding entire stage
      # 12 =  
      # 13 = 
      # 14 = footstoolbox for subspace enemies e.g. koopas/goombas
      # 15 = 
      # 16 = 
      # 17 = kirby/wario/dedede item "eatbox", also used for shell item bounce e.g. autofootstol. also on all items even if not edible/jumpable
      # 18 = small item
      # 19 = large item
      # 20 = unk 
      # 21 = doors/subspace springs/Catapult/barrel
      # 22 = ladder
      # 23 = elevator
      # 24 = unk,
      # 25 = surrounds ecb 
      # 26 = whispy wind, gravity changer etc + aesthetic wind.
      # 27 = conveyor
      # 28 = water 
      # 29 = Dedede Waddle grab range 
      # 30 = surrounds ecb
      # 31 = spring
    0x14_00_02_00: toggle_fighter_area_frames
    0x14_01_01_00: toggle_fighter_area
    0x14_04_01_00: terminate_wind_effect
    0x14_05_01_00: set_gimmick_effect_flag
    0x14_07_0A_00: create_aesthetic_wind_effects
    # 0x15: territory
    # 0x16: target_search
    # 0x17: physics
    0x17_00_00_00: havok_physics_enable
    0x17_01_00_00: havok_physics_disable
    0x17_03_01_00: havok_physics_gravity 
    0x17_05_00_00: havok_sleep
    0x17_05_01_00: havok_sleep_bool
    0x17_06_01_00: havok_status
    0x17_07_00_00: havok_set2nd_2
    0x17_08_00_00: havok_set2nd_wind_0
    # 0x18: slope
    0x18_00_01_00: slope_contour_stand
    0x18_01_02_00: slope_contour_stand_02
    0x18_01_03_00: slope_contour_stand_03
    0x18_03_02_00: character_specific_03
    # 0x19: shadow
    0x19_01_00_00: module19_01
    # 0x1A: camera
    0x1A_00_01_00: screenshake
    0x1A_03_04_00: set_camera_boundaries
    0x1A_04_05_00: camera_closeup
    0x1A_06_01_00: detach_attach_camera_close
    0x1A_07_01_00: detach_attach_camera_far
    0x1A_08_00_00: normal_camera
    0x1A_0B_00_00: disable_camera_zoom
    0x1A_0C_00_00: enable_camera_zoom
    # 0x1B: unk_procedures
    # 0x1C: ft_stop
    0x1C_00_02_00: set_hitlag
    0x1C_01_01_00: set_hitlag_force 
    # 0x1D: shake
    # 0x1E: damage
    0x1E_00_02_00: super_heavy_armor
    0x1E_03_01_00: add_subtract_damage
    # 0x1F: item_manage
    0x1F_00_01_00: pickup_item
    0x1F_00_02_00: pickup_item
    0x1F_01_03_00: throw_item
    0x1F_02_00_00: drop_item
    0x1F_03_01_00: consume_item
    0x1F_04_02_00: change_beam_sword_size
    0x1F_05_00_00: fire_weapon
    0x1F_06_01_00: fire_projectile
    0x1F_07_01_00: rocket_operation
    0x1F_08_01_00: generate_item
    0x1F_09_01_00: held_items_visibility
    0x1F_0A_00_00: delete_held_item
    0x1F_0B_01_00: change_item_bone_id
    0x1F_0C_01_00: weapon_operation
    0x1F_0D_00_00: release_assist
    0x1F_0E_05_00: throw_item
    0x1F_0F_01_00: wearable_items_visibility
    # 0x20: turn
    # 0x21: color_blend
    0x21_01_04_00: flash_overlay_effect
    0x21_02_05_00: change_flash_overlay_color
    0x21_05_06_00: flash_light_effect
    0x21_07_05_00: change_flash_light_color
    0x21_00_00_00: terminate_flash_effect
    # 0x22: team
    # 0x23: slow
    # 0x64: ft_cancel
    0x64_00_00_00: allow_interrupt
    0x64_01_00_00: disallow_interrupt
    # 0x65: unk_sse_x65
    # 0x66: unk_sse_x66
    # 0x69: unk_sse_x69
    # 0x6A: unk_sse_x6a
  x00_control_flow_commands:
    0x01: synchronous_timer
    0x02: asynch_timer
    0x03: reset_timer_on_loop
    0x04: loop_set
    0x05: loop_exec
    0x06: loop_break
    0x07: subroutine
    0x08: goto
    0x09: return
    0x0A: if
    0x0B: and
    0x0C: or
    0x0D: elif
    0x0E: else
    0x10: switch_begin
    0x11: switch_case
    0x12: switch_default
    0x13: switch_end
    0x18: switch_break
  x01_control_flow_loop_commands:
    0x00: go_to_loop_rest_1
    0x01: load_rest
    0x02: go_to_loop_rest_2
  x02_status_commands:
    0x00: change_action_status
    0x01: change_action
    0x04: additional_requirement
    0x05: additional_action_interrupts_requirement
    0x06: enable_action_status_id
    0x08: disable_action_status_id
    0x09: invert_action_status_id
    0x0A: allow_specific_interrupt
    0x0B: prevent_specific_interrupt
    0x0D: change_reading_action
    0x0C: clear_prevent_interrupt
  x03_model_commands:
    0x01: override_bone_rotate
    0x06: override_bone_scale
    0x0B: override_bone_offset
    0x02: override_bone_rotate_x
    0x03: override_bone_rotate_y
    0x04: override_bone_rotate_z
    0x07: override_bone_scale_x
    0x08: override_bone_scale_y
    0x09: override_bone_scale_z
    0x0C: override_bone_offset_z_unk_x0c
    0x0D: override_bone_offset_z_unk_x0d
    0x0E: override_bone_offset_z_unk_x0e
  x04_motion_commands:
    0x00: change_subaction
    0x01: set_requirement_x01
    0x02: set_requirement_x02
    0x03: set_extra_requirement
    0x06: set_animation_frame
    0x07: frame_speed_modifier
    0x08: set_partial_anim_chr
    0x09: unk_change_subaction_x09
    0x0A: unk_subaction_x0a
    0x0B: unk_subaction_frame_speed_x0b
    0x0C: change_subaction_and_animate_in_reverse
    0x0D: remove_partial_anim_chr
    0x0E: remove_partial_frame
    0x0F: set_partial_rate
    0x10: add_other_anim
    0x11: remove_other_anim
    0x12: set_other_anim_frame
    0x13: set_other_anim_rate
    0x14: set_anim_timer_and_frame
    0x15: set_partial_frame_sync
    0x16: set_weight_rate
    0x17: set_animation_weight
    0x18: set_kind_offset
    0x19: unk_motion_x19
    0x1A: set_next_shared_animation
  x05_posture_commands:
    0x00: reverse_direction
    0x01: queue_change_direction_left
    0x02: queue_change_direction_right
    0x03: queue_change_direction_control_stick
    0x04: execute_direction_change
    0x0C: reverse_model_direction_transient
    0x05: change_model_size
    0x06: rotate_character_model
    0x09: teleport_position_absolute_x09
    0x0A: teleport_position_absolute_x0a
    0x0B: teleport_position_relative
  x06_collision_commands:
    0x00: offensive_collision
    0x01: change_hitbox_damage
    0x02: change_hitbox_size
    0x03: delete_hitbox
    0x04: terminate_collisions
    0x05: body_collision
    0x06: reset_bone_collision
    0x08: set_bone_collision
    0x0A: catch_collision
    0x0C: delete_catch_collision
    0x0D: delete_catch_collision
    0x0E: throw_attack_collision
    0x0F: throw_collision
    0x10: intert_detection_collision
    0x14: add_hitbox_damage
    0x15: special_offensive_collision
    0x16: hitbox_damage_multiplier
    0x17: defensive_collision
    0x18: delete_defensive_collision
    0x19: sse_enemy_offensive_collision
    0x1B: move_hitbox
    0x1C: set_front
    0x1D: set_projectiles_can_bounce
    0x1E: set_can_reflect_projectiles
    0x1F: clear_all
    0x20: generate_shield_collision_bubble
    0x24: generate_defensive_collision_bubble
    0x2B: thrown_collision
    0x2C: special_collateral_collision
    0x2D: unk_collision_x2d
  x07_controller_commands:
    0x00: reset_flick_x
    0x01: reset_flick_y
    0x02: reset_button_press
    0x03: start_mashing
    0x04: add_clatter_time
    0x05: remove_clatter_time
    0x06: nothing_due_to_bug
    0x07: rumble
    0x08: stop_rumble_kind
    0x09: rumble_unk1
    0x0A: rumble_unk2
    0x0B: rumble_loop
    0x0C: clear_controller_buffer
  x08_ground_commands:
    0x00: set_aerial_or_onstage
    0x01: set_cliff_check
    0x02: select_cliff_hang_data
    0x03: set_exclusive_line_attr
    0x04: set_passable_check
    0x05: modify_rhombus_x05
    0x07: pass_through_floor_if_possible
    0x08: attach_ground
    0x09: set_shape_flag
    0x0A: set_gr_collision_mode
    0x0B: attach_to_surface
    0x0C: detach_from_surface
    0x0D: module_start_trace
    0x0E: module_get_trace_target_vec
    0x0F: module_get_trace_target_posture_pos
    0x10: module_renew_tarce
    0x11: module_end_trace
    0x13: module_get_dist_from_current_trace
    0x14: module_get_trace_vec_from_line
    0x15: ground_module_update # hothead: module_get_trace_distance_from_line
    0x16: initialize_ecb
    0x17: modify_rhombus_x17
    0x18: modify_rhombus_x18
    0x19: modify_rhombus_x19
    0x1A: modify_flag
    0x1B: set_evt_to_ground_status
  x09_situation_commands:
    0x00: set_air_ground
  x0a_sound_commands:
    0x00: play_sfx
    0x01: play_sfx_with_terrain_sfx
    0x02: play_action_sfx
    0x03: stop_sfx
    0x05: play_sfx_taunt_victory
    0x06: stop_all_transient_sfx
    0x07: play_sfx_upon_landing
    0x08: play_specified_landing_sfx
    0x09: play_sfx_with_terrain_landing_sfx
    0x0A: play_sfx_with_terrain_impact_sfx
  x0b_visibility_commands:
    0x00: change_model_temp
    0x01: change_model_permanent
    0x02: set_visibility
    0x03: undo_changed_model
  x0c_ft_specific_commands:
    0x04: set_state_aerial
    0x05: terminate_article__ft_transform
    0x06: article_load__ft_start_final
    0x07: end_final
    0x08: terminate_self__ft_remove_dragoon
    0x09: enable__disable_ledgegrab
    0x0A: broadcast_special_taunt_event
    0x0B: play_low_sfx
    0x0C: final_slow
    0x0D: cancel_slow
    0x0E: final_stop
    0x0F: cancel_stop
    0x10: broadcast_stage_enter_end
    0x11: broadcast_result_end
    0x12: attach_item_hold_anim
    0x13: remove_item_hold_anim
    0x14: generate_article_win
    0x15: remove_article_win
    0x16: disable_magnifying_glass
    0x17: unk_ra_bit_27
    0x18: play_random_sfx_pool1
    0x19: play_rand_damage_sfx
    0x1A: play_sound_from_projectile_item
    0x1B: broadcast_result_win
    0x1C: set_staling_id
    0x1D: play_teeter_sfx
    0x1E: play_teeter_or_attack_sfx
    0x1F: play_module_eat_sfx
    0x20: add_int_stat_to_log
    0x21: add_float_stat_to_log
    0x23: set_slow_effect_enemy_fighter
    0x24: broadcast_yoshi_egg_start_or_end
    0x25: set_tag_display
    0x26: set_ft_manager_bool
    0x27: set_movement_module_bool
    0x28: detach_if_attached_and_reset_movement
    0x2A: set_ft_manager_bool2
    0x2B: reset_combo_meter
  x0d_anim_cmd_commands:
    0x00: concurrent_infinite_loop
    0x01: terminate_concurrent_loop
  x0e_kinetic_commands:
    0x00: set_kinetic_air_ground_state
    0x01: add_subtract_momentum
    0x02: reset_momentum
    0x04: enable_specified_movement
    0x05: disable_specified_movement
    0x06: disallow_certain_movements
    0x07: reallow_certain_movements
    0x08: set_momentum
    0x0B: graphic_model_specf
  x0f_link_commands:
    0x03: unk_link_x03
  x10_generate_article_manage_commands:
    0x00: generate_article
    0x01: article_perform_animation
    0x02: article_exclusive_event
    0x03: remove_article
    0x04: set_article_action
    0x05: article_visibility
    0x07: set_other_article_action_07
    0x08: set_remote_article_action
    0x0C: article_frame_speed
    0x0A: link_article_to_bone
    0x13: link_character_and_article
  x11_effect_commands:
    0x00: request_gfx
    0x01: request_attached_gfx
    0x02: request_attached_gfx_in_facing_direction
    0x03: request_sword_trail_after_image
    0x04: request_hammer_trail_after_image
    0x05: remove_all_after_image
    0x09: request_attached_gfx_resnode
    0x0A: request_attached_gfx_resnode_in_facing_direction
    0x0B: request_gfx_regen_after_dist_inplace
    0x0D: request_gfx_regen_after_dist
    0x10: request_attached_gfx_scaled
    0x11: request_attached_gfx_scaled_in_facing_direction
    0x12: request_attached_gfx_scaled_resnode
    0x13: request_attached_gfx_scaled_resnode_in_facing_direction
    0x14: terminate_all_gfx
    0x15: terminate_specific_gfx
    0x17: screen_tint_init
    0x18: screen_tint_end
    0x19: request_attached_gfx_unkinfo
    0x1A: request_gfx_from_ground_material_step_offset_x10
    0x1B: request_gfx_from_ground_material_land_offset_x28
    0x1C: request_gfx_from_ground_material_tumble_offset_x40
    0x1E: flashing_effect_init
    0x1F: flashing_effect_end
    
  x14_ft_area_commands:
    0x04: terminate_wind_effects
    0x05: set_gimmick_effect_flag
    0x07: create_aesthetic_wind_effects

  x17_physics_commands:
    0x00: havok_physics_enable
    0x01: havok_physics_disable
    0x03: havok_physics_gravity
    0x05: havok_sleep
    0x06: havok_status
    0x07: set2nd_2
    0x08: set2nd_wind_0
  
  x1c_ft_stop_commands:
    0x00: set_hitlag
    0x01: set_hitlag_force