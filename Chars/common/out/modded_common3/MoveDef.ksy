meta:
  id: movedef
  ks-debug: false
  ks-opaque-types: false
  endian: be
  encoding: ascii
  imports:
    - animCmd
seq:
  - id: header
    type: sakurai_header
    size: 0x20
  - id: body
    type: sakurai_body
    size: header.size - 0x20
types: 
  sakurai_header:
    seq:
    - id: size
      type: s4
    - id: lookup_entry_offset
      type: s4
    - id: lookup_entry_count
      type: s4
    - id: section_count
      type: s4
    - id: external_subroutine_count
      type: s4
    - id: padding
      size-eos: true
  sakurai_body:
    instances:
      lookup_entries:
        pos: _parent.header.lookup_entry_offset
        type: lookup_table(
          _parent.header.lookup_entry_count,
          _parent.header.section_count,
          _parent.header.external_subroutine_count)
      sections:
        pos: 0
        type: section(lookup_entries.sections[_index], lookup_entries.string_table_pos)
        repeat: expr
        repeat-expr: _parent.header.section_count
    types:
      lookup_table:
        params:
          - id: lookup_count
            type: u4
          - id: section_count
            type: u4
          - id: external_subroutine_count
            type: u4
        seq:
          - id: entries
            type: lookup_entry
            repeat: expr
            repeat-expr: lookup_count
          - id: sections
            type: section_entry
            repeat: expr
            repeat-expr: section_count
          - id: external_subroutines
            type: external_subroutine_entry
            repeat: expr
            repeat-expr: external_subroutine_count
          - size: 0
            if: string_table_pos < 0
        instances:
          string_table_pos:
            value: _io.pos
      lookup_entry:
        seq:
          - id: entry_offset
            type: s4
      section_entry:
        seq:
          - id: content_offset
            type: s4
          - id: string_offset
            type: s4
      external_subroutine_entry:
        seq:
          - id: offset_linked_list
            type: s4
          - id: string_offset 
            type: s4
      section:
        params:
          - id: entry
            type: section_entry
          - id: string_table_pos
            type: u4
        enums:
          section_type:
            -1: unk
            1: anim_cmd
            2: data_common
            3: data
        instances:
          name:
            pos: string_table_pos + entry.string_offset
            type: strz
          data_pos:
            value: entry.content_offset
          data:
            pos: entry.content_offset
            type:
              switch-on: |
                name.substring(0, 12) == 'gameAnimCmd_'
                or name.substring(0, 14) == 'effectAnimCmd_'
                or name.substring(0, 19) == 'statusAnimCmdGroup_'
                or name.substring(0, 17) == 'statusAnimCmdPre_'
                or name.substring(0, 18) == 'statusAnimCmdExit_'
                or name.substring(0, 14) == 'statusAnimCmd_'
                ? section_type::anim_cmd
                  : name == 'dataCommon'
                  ? section_type::data_common
                    : section_type::unk
              # section_type::data
              cases:
                'section_type::anim_cmd': anim_cmd # anim_cmd_stuff
                'section_type::data': arc_fighter_data
                'section_type::data_common': arc_fighter_data_common
                _: u4
      external_subroutine:
        params:
          - id: entry
            type: external_subroutine_entry
          - id: string_table_pos
            type: u4
        instances:
          name:
            pos: string_table_pos + entry.string_offset
            type: strz
          offsets: 
            pos: entry.offset_linked_list
            type: s4
            repeat: until
            repeat-until: _ == 0
      arc_fighter_data:
        seq:
          - {id: subaction_flags_start, type: s4}
          - {id: model_visibility_start, type: s4}
          - {id: attribute_start, type: s4}
          - {id: sse_attribute_start, type: s4}
          - {id: misc_section_offset, type: s4}
          - {id: common_action_flags_start, type: s4}
          - {id: action_flags_start, type: s4}
          - {id: unknown7, type: s4}
          - {id: action_interrupts, type: s4}
          - {id: entry_actions_start, type: s4}
          - {id: exit_actions_start, type: s4}
          - {id: action_pre_start, type: s4}
          - {id: subaction_main_start, type: s4}
          - {id: subaction_gfx_start, type: s4}
          - {id: subaction_sfx_start, type: s4}
          - {id: subaction_other_start, type: s4}
          - {id: anchored_item_positions, type: s4}
          - {id: gooey_bomb_positions, type: s4}
          - {id: bone_ref1, type: s4}
          - {id: bone_ref2, type: s4}
          - {id: entry_action_overrides_start, type: s4}
          - {id: exit_action_overrides_start, type: s4}
          - {id: unknown22, type: s4}
          - {id: samus_arm_cannon_positions, type: s4}
          - {id: unknown24, type: s4}
          - {id: static_articles_start, type: s4}
          - {id: entry_articles_start, type: s4}
          - {id: flags1, type: s4}
          - {id: flags2, type: s4}
      arc_fighter_data_common:
        seq:
          - {id: global_ics, type: s4}
          - {id: global_ics_sse, type: s4}
          - {id: ics, type: s4}
          - {id: ics_sse, type: s4}
          - {id: entry_actions_start, type: s4}
          - {id: exit_actions_start, type: s4}
          - {id: flash_overlay_array, type: s4}
          - {id: unk7, type: s4}
          - {id: unk8, type: s4}
          - {id: item_swing_data, type: s4}
          - {id: unk10, type: s4}
          - {id: unk11_offset_table, type: s4}
          - {id: unk12, type: s4}
          - {id: unk13, type: s4}
          - {id: unk14, type: s4}
          - {id: unk15, type: s4}
          - {id: unk16, type: s4}
          - {id: patter_power_mul, type: s4}
          - {id: rgba_color, type: s4}
          - {id: flash_overlay_offset, type: s4}
          - {id: screen_tints, type: s4}
          - {id: leg_bones, type: s4}
          - {id: unk22_table_reference, type: s4}
        instances:
          entry_actions:
            pos: entry_actions_start
            type: action_pointer
            repeat: expr
            repeat-expr: 0x112
          exit_actions:
            pos: exit_actions_start
            type: action_pointer
            repeat: expr
            repeat-expr: 0x112
          unk22_list:
            pos: unk22_table_reference
            type: unk22_table
        types:
          action_pointer:
            seq:
              - {id: offset, type: s4}
            instances:
              script:
                pos: offset
                type: anim_cmd

      unk22_table:
        seq:
        - id: offset
          type: s4
        - id: length
          type: u4
        instances:
          objects:
            pos: offset
            type: s4
            repeat: expr
            repeat-expr: length
  # list_offset:
  #   params:
  #     - id: contained_type
  #       type: struct
  #   seq:
  #   - id: offset
  #     type: s4
  #   - id: length
  #     type: u4
  #   instances:
  #     objects:
  #       pos: offset
  #       type: contained_type
  #       repeat: expr
  #       repeat-expr: length
  # pointer:
  #   params:
  #     - id: referenced_type
  #       type: struct
  #   seq:
  #     - id: offset
  #       type: s4
  #   instances:
  #     object:
  #       pos: offset
  #       type: referenced_type     
          